<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\MassDestroyProductRequest;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Language;
use App\Http\Requests\MassDestroyCategoryRequest;
use App\Http\Requests\MassDestroyLanguageRequest;
use App\Http\Requests\UpdateCategoryRequest;
use App\Http\Requests\UpdateLanguageRequest;

class LanguageController extends Controller
{
    public function index()
    {
        abort_unless(\Gate::allows('language_access'), 403);

        $products = Language::all();

        return view('admin.language.index', compact('products'));
    }

    public function create()
    {
        abort_unless(\Gate::allows('language_create'), 403);

        return view('admin.language.create');
    }

    public function store(UpdateLanguageRequest $request)
    {
        abort_unless(\Gate::allows('language_create'), 403);

        $product = Language::create($request->all());

        return redirect()->route('admin.language.index');
    }

    public function edit($id)
    {
        abort_unless(\Gate::allows('language_edit'), 403);
        $product = Language::find($id);
        return view('admin.language.edit', compact('product'));
    }

    public function update(UpdateLanguageRequest $request, $id)
    {
        abort_unless(\Gate::allows('language_edit'), 403);
        $product = Language::find($id);
        $product->update($request->all());

        return redirect()->route('admin.language.index');
    }

    public function show($id)
    {
        abort_unless(\Gate::allows('language_show'), 403);
        $product = Language::find($id);
        return view('admin.language.show', compact('product'));
    }

    public function destroy($id)
    {
        abort_unless(\Gate::allows('language_delete'), 403);
        $product = Language::find($id);
        $product->delete();
        return back();
    }

    public function massDestroy(MassDestroyLanguageRequest $request)
    {
        Language::whereIn('id', request('ids'))->delete();

        return response(null, 204);
    }
}
