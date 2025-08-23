<?php

namespace App\Models\Api;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\LogsCustomActivity;
use Spatie\Activitylog\LogOptions;

class TSaveBusiness extends Model
{
    use SoftDeletes, LogsCustomActivity;

    protected $guarded = [];

    protected $dates = ['deleted_at'];

    public function business() {
        return $this->belongsTo(TBusiness::class, 'business_id', 'id');
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['user_id', 'business_id', 'status'])
        ->logOnlyDirty();
    }
    
}
