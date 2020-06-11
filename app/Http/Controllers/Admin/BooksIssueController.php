<?php

namespace App\Http\Controllers\Admin;

use App\Book;
use App\BookIssue;
use App\Category;
use App\Fine;
use App\Http\Controllers\Controller;
use App\Http\Requests\MassDestroyBooksRequest;
use App\Http\Requests\UpdateBookIssueRequest;
use App\Language;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BooksIssueController extends Controller
{
    public function index()
    {
        abort_unless(\Gate::allows('books_issue_access'), 403);
        $products = BookIssue::all();
        return view('admin.books.index', compact('products'));
    }

    public function create()
    {
        abort_unless(\Gate::allows('books_issue_create'), 403);
        $categories = Category::all();
        $languages = Language::all();
        return view('admin.books.create',compact('users','categories','languages'));
    }

    public function store(Request $request)
    {
        $data = $request->all();

        if(!empty($data['issue_form'])){
            $d1 = Carbon::createFromFormat("Y-m-d",$data['issue_date_from']);
            $d2 = Carbon::createFromFormat("Y-m-d",$data['issue_date_to']);
            $data['issue_date_from'] = $d1->format("Y-m-d H:i:s");
            $data['issue_date_to'] = $d2->format("Y-m-d H:i:s");
            BookIssue::create($data);
            $book = Book::find($data['book_id']);
            $book->available_copies--;
            $book->save();
            if($data['tt']=='stu') {
                return redirect()->route('admin.books.availableBooks');
            }
            return redirect()->route('admin.books.index');
        }
        if(!empty($data['receive_form'])){
            // receive_form
            $issueBook = BookIssue::whereNull('received_date')->where('book_id',$data['book_id'])->where('user_id',$data['user_id'])->first();
            $book = Book::find($issueBook['book_id']);
            $dnow= Carbon::createFromFormat("Y-m-d",$data['received_date']);
            $d1 = Carbon::createFromFormat("Y-m-d H:i:s",$issueBook['issue_date_from']);
            $d2 = Carbon::createFromFormat("Y-m-d H:i:s",$issueBook['issue_date_to']);
            $diffShould = $d1->diffInDays($d2);
            $diffActual = $d1->diffInDays($dnow);
            if($diffActual > $diffShould){
                Fine::create([
                    'book_id'=> $issueBook['book_id'],
                    'user_id' => $issueBook['user_id'],
                    'amount' => $issueBook->bookId->fine*($diffActual-$diffShould),
                    'remarks' => 'System Genrated Fine: fine on "'.$issueBook->bookId->name.'" for delay of '.$diffActual.' Day(s).'
                ]);
            }
            $issueBook->received_date = $dnow->format("Y-m-d H:i:s");
            $issueBook->remarks_at_receive = $data['remarks_at_receive'];
            $issueBook->save();
            $book->available_copies+=1;
            $book->save();
            if($data['tt']=='stu') {
                return redirect()->route('admin.books.myBooks');
            }
            return redirect()->route('admin.books.index');
        }
        $product = BookIssue::create($data);
        return redirect()->route('admin.books.index');
    }

    public function edit($id)
    {
        abort_unless(\Gate::allows('books_issue_edit'), 403);
        $product = BookIssue::find($id);
        $categories = Category::all();
        $languages = Language::all();
        return view('admin.books.edit', compact('product','categories','languages'));
    }

    public function update(UpdateBookIssueRequest $request, $id)
    {
        abort_unless(\Gate::allows('books_issue_edit'), 403);
        $product = BookIssue::find($id);
        $product->update($request->all());
        return redirect()->route('admin.books.index');
    }

    public function show($id)
    {
        abort_unless(\Gate::allows('books_issue_show'), 403);
        $product = BookIssue::find($id);
        $categories = Category::all();
        $languages = Language::all();
        return view('admin.books.show', compact('product','categories','languages'));
    }

    public function destroy($id)
    {
        abort_unless(\Gate::allows('books_issue_delete'), 403);
        $product = BookIssue::find($id);
        $product->delete();
        return back();
    }

    public function massDestroy(MassDestroyBooksRequest $request)
    {
        BookIssue::whereIn('id', request('ids'))->delete();

        return response(null, 204);
    }

    public function issueBook($id=null,$userId=null)
    {
        $books = $id ? Book::where('available_copies','>',0)->whereIn('id',[$id])->get(): Book::where('available_copies','>',0)->get();
        $issuer = [Auth::getUser()];
        $users = User::all();
        $from = 'N/A';
        if(!empty($userId)){
            $users = User::whereIn('id',[$userId])->get();
            $from = 'stu';
        }
        return view('admin.books.issue',compact('users','books','issuer','from'));
    }

    public function bookHistory($id)
    {
        abort_unless(\Gate::allows('books_history'), 403);
        $products = BookIssue::where('book_id',$id)->get();
        $product1 = Book::find($id);

        return view('admin.books.history',compact('products','product1'));
    }

    public function receiveBook($id=null,$userId=null)
    {
        $userInCircle = BookIssue::whereNull('received_date')->select('user_id');
        $from = 'N/A';

        if($id) {
            $userInCircle->where('book_id',$id);
        }
        $userInCircle = $userInCircle->pluck('user_id')->toArray();
        if(empty($userInCircle)){
            $userInCircle = [];
        }
        $users = User::whereIn('id',$userInCircle)->get();
        if(!empty($userId)){
            $from = 'stu';
            $users = User::whereIn('id',[$userId])->get();
        }
        $booksInCircle = BookIssue::whereNull('received_date')->select('book_id');
        if($id) {
            $booksInCircle->where('book_id',$id);
        }
        $booksInCircle = $booksInCircle->pluck('book_id')->toArray();
        if(empty($booksInCircle)){
            $booksInCircle = [];
        }
        $books = Book::whereIn('id',$booksInCircle)->get();

        return view('admin.books.receive',compact('users','books','from'));
    }

    public function submitToday()
    {
        abort_unless(\Gate::allows('submit_today'), 403);
        $products =  $products = BookIssue::whereNull('received_date')->where('user_id',auth()->getUser()->id)->whereDate('issue_date_to',Carbon::now()->format("Y-m-d"))->get();
        return view('admin.books.today', compact('products'));
    }

    public function underFine()
    {
        abort_unless(\Gate::allows('under_fine'), 403);
        $products = BookIssue::whereNull('received_date')->where('user_id',auth()->getUser()->id)->whereDate('issue_date_to','<',Carbon::now()->format("Y-m-d"))->get()->map(function($item){
            $book = Book::find($item['book_id']);
            $dnow= Carbon::now();
            $d1 = Carbon::createFromFormat("Y-m-d H:i:s",$item['issue_date_from']);
            $d2 = Carbon::createFromFormat("Y-m-d H:i:s",$item['issue_date_to']);
            $diffShould = $d1->diffInDays($d2);
            $diffActual = $d1->diffInDays($dnow);
            $item['fine'] = "$ ".($book->fine*($diffActual-$diffShould));
            return $item;
        });
        return view('admin.books.fine', compact('products'));
    }

    public function myBooks()
    {
        abort_unless(\Gate::allows('my_books'), 403);
        $products = BookIssue::whereNull('received_date')->where('user_id',auth()->getUser()->id)->get();
        $products1 = BookIssue::where('user_id',auth()->getUser()->id)->get();;
        return view('admin.books.my', compact('products','products1'));
    }

    public function myFine()
    {
        abort_unless(\Gate::allows('my_fine'), 403);
        $products = Fine::where('user_id',auth()->getUser()->id)->get();
        return view('admin.books.fines', compact('products'));
    }

    public function availableBooks()
    {
        abort_unless(\Gate::allows('available_books'), 403);
        $ids =  BookIssue::whereNull('received_date')->where('user_id',auth()->getUser()->id)->pluck('book_id')->toArray();
        $products = Book::whereNotIn('id',$ids)->get();
        return view('admin.books.available', compact('products'));
    }
}
