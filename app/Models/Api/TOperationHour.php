<?php

namespace App\Models\Api;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\LogsCustomActivity;
use Spatie\Activitylog\LogOptions;

class TOperationHour extends Model
{
    use SoftDeletes, LogsCustomActivity;

    protected $guarded = [];

    protected $dates = ['deleted_at'];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['business_id', 'day', 'open_time', 'closed_time', 'status'])
        ->logOnlyDirty();
    }
}
