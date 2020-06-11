<?php

namespace App\Http\Requests;

use App\Product;
use Illuminate\Foundation\Http\FormRequest;

class UpdateFinesRequest extends FormRequest
{
    public function authorize()
    {
        return \Gate::allows('fines_edit');
    }

    public function rules()
    {
        return [
            'amount' => [
                'required',
            ],
        ];
    }
}
