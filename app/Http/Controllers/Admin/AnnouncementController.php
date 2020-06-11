<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\MassDestroyProductRequest;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Announcement;
use App\Http\Requests\MassDestroyAnnouncementRequest;
use App\Http\Requests\MassDestroyCategoryRequest;
use App\Http\Requests\UpdateAnnouncementRequest;
use App\Http\Requests\UpdateCategoryRequest;

class AnnouncementController extends Controller
{
    public function index()
    {
        abort_unless(\Gate::allows('announcement_access'), 403);

        $products = Announcement::all();

        return view('admin.announcement.index', compact('products'));
    }

    public function create()
    {
        abort_unless(\Gate::allows('announcement_create'), 403);

        return view('admin.announcement.create');
    }

    public function store(UpdateAnnouncementRequest $request)
    {
        abort_unless(\Gate::allows('announcement_create'), 403);

        $product = Announcement::create($request->all());

        return redirect()->route('admin.announcements.index');
    }

    public function edit($id)
    {
        abort_unless(\Gate::allows('announcement_edit'), 403);
        $product = Announcement::find($id);
        return view('admin.announcement.edit', compact('product'));
    }

    public function update(UpdateAnnouncementRequest $request, $id)
    {
        abort_unless(\Gate::allows('announcement_edit'), 403);
        $product = Announcement::find($id);
        $product->update($request->all());

        return redirect()->route('admin.announcements.index');
    }

    public function show($id)
    {
        abort_unless(\Gate::allows('announcement_show'), 403);
        $product = Announcement::find($id);
        return view('admin.announcement.show', compact('product'));
    }

    public function destroy($id)
    {
        abort_unless(\Gate::allows('announcement_delete'), 403);
        $product = Announcement::find($id);
        $product->delete();
        return back();
    }

    public function massDestroy(MassDestroyAnnouncementRequest $request)
    {
        Announcement::whereIn('id', request('ids'))->delete();

        return response(null, 204);
    }
}
