@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.fines.title_singular') }} {{ trans('global.list') }}
    </div>

    <div class="card-body">
        <div class="table-responsive">
            @php
                     $i = 0;
                    @endphp
            <table class=" table table-bordered table-striped table-hover datatable">
                <thead>
                    <tr>

                        <th>
                            {{ trans('global.sr_no') }}
                        </th>
                        <th>
                            {{ trans('global.fines.fields.book_id') }}
                        </th>
                        <th>
                            {{ trans('global.fines.fields.amount') }}
                        </th>
                        <th>
                            {{ trans('global.fines.fields.remarks') }}
                        </th>
                        <th>
                            {{ trans('global.fines.fields.created_at') }}
                        </th>
                </thead>
                <tbody>
                    @foreach($products as $key => $product)
                    @php
                     $i++
                    @endphp
                        <tr data-entry-id="{{ $product->id }}">
                            <td>
                                {{ $i }}
                            </td>
                                                      <td>
                                {{ $product->bookId->name }}
                            </td>
                            <td>
                               $ {{ $product->amount }}
                            </td>
                            <td>
                                {{ $product->remarks }}
                            </td>
                            <td>
                                {{ $product->created_at }}
                            </td>


                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
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
