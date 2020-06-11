<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\MassDestroyProductRequest;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Category;
use App\Http\Requests\MassDestroyCategoryRequest;
use App\Http\Requests\UpdateCategoryRequest;

class CategoryController extends Controller
{
    public function index()
    {
        abort_unless(\Gate::allows('category_access'), 403);

        $products = Category::all();

        return view('admin.category.index', compact('products'));
    }

    public function create()
    {
        abort_unless(\Gate::allows('category_create'), 403);

        return view('admin.category.create');
    }

    public function store(UpdateCategoryRequest $request)
    {
        abort_unless(\Gate::allows('category_create'), 403);

        $product = Category::create($request->all());

        return redirect()->route('admin.categories.index');
    }

    public function edit($id)
    {
        abort_unless(\Gate::allows('category_edit'), 403);
        $product = Category::find($id);
        return view('admin.category.edit', compact('product'));
    }

    public function update(UpdateCategoryRequest $request, $id)
    {
        abort_unless(\Gate::allows('category_edit'), 403);
        $product = Category::find($id);
        $product->update($request->all());

        return redirect()->route('admin.categories.index');
    }

    public function show($id)
    {
        abort_unless(\Gate::allows('category_show'), 403);
        $product = Category::find($id);
        return view('admin.category.show', compact('product'));
    }

    public function destroy($id)
    {
        abort_unless(\Gate::allows('category_delete'), 403);
        $product = Category::find($id);
        $product->delete();
        return back();
    }

    public function massDestroy(MassDestroyCategoryRequest $request)
    {
        Category::whereIn('id', request('ids'))->delete();

        return response(null, 204);
    }
}
