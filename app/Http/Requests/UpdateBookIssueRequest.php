<?php

namespace App\Http\Requests;

use App\Product;
use Illuminate\Foundation\Http\FormRequest;

class UpdateBookIssueRequest extends FormRequest
{
    public function authorize()
    {
        return \Gate::allows('books_issue_edit');
    }

    public function rules()
    {
        return [
            'book_id' => [
                'required',
            ],
            'user_id' => [
                'required',
            ],
            'issue_date_from' => [
                'required',
            ],
            'issue_date_to' => [
                'required',
            ],
            'issued_by' => [
                'required',
            ],
        ];
    }
}
