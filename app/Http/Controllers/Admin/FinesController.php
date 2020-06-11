<?php

namespace App\Http\Controllers\Admin;

use App\Book;
use App\Http\Controllers\Controller;
use App\Http\Requests\MassDestroyProductRequest;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Fine;
use App\Http\Requests\MassDestroyCategoryRequest;
use App\Http\Requests\MassDestroyFinesRequest;
use App\Http\Requests\MassDestroyLanguageRequest;
use App\Http\Requests\UpdateFinesRequest;
use App\User;

class FinesController extends Controller
{
    public function index()
    {
        abort_unless(\Gate::allows('fines_access'), 403);

        $products = Fine::all();

        return view('admin.fines.index', compact('products'));
    }

    public function create()
    {
        abort_unless(\Gate::allows('fines_create'), 403);
        $users = User::all();
        $books = Book::all();
        return view('admin.fines.create',compact('users','books'));
    }

    public function store(UpdateFinesRequest $request)
    {
        abort_unless(\Gate::allows('fines_create'), 403);

        $product = Fine::create($request->all());

        return redirect()->route('admin.fines.index');
    }

    public function edit($id)
    {
        abort_unless(\Gate::allows('fines_edit'), 403);
        $product = Fine::find($id);
        $users = User::all();
        $books = Book::all();
        return view('admin.fines.edit', compact('product','users','books'));
    }

    public function update(UpdateFinesRequest $request, $id)
    {
        abort_unless(\Gate::allows('fines_edit'), 403);
        $product = Fine::find($id);
        $product->update($request->all());

        return redirect()->route('admin.fines.index');
    }

    public function show($id)
    {
        abort_unless(\Gate::allows('fines_show'), 403);
        $product = Fine::find($id);
        $users = User::all();
        $books = Book::all();
        return view('admin.fines.show', compact('product','users','books'));
    }

    public function destroy($id)
    {
        abort_unless(\Gate::allows('fines_delete'), 403);
        $product = Fine::find($id);
        $product->delete();
        return back();
    }

    public function massDestroy(MassDestroyFinesRequest $request)
    {
        Fine::whereIn('id', request('ids'))->delete();

        return response(null, 204);
    }
}
