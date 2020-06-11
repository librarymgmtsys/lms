<?php

namespace App\Http\Controllers\Admin;

use App\Book;
use App\BookIssue;
use App\Category;
use App\Http\Controllers\Controller;
use App\Http\Requests\MassDestroyProductRequest;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Http\Requests\MassDestroyBooksRequest;
use App\Http\Requests\MassDestroyCategoryRequest;
use App\Http\Requests\MassDestroyFinesRequest;
use App\Http\Requests\MassDestroyLanguageRequest;
use App\Http\Requests\UpdateBooksRequest;
use App\Http\Requests\UpdateFinesRequest;
use App\Language;
use App\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class BooksController extends Controller
{
    public function index()
    {
        abort_unless(\Gate::allows('books_access'), 403);
        $products = Book::all();
        return view('admin.books.index', compact('products'));
    }

    public function create()
    {
        abort_unless(\Gate::allows('books_create'), 403);
        $categories = Category::all();
        $languages = Language::all();
        return view('admin.books.create',compact('categories','languages'));
    }

    public function store(UpdateBooksRequest $request)
    {
        abort_unless(\Gate::allows('books_create'), 403);

        $product = Book::create($request->all());
        $product->lms_book_id = "LMS-".$product->id;
        $product->available_copies = $product->copies;
        $product->save();
        return redirect()->route('admin.books.index');
    }

    public function edit($id)
    {
        abort_unless(\Gate::allows('books_edit'), 403);
        $product = Book::find($id);
        $categories = Category::all();
        $languages = Language::all();
        return view('admin.books.edit', compact('product','categories','languages'));
    }

    public function update(UpdateBooksRequest $request, $id)
    {
        abort_unless(\Gate::allows('books_edit'), 403);
        $product = Book::find($id);
        $product->update($request->all());
        return redirect()->route('admin.books.index');
    }

    public function show($id)
    {
        abort_unless(\Gate::allows('books_show'), 403);
        $product = Book::find($id);
        $bookIssuedCurrent = BookIssue::where('book_id',$id)->whereNull('received_date')->count();
        $totalBooksIssued = BookIssue::where('book_id',$id)->count();
        $booksUnderFine = BookIssue::where('book_id',$id)->whereNull('received_date')->where('issue_date_to',Carbon::now()->format("Y-m-d H:i:s"))->count();
        return view('admin.books.show', compact('product','bookIssuedCurrent','totalBooksIssued','booksUnderFine'));
    }

    public function destroy($id)
    {
        abort_unless(\Gate::allows('books_delete'), 403);
        $product = Book::find($id);
        $product->delete();
        return back();
    }

    public function massDestroy(MassDestroyBooksRequest $request)
    {
        Book::whereIn('id', request('ids'))->delete();

        return response(null, 204);
    }


}
