<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Fine extends Model
{
    use SoftDeletes;

    protected $table = 'fines';

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $fillable = [
        "book_id",
        "user_id",
        "amount",
        "remarks",
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
