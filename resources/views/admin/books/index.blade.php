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
                            {{ trans('global.books.fields.created_at') }}
                        </th>
                        <th>
                            {{ trans('global.books.fields.updated_at') }}
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
                                {{ $product->created_at }}
                            </td>
                            <td>
                                {{ $product->updated_at }}
                            </td>

                            <td>
                                @can('books_show')
                                    <a class="btn btn-xs btn-primary" href="{{ route('admin.books.show', $product->id) }}">
                                        {{ trans('global.view') }}
                                    </a>
                                @endcan
                                @can('books_edit')
                                    <a class="btn btn-xs btn-info" href="{{ route('admin.books.edit', $product->id) }}">
                                        {{ trans('global.edit') }}
                                    </a>
                                @endcan
                                @can('books_issue')
                                    <a class="btn btn-xs btn-warning" href="{{ route('admin.books.issueBook', $product->id) }}">
                                        {{ trans('global.issue_book') }}
                                    </a>
                                @endcan
                                @can('books_receive')
                                    <a class="btn btn-xs btn-primary" href="{{ route('admin.books.receiveBook', $product->id) }}">
                                        {{ trans('global.receive_book') }}
                                    </a>
                                @endcan
                                @can('books_history')
                                    <a class="btn btn-xs btn-info" href="{{ route('admin.books.bookHistory', $product->id) }}">
                                        {{ trans('global.history') }}
                                    </a>
                                @endcan
                                @can('books_delete')
                                    <form action="{{ route('admin.books.destroy', $product->id) }}" method="POST" onsubmit="return confirm('{{ trans('global.areYouSure') }}');" style="display: inline-block;">
                                        <input type="hidden" name="_method" value="DELETE">
                                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                        <input type="submit" class="btn btn-xs btn-danger" value="{{ trans('global.delete') }}">
                                    </form>
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
  let deleteButtonTrans = '{{ trans('global.datatables.delete') }}'
  let deleteButton = {
    text: deleteButtonTrans,
    url: "{{ route('admin.books.massDestroy') }}",
    className: 'btn-danger',
    action: function (e, dt, node, config) {
      var ids = $.map(dt.rows({ selected: true }).nodes(), function (entry) {
          return $(entry).data('entry-id')
      });

      if (ids.length === 0) {
        alert('{{ trans('global.datatables.zero_selected') }}')

        return
      }

      if (confirm('{{ trans('global.areYouSure') }}')) {
        $.ajax({
          headers: {'x-csrf-token': _token},
          method: 'POST',
          url: config.url,
          data: { ids: ids, _method: 'DELETE' }})
          .done(function () { location.reload() })
      }
    }
  }
  let dtButtons = $.extend(true, [], $.fn.dataTable.defaults.buttons)
@can('books_delete')
  dtButtons.push(deleteButton)
@endcan

  $('.datatable:not(.ajaxTable)').DataTable({ buttons: dtButtons })
})

</script>
@endsection
