@extends('layouts.admin')
@section('content')
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
                            {{ trans('global.issue.fields.issue_date_from') }}
                        </th>
                        <th>
                            {{ trans('global.issue.fields.issue_date_to') }}
                        </th>
                        <th>
                            {{ trans('global.issue.fields.remarks_at_issue') }}
                        </th>
                        <th>
                            {{ trans('global.books.fields.fine') }}
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
                                {{ $product->bookId->lms_book_id }}
                            </td>
                            <td>
                                {{ $product->bookId->author }}
                            </td>
                            <td>
                                {{ $product->issue_date_from }}
                            </td>
                            <td>
                                {{ $product->issue_date_to }}
                            </td>
                            <td>
                                {{ $product->remarks_at_issue }}
                            </td>
                            <td>
                                {{ $product->fine }}
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
