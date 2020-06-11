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
                                @can('self_book_submit')
                                    <a class="btn btn-xs btn-primary" href="{{ route('admin.books.receiveBook', [$product->book_id,auth()->getUser()->id]) }}">
                                        {{ trans('global.submit_book') }}
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

<hr><hr>
<h3>My History</h3>
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
                            {{ trans('global.receive.fields.remarks_at_receive') }}
                        </th>
                        <th>
                            {{ trans('global.receive.fields.received_date') }}
                        </th>


                    </tr>
                </thead>
                <tbody>
                    @foreach($products1 as $key => $product)
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
                                {{ $product->remarks_at_receive }}
                            </td>
                            <td>
                                {{ $product->received_date }}
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
