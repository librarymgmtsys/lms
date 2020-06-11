<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Book extends Model
{
    use SoftDeletes;

    protected $table = 'books';

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $fillable = [
        "lang_id",
        "category_id",
        "lms_book_id",
        "name",
        "isbn",
        "copies",
        "default_issue_days",
        "available_copies",
        "publication_year",
        "author",
        "remarks",
        "fine",
        "created_at",
        "updated_at",
        "deleted_at"
    ];


    public function langId()
    {
        return $this->hasOne('App\Language','id','lang_id');
    }

    public function categoryId()
    {
        return $this->hasOne('App\Category','id','category_id');
    }

}
