<?php

use App\Announcement;
use App\Book;
use Illuminate\Http\Request;

Route::get('/', function(Request $r){

    $q = $r->input('q','');
    $q = trim($q);
    $books = $accouncements = null;
    if($q){
        $accouncements = Announcement::where('name','like',"%{$q}%")->get();
    } else {
        $accouncements = Announcement::all();
    }
    if($q){
        $books = Book::orWhere(function($qu) use($q){
            $qu->orWhere('name','like',"%{$q}%");
            $qu->orWhere('lms_book_id','like',"%{$q}%");
            $qu->orWhere('isbn','like',"%{$q}%");
            $qu->orWhere('publication_year','like',"%{$q}%");
            $qu->orWhere('author','like',"%{$q}%");
            $qu->orWhere('remarks','like',"%{$q}%");
           return $qu;
        })->get();
    } else {
        $books = [];
    }
    return view('welcome',compact('accouncements','books'));
})->name('ahome');



Route::redirect('/home', '/admin');

Auth::routes(['register' => false]);

Route::group(['prefix' => 'admin', 'as' => 'admin.', 'namespace' => 'Admin', 'middleware' => ['auth']], function () {

    Route::get('/', 'HomeController@index')->name('home');

    Route::delete('permissions/destroy', 'PermissionsController@massDestroy')->name('permissions.massDestroy');

    Route::resource('permissions', 'PermissionsController');

    Route::delete('roles/destroy', 'RolesController@massDestroy')->name('roles.massDestroy');

    Route::resource('roles', 'RolesController');

    Route::delete('users/destroy', 'UsersController@massDestroy')->name('users.massDestroy');

    Route::resource('users', 'UsersController');

    Route::delete('products/destroy', 'ProductsController@massDestroy')->name('products.massDestroy');

    Route::resource('products', 'ProductsController');

    Route::delete('categories/destroy', 'CategoryController@massDestroy')->name('categories.massDestroy');

    Route::resource('categories', 'CategoryController');

    Route::delete('announcements/destroy', 'AnnouncementController@massDestroy')->name('announcements.massDestroy');

    Route::resource('announcements', 'AnnouncementController');

    Route::delete('language/destroy', 'LanguageController@massDestroy')->name('language.massDestroy');

    Route::resource('language', 'LanguageController');

    Route::delete('fines/destroy', 'FinesController@massDestroy')->name('fines.massDestroy');

    Route::resource('fines', 'FinesController');

    Route::delete('books/destroy', 'BooksController@massDestroy')->name('books.massDestroy');
    Route::get('books/issuebook/{book?}/{user?}', 'BooksIssueController@issueBook')->name('books.issueBook');
    Route::get('books/receivebook/{book?}/{user?}', 'BooksIssueController@receiveBook')->name('books.receiveBook');
    Route::get('books/bookhistory/{book}', 'BooksIssueController@bookHistory')->name('books.bookHistory');

    Route::get('books/my-books', 'BooksIssueController@myBooks')->name('books.myBooks');
    Route::get('books/submit-today', 'BooksIssueController@submitToday')->name('books.submitToday');
    Route::get('books/under-fine', 'BooksIssueController@underFine')->name('books.underFine');
    Route::get('books/my-fine', 'BooksIssueController@myFine')->name('books.myFine');
    Route::get('books/available-books', 'BooksIssueController@availableBooks')->name('books.availableBooks');


    Route::resource('books', 'BooksController');

    Route::delete('book_issue/destroy', 'BooksIssueController@massDestroy')->name('book_issue.massDestroy');
    Route::resource('book_issue', 'BooksIssueController');

});
