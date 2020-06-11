@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.edit') }} {{ trans('global.books.title_singular') }}
    </div>

    <div class="card-body">
        <form action="{{ route("admin.books.update", [$product->id]) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="form-group {{ $errors->has('lang_id') ? 'has-error' : '' }}">
                <label for="lang_id">{{ trans('global.books.fields.lang_id') }}*</label>
                <select class="custom-select" id="lang_id" name="lang_id" class="form-control"
                    value="{{ old('lang_id', isset($product) ? $product->lang_id : '') }}">
                    @foreach ($languages as $item)
                    <option {{old('lang_id', isset($product) ? $product->lang_id : '')==$item->id?'selected':''}}
                        value="{{$item->id}}">{{$item->name}}</option>
                    @endforeach
                </select>

                @if($errors->has('lang_id'))
                <p class="help-block">
                    {{ $errors->first('lang_id') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.books.fields.lang_id_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('category_id') ? 'has-error' : '' }}">
                <label for="category_id">{{ trans('global.books.fields.category_id') }}*</label>
                <select class="custom-select" id="category_id" name="category_id" class="form-control"
                    value="{{ old('category_id', isset($product) ? $product->category_id : '') }}">
                    @foreach ($categories as $item)
                    <option
                        {{old('category_id', isset($product) ? $product->category_id : '')==$item->id?'selected':''}}
                        value="{{$item->id}}">{{$item->name}}</option>
                    @endforeach
                </select>

                @if($errors->has('category_id'))
                <p class="help-block">
                    {{ $errors->first('category_id') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.books.fields.category_id_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
                <label for="name">{{ trans('global.books.fields.name') }}*</label>
                <input type="text" id="name" name="name" class="form-control"
                    value="{{ old('name', isset($product) ? $product->name : '') }}">
                @if($errors->has('name'))
                <p class="help-block">
                    {{ $errors->first('name') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.books.fields.name_helper') }}
                </p>
            </div>

            <div class="form-group {{ $errors->has('isbn') ? 'has-error' : '' }}">
                <label for="isbn">{{ trans('global.books.fields.isbn') }}*</label>
                <input type="text" id="isbn" name="isbn" class="form-control"
                    value="{{ old('isbn', isset($product) ? $product->isbn : '') }}">
                @if($errors->has('isbn'))
                <p class="help-block">
                    {{ $errors->first('isbn') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.books.fields.isbn_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('copies') ? 'has-error' : '' }}">
                <label for="copies">{{ trans('global.books.fields.copies') }}*</label>
                <input type="text"  id="copies" name="copies" class="form-control"
                    value="{{ old('copies', isset($product) ? $product->copies : '') }}">
                @if($errors->has('copies'))
                <p class="help-block">
                    {{ $errors->first('copies') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.books.fields.copies_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('available_copies') ? 'has-error' : '' }}">
                <label for="available_copies">{{ trans('global.books.fields.available_copies') }}*</label>
                <input type="text" id="available_copies" name="available_copies" class="form-control"
                    value="{{ old('available_copies', isset($product) ? $product->available_copies : '') }}">
                @if($errors->has('available_copies'))
                <p class="help-block">
                    {{ $errors->first('available_copies') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.books.fields.available_copies_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('default_issue_days') ? 'has-error' : '' }}">
                <label for="default_issue_days">{{ trans('global.books.fields.default_issue_days') }}*</label>
                <input type="text" id="default_issue_days" name="default_issue_days" class="form-control"
                    value="{{ old('default_issue_days', isset($product) ? $product->default_issue_days : '') }}">
                @if($errors->has('default_issue_days'))
                <p class="help-block">
                    {{ $errors->first('default_issue_days') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.books.fields.default_issue_days_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('fine') ? 'has-error' : '' }}">
                <label for="fine">{{ trans('global.books.fields.fine') }}*</label>
                <input type="text" id="fine" name="fine" class="form-control"
                    value="{{ old('fine', isset($product) ? $product->fine : '') }}">
                @if($errors->has('fine'))
                <p class="help-block">
                    {{ $errors->first('fine') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.books.fields.fine_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('publication_year') ? 'has-error' : '' }}">
                <label for="publication_year">{{ trans('global.books.fields.publication_year') }}*</label>
                <input type="text" id="publication_year" name="publication_year" class="form-control"
                    value="{{ old('publication_year', isset($product) ? $product->publication_year : '') }}">
                @if($errors->has('publication_year'))
                <p class="help-block">
                    {{ $errors->first('publication_year') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.books.fields.publication_year_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('author') ? 'has-error' : '' }}">
                <label for="author">{{ trans('global.books.fields.author') }}*</label>
                <input type="text" id="author" name="author" class="form-control"
                    value="{{ old('author', isset($product) ? $product->author : '') }}">
                @if($errors->has('author'))
                <p class="help-block">
                    {{ $errors->first('author') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.books.fields.author_helper') }}
                </p>
            </div>

            <div class="form-group {{ $errors->has('remarks') ? 'has-error' : '' }}">
                <label for="remarks">{{ trans('global.books.fields.remarks') }}</label>
                <textarea id="remarks" name="remarks" class="form-control"
                    value="{{ old('remarks', isset($product) ? $product->remarks : '') }}">{{ old('remarks', isset($product) ? $product->remarks : '') }}</textarea>
                @if($errors->has('remarks'))
                <p class="help-block">
                    {{ $errors->first('remarks') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.books.fields.remarks_helper') }}
                </p>
            </div>
            <div>
                <input class="btn btn-danger" type="submit" value="{{ trans('global.save') }}">
            </div>
        </form>
    </div>
</div>

@endsection
