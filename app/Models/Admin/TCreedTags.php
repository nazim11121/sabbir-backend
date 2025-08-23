<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class TCreedTags extends Model
{
    protected $guarded = [];

    public function scopeOrdered($query)
    {
        return $query->orderBy('priority', 'asc'); // Lower priority value comes first
    }
}
