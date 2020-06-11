<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BookIssue extends Model
{
    use SoftDeletes;

    protected $table = 'book_issues';

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $fillable = [
        "book_id",
        "user_id",
        "issue_date_from",
        "issue_date_to",
        "received_date",
        "issued_by",
        "remarks_at_issue",
        "remarks_at_receive",
        "created_at",
        "updated_at",
        "deleted_at"
    ];


    public function bookId()
    {
        return $this->hasOne('App\Book','id','book_id');
    }

    public function userId()
    {
        return $this->hasOne('App\User','id','user_id');
    }
}
