@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.edit') }} {{ trans('global.fines.title_singular') }}
    </div>

    <div class="card-body">
        <form action="{{ route("admin.fines.update", [$product->id]) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="form-group {{ $errors->has('book_id') ? 'has-error' : '' }}">
                <label for="book_id">{{ trans('global.fines.fields.book_id') }}*</label>
                <select class="custom-select" id="book_id" name="book_id" class="form-control" value="{{ old('book_id', isset($product) ? $product->book_id : '') }}">
                    @foreach ($books as $item)
                    <option  {{old('book_id', isset($product) ? $product->book_id : '')==$item->id?'selected':''}} value="{{$item->id}}">{{$item->name}}</option>
                    @endforeach
                  </select>

                @if($errors->has('book_id'))
                    <p class="help-block">
                        {{ $errors->first('book_id') }}
                    </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.fines.fields.book_id_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('user_id') ? 'has-error' : '' }}">
                <label for="user_id">{{ trans('global.fines.fields.user_id') }}*</label>
                <select class="custom-select" id="user_id" name="user_id" class="form-control" value="{{ old('user_id', isset($product) ? $product->user_id : '') }}">
                    @foreach ($users as $item)
                    <option  {{old('user_id', isset($product) ? $product->user_id : '')==$item->id?'selected':''}} value="{{$item->id}}">{{$item->name}}</option>
                    @endforeach
                  </select>

                @if($errors->has('user_id'))
                    <p class="help-block">
                        {{ $errors->first('user_id') }}
                    </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.fines.fields.user_id_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('amount') ? 'has-error' : '' }}">
                <label for="amount">{{ trans('global.fines.fields.amount') }}*</label>
                <input type="text" id="amount" name="amount" class="form-control" value="{{ old('amount', isset($product) ? $product->amount : '') }}">
                @if($errors->has('amount'))
                    <p class="help-block">
                        {{ $errors->first('amount') }}
                    </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.fines.fields.amount_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('remarks') ? 'has-error' : '' }}">
                <label for="remarks">{{ trans('global.fines.fields.remarks') }}</label>
                <textarea id="remarks" name="remarks" class="form-control" value="{{ old('remarks', isset($product) ? $product->remarks : '') }}">{{ old('remarks', isset($product) ? $product->remarks : '') }}</textarea>
                @if($errors->has('remarks'))
                    <p class="help-block">
                        {{ $errors->first('remarks') }}
                    </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.fines.fields.remarks_helper') }}
                </p>
            </div>
            <div>
                <input class="btn btn-danger" type="submit" value="{{ trans('global.save') }}">
            </div>
        </form>
    </div>
</div>

@endsection
