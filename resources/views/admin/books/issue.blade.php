@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
    {{ trans('global.issue.title_singular') }}
    </div>

    <div class="card-body">
        <form action="{{ route("admin.book_issue.store") }}" method="POST" enctype="multipart/form-data">
            @csrf
        <input type="hidden" name="tt" id="tt" value="{{$from??''}}">

            <input type="hidden" id="issue_form" name="issue_form" value="yes">
            <div class="form-group {{ $errors->has('book_id') ? 'has-error' : '' }}">
                <label for="book_id">{{ trans('global.issue.fields.book_id') }}*</label>
                <select class="custom-select" id="book_id" name="book_id" class="form-control"
                    value="{{ old('book_id', isset($product) ? $product->book_id : '') }}">

                    @foreach ($books as $item)
                    <option {{old('book_id', isset($product) ? $product->book_id : '')==$item->id?'selected':''}}
                        value="{{$item->id}}">{{$item->name}}</option>
                    @endforeach
                </select>
                @if($errors->has('book_id'))
                <p class="help-block">
                    {{ $errors->first('book_id') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.issue.fields.book_id_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('user_id') ? 'has-error' : '' }}">
                <label for="user_id">{{ trans('global.issue.fields.user_id') }}*</label>
                <select class="custom-select" id="user_id" name="user_id" class="form-control"
                    value="{{ old('user_id', isset($product) ? $product->user_id : '') }}">
                    @foreach ($users as $item)
                    <option {{old('user_id', isset($product) ? $product->user_id : '')==$item->id?'selected':''}}
                        value="{{$item->id}}">{{$item->name}}</option>
                    @endforeach
                </select>

                @if($errors->has('user_id'))
                <p class="help-block">
                    {{ $errors->first('user_id') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.issue.fields.user_id_helper') }}
                </p>
            </div>

            <div class="form-group {{ $errors->has('issued_by') ? 'has-error' : '' }}">
                <label for="issued_by">{{ trans('global.issue.fields.issued_by') }}*</label>
                <select class="custom-select" id="issued_by" name="issued_by" class="form-control"
                    value="{{ old('issued_by', isset($product) ? $product->issued_by : '') }}">
                    @foreach ($issuer as $item)
                    <option {{old('issued_by', isset($product) ? $product->issued_by : '')==$item->id?'selected':''}}
                        value="{{$item->id}}">{{$item->name}}</option>
                    @endforeach
                </select>

                @if($errors->has('issued_by'))
                <p class="help-block">
                    {{ $errors->first('issued_by') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.issue.fields.issued_by_helper') }}
                </p>
            </div>

            <div class="form-group {{ $errors->has('issue_date_from') ? 'has-error' : '' }}">
                <label for="issue_date_from">{{ trans('global.issue.fields.issue_date_from') }}*</label>
                <input type="text" id="issue_date_from" name="issue_date_from" class="form-control"
                    value="{{ old('issue_date_from', isset($product) ? explode(' ',$product->issue_date_from)[0] : '') }}">
                @if($errors->has('issue_date_from'))
                <p class="help-block">
                    {{ $errors->first('issue_date_from') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.issue.fields.issue_date_from_helper') }}
                </p>
            </div>

            <div class="form-group {{ $errors->has('issue_date_to') ? 'has-error' : '' }}">
                <label for="issue_date_to">{{ trans('global.issue.fields.issue_date_to') }}*</label>
                <input type="text" id="issue_date_to" name="issue_date_to" class="form-control"
                    value="{{ old('issue_date_to', isset($product) ? explode(' ',$product->issue_date_to)[0] : '') }}">
                @if($errors->has('issue_date_to'))
                <p class="help-block">
                    {{ $errors->first('issue_date_to') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.issue.fields.issue_date_to_helper') }}
                </p>
            </div>


            <div class="form-group {{ $errors->has('remarks_at_issue') ? 'has-error' : '' }}">
                <label for="remarks_at_issue">{{ trans('global.issue.fields.remarks_at_issue') }}</label>
                <textarea id="remarks_at_issue" name="remarks_at_issue" class="form-control"
                    value="{{ old('remarks_at_issue', isset($product) ? $product->remarks_at_issue : '') }}">{{ old('remarks_at_issue', isset($product) ? $product->remarks_at_issue : '') }}</textarea>
                @if($errors->has('remarks_at_issue'))
                <p class="help-block">
                    {{ $errors->first('remarks_at_issue') }}
                </p>
                @endif
                <p class="helper-block">
                    {{ trans('global.issue.fields.remarks_at_issue_helper') }}
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
        $('#issue_date_from').datepicker({
            uiLibrary: 'bootstrap4',
            format: 'yyyy-mm-dd',
            minDate: new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate()),
            value: '{{ old('issue_date_from', isset($product) ? explode(' ',$product->issue_date_from)[0] : '') }}'
        });

        $('#issue_date_to').datepicker({
            uiLibrary: 'bootstrap4',
            format: 'yyyy-mm-dd',
            minDate: new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate()),
            value: '{{ old('issue_date_to', isset($product) ? explode(' ',$product->issue_date_to)[0] : '') }}'

        });
    });

</script>
@endsection
