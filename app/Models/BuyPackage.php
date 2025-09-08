<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BuyPackage extends Model
{
    protected $guarded = [];

    public function rules(){
        return $this->hasMany(TodoList::class, 'buy_id','id');
    }
    
    public function users(){
        return $this->belongsTo(User::class, 'user_id','id');
    }

    public function packages(){
        return $this->belongsTo(Package::class, 'package_id','id');
    }
}
