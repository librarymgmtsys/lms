@extends('layouts.admin')
@section('content')
@can('books_create')
    <div style="margin-bottom: 10px;" class="row">
        <div class="col-lg-12">
            <a class="btn btn-success" href="{{ route("admin.books.create") }}">
                {{ trans('global.add') }} {{ trans('global.books.title_singular') }}
            </a>
        </div>
    </div>
@endcan
<div class="card">
    <div class="card-header">
        {{ trans('global.books.title_singular') }} {{ trans('global.list') }}
    </div>

    <div class="card-body">
        <div class="table-responsive">
            @php
                     $i = 0;
                    @endphp
            <table class=" table table-bordered table-striped table-hover datatable">
                <thead>
                    <tr>
                        <th width="10">

                        </th>
                        <th>
                            {{ trans('global.sr_no') }}
                        </th>
                        <th>
                            {{ trans('global.books.fields.lms_book_id') }}
                        </th>
                        <th>
                            {{ trans('global.books.fields.author') }}
                        </th>
                        <th>
                            {{ trans('global.books.fields.lang_id') }}
                        </th>
                        <th>
                            {{ trans('global.books.fields.category_id') }}
                        </th>
                        <th>
                            {{ trans('global.books.fields.name') }}
                        </th>
                        <th>
                            {{ trans('global.books.fields.copies') }}
                        </th>
                        <th>
                            {{ trans('global.books.fields.available_copies') }}
                        </th>
                        <th>
                            {{ trans('global.books.fields.issued_copies') }}
                        </th>
                        <th>
                            {{ trans('global.books.fields.default_issue_days') }}
                        </th>
                        <th>
                            {{ trans('global.books.fields.fine') }}
                        </th>
                        <th>
                            {{ trans('global.books.fields.publication_year') }}
                        </th>
                        <th>
                            {{ trans('global.books.fields.remarks') }}
                        </th>


                        <th>
                            &nbsp;
                        </th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($products as $key => $product)
                    @php
                     $i++
                    @endphp
                        <tr data-entry-id="{{ $product->id }}">
                            <td>

                            </td>
                            <td>
                                {{ $i }}
                            </td>
                            <td>
                                {{ $product->lms_book_id }}
                            </td>
                            <td>
                                {{ $product->author }}
                            </td>
                            <td>
                                {{ $product->lang_id?$product->langId->name:'' }}
                            </td>
                            <td>
                                {{ $product->category_id?$product->categoryId->name:'' }}
                            </td>
                            <td>
                                {{ $product->name }}
                            </td>
                            <td>
                                {{ $product->copies }}
                            </td>
                            <td>
                                {{ $product->available_copies }}
                            </td>

                            <td>
                                {{ $product->copies - $product->available_copies }}
                            </td>
                            <td>
                                {{ $product->default_issue_days }}
                            </td>
                            <td>
                                ${{ $product->fine }}
                            </td>
                            <td>
                                {{ $product->publication_year }}
                            </td>
                            <td>
                                {{ $product->remarks }}
                            </td>


                            <td>
                                @can('self_book_issue')
                                <a class="btn btn-xs btn-warning" href="{{ route('admin.books.issueBook', [$product->id, auth()->getUser()->id]) }}">
                                    {{ trans('global.issue_book') }}
                                </a>
                                @endcan
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
@section('scripts')
@parent
<script>
    $(function () {
  $('.datatable:not(.ajaxTable)').DataTable()
})

</script>
@endsection
