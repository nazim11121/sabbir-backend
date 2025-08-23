<?php

namespace App\Models\Api;

use Illuminate\Database\Eloquent\Model;

class TAdminMosqueData extends Model
{
    protected $guarded = [];

    public function getPhotosAttribute($value)
    {
        return json_decode($value) ?: [];
    }

    public function getOpeningHourAttribute($value)
    {
        return json_decode($value) ?: [];
    }
}
