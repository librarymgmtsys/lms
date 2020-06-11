<?php

namespace App\Http\Requests;

use App\Product;
use Illuminate\Foundation\Http\FormRequest;

class UpdateBooksRequest extends FormRequest
{
    public function authorize()
    {
        return \Gate::allows('books_edit');
    }

    public function rules()
    {
        return [
            'name' => [
                'required',
            ],
        ];
    }
}
