<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class TBusinessCategoryKeyword extends Model
{
    protected $guarded = [];

    public function category() {
        return $this->belongsTo(TBusinessCategory::class, 'category_id');
    }
}
