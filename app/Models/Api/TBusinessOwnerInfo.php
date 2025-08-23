<?php

namespace App\Models\Api;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\LogsCustomActivity;
use Spatie\Activitylog\LogOptions;

class TBusinessOwnerInfo extends Model
{
    use SoftDeletes, LogsCustomActivity;

    protected $guarded = [];

    protected $dates = ['deleted_at'];

    public function business()
    {
        return $this->belongsTo(TBusiness::class, 'business_id');
    }

    public function users(){
        return $this->belongsTo(\App\Models\User::class, 'user_id');
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['first_name', 'last_name', 'email', 'country_code', 'phone_number', 'address', 'status'])
        ->logOnlyDirty();
    }

    protected static function boot()
    {
        parent::boot();

        static::deleting(function ($ownerInfo) {
            if ($ownerInfo->isForceDeleting()) {
                $ownerInfo->business()->forceDelete(); // Hard delete related data
            } else {
                $ownerInfo->business()->delete(); // Soft delete related data
            }
        });

        static::restoring(function ($ownerInfo) {
            $ownerInfo->business()->withTrashed()->restore(); // Restore related data
        });
    }
}
