<?php

namespace App\Models\Api;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\LogsCustomActivity;
use Spatie\Activitylog\LogOptions;

class TBusinessRating extends Model
{
    use SoftDeletes, LogsCustomActivity;

    protected $guarded = [];

    protected $dates = ['deleted_at'];

    public function user()
    {
        return $this->belongsTo(\App\Models\User::class);
    }

    public function businessList()
    {
        return $this->belongsTo(\App\Models\Api\TBusiness::class);
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['user_id', 'business_id', 'rating_star', 'description', 'image', 'holding_time', 'status'])
        ->logOnlyDirty();
    }
}
