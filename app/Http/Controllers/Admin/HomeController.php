<?php

namespace App\Http\Controllers\Admin;

use App\Book;
use App\BookIssue;
use App\Fine;
use Carbon\Carbon;
use Illuminate\Http\Request;

class HomeController
{
    public function index()
    {
        $reports_all_books = Book::sum('copies');
        $reports_current_issued = BookIssue::whereNull('received_date')->count();
        $reports_total_issued =  BookIssue::count();
        $reports_total_fine_received = Fine::sum('amount');
        $reports_total_fine_pending = 0;
        $receiveBooks = BookIssue::whereDate('issue_date_to',Carbon::now()->format("Y-m-d"))->get();
        BookIssue::whereDate('issue_date_to','<',Carbon::now()->format("Y-m-d"))->get()->map(function($item) use(&$reports_total_fine_pending) {
            $book = Book::find($item['book_id']);
            $dnow= Carbon::now();
            $d1 = Carbon::createFromFormat("Y-m-d H:i:s",$item['issue_date_from']);
            $d2 = Carbon::createFromFormat("Y-m-d H:i:s",$item['issue_date_to']);
            $diffShould = $d1->diffInDays($d2);
            $diffActual = $d1->diffInDays($dnow);
            $reports_total_fine_pending += $book->fine*($diffActual-$diffShould);
        });
        $reports_today_receive_books = BookIssue::whereDate('issue_date_to',Carbon::now()->format("Y-m-d"))->count();

        $last10FinesAdmin = Fine::orderBy('created_at','DESC')->limit(10)->get();
        $last10BooksIssuedAdmin = BookIssue::orderBy('created_at','DESC')->limit(10)->get();
        $last10BooksReceivedAdmin = BookIssue::whereNotNull('received_date')->orderBy('received_date','DESC')->limit(10)->get();




        $user_current_issued = BookIssue::whereNull('received_date')->where('user_id',auth()->getUser()->id)->count();
        $user_total_issued =  BookIssue::where('user_id',auth()->getUser()->id)->count();
        $user_total_fine_received = Fine::where('user_id',auth()->getUser()->id)->sum('amount');
        $user_total_fine_pending = 0;
        $user_today_receive_books = BookIssue::where('user_id',auth()->getUser()->id)->whereDate('issue_date_to',Carbon::now()->format("Y-m-d"))->count();
        BookIssue::where('user_id',auth()->getUser()->id)->whereDate('issue_date_to','<',Carbon::now()->format("Y-m-d"))->get()->map(function($item) use(&$user_total_fine_pending) {
            $book = Book::find($item['book_id']);
            $dnow= Carbon::now();
            $d1 = Carbon::createFromFormat("Y-m-d H:i:s",$item['issue_date_from']);
            $d2 = Carbon::createFromFormat("Y-m-d H:i:s",$item['issue_date_to']);
            $diffShould = $d1->diffInDays($d2);
            $diffActual = $d1->diffInDays($dnow);
            $user_total_fine_pending += $book->fine*($diffActual-$diffShould);
        });

        return view('home',compact('reports_all_books','reports_current_issued','reports_total_issued','reports_total_fine_received','reports_total_fine_pending','reports_today_receive_books','user_current_issued','user_total_issued','user_total_fine_received','user_total_fine_pending','user_today_receive_books','receiveBooks','last10FinesAdmin','last10BooksIssuedAdmin','last10BooksReceivedAdmin'));
    }


    public function home(Request $req) {
        dd('as');
    }
}
