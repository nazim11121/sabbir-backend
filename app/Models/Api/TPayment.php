<?php

namespace App\Models\Api;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\LogsCustomActivity;
use Spatie\Activitylog\LogOptions;

class TPayment extends Model
{
    use SoftDeletes, LogsCustomActivity;

    protected $guarded = [];

    protected $dates = ['deleted_at'];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['business_id ', 'session_id', 'invoice_id', 'product_id', 'payment_method_types', 'billing_address', 'subscription_plan_name', 'payable_amount', 'currency', 'customer_id', 'customer_email', 'discount', 'total_details', 'mode', 'subscription_id', 'client_secret', 'expand', 'receipt_url', 'payment_status', 'status'])
        ->logOnlyDirty();
    }
}
