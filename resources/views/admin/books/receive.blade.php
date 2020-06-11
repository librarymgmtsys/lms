@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
    {{ trans('global.receive.title_singular') }}
    </div>

    <div class="card-body">
        <form action="{{ route("admin.book_issue.store") }}" method="POST" enctype="multipart/form-data">
            @csrf
            <input type="hidden" name="tt" id="tt" value="{{$from??''}}">

            <input type="hidden" id="receive_form" name="receive_form" value="yes">
            <div class="form-group {{ $errors->has('book_id') ? 'has-error' : '' }}">
                <label for="book_id">{{ trans('global.receive.fields.book_id') }}*</label>
                <select class="custom-select" id="book_id" name="book_id" class="form-control"
                    value="{{ old('book_id', isset($product) ? $product->book_id : '') }}">

                    @foreach ($books as $item)
                    <option value="{{$item->id}}">{{$item->name}}</option>
                    @endforeach
                </select>
                @if($errors->has('book_id'))
                <p class="help-block">
                    {{ $errors->first('book_id') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.receive.fields.book_id_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('user_id') ? 'has-error' : '' }}">
                <label for="user_id">{{ trans('global.receive.fields.user_id') }}*</label>
                <select class="custom-select" id="user_id" name="user_id" class="form-control"
                    value="{{ old('user_id', isset($product) ? $product->user_id : '') }}">
                    @foreach ($users as $item)
                    <option value="{{$item->id}}">{{$item->name}}</option>
                    @endforeach
                </select>

                @if($errors->has('user_id'))
                <p class="help-block">
                    {{ $errors->first('user_id') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.receive.fields.user_id_helper') }}
                </p>
            </div>

            <div class="form-group {{ $errors->has('received_date') ? 'has-error' : '' }}">
                <label for="received_date">{{ trans('global.receive.fields.received_date') }}*</label>
                <input type="text" id="received_date" name="received_date" class="form-control"
                    value="{{ old('received_date', isset($product) ? explode(' ',$product->received_date)[0] : '') }}">
                @if($errors->has('received_date'))
                <p class="help-block">
                    {{ $errors->first('received_date') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.receive.fields.received_date_helper') }}
                </p>
            </div>


            <div class="form-group {{ $errors->has('remarks_at_receive') ? 'has-error' : '' }}">
                <label for="remarks_at_receive">{{ trans('global.receive.fields.remarks_at_receive') }}</label>
                <textarea id="remarks_at_receive" name="remarks_at_receive" class="form-control"
                    value="{{ old('remarks_at_receive', isset($product) ? $product->remarks_at_receive : '') }}">{{ old('remarks_at_receive', isset($product) ? $product->remarks_at_receive : '') }}</textarea>
                @if($errors->has('remarks_at_receive'))
                <p class="help-block">
                    {{ $errors->first('remarks_at_receive') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.receive.fields.remarks_at_receive_helper') }}
                </p>
            </div>
            <div>
                <input class="btn btn-danger" type="submit" value="{{ trans('global.save') }}">
            </div>
        </form>
    </div>
</div>

@endsection

@section('scripts')
@parent
<script>
    $(function () {
        $('#received_date').datepicker({
            uiLibrary: 'bootstrap4',
            format: 'yyyy-mm-dd',
            minDate: new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate()),
            value: '{{ old('received_date', isset($product) ? explode(' ',$product->received_date)[0] : '') }}'
        });
    });

</script>
@endsection
