<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Withdraw extends Model
{
    protected $guarded = [];

    public function users(){
        return $this->belongsTo(User::class, 'user_id','id');
    }
}
