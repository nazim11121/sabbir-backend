<?php

namespace App\Models\Api;

use App\Models\Admin\TAdminRestaurant;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\LogsCustomActivity;
use Spatie\Activitylog\LogOptions;

class TBusiness extends Model
{
    use SoftDeletes, LogsCustomActivity;

    protected $guarded = [];

    protected $dates = ['deleted_at'];

    public function businessOwnerInfos()
    {
        return $this->hasMany(TBusinessOwnerInfo::class, 'business_id');
    }

    public function businessProfileVisitors()
    {
        return $this->hasMany(TBusinessProfileVisitor::class, 'business_id', 'id');
    }

    public function saveBusinessLists()
    {
        return $this->hasMany(TSaveBusiness::class, 'business_id', 'id');
    }

    public function restaurant()
    {
        return $this->belongsTo(TAdminRestaurant::class, 'restaurant_id', 'id');
    }

    public function businessCategory()
    {
        return $this->belongsTo(\App\Models\Admin\TBusinessCategory::class, 'business_category_id');
    }

    // public function businessSubCategory()
    // {
    //     return $this->belongsTo(\App\Models\Admin\TBusinessSubCategory::class, 'business_subcategory_id');
    // }

    protected $casts = [
        'business_subcategory_id' => 'array', // Cast JSON array to PHP array
    ];

    public function getBusinessSubCategoriesAttribute()
    {
        $ids = $this->business_subcategory_id ?? [];
        return \App\Models\Admin\TBusinessSubCategory::whereIn('id', $ids)->get();
    }

    public function getBusinessSubCategoryNamesAttribute()
    {
        return $this->businessSubCategories->pluck('name')->toArray();
    }

    public function businessTags()
    {
        return $this->belongsTo(\App\Models\Admin\TBusinessTags::class, 'business_tags_id');
    }

    public function countryName()
    {
        return $this->belongsTo(\App\Models\Admin\TAdminCountry::class, 'country', 'id');
    }

    public function stateName()
    {
        return $this->belongsTo(\App\Models\Admin\TAdminState::class, 'state', 'id');
    }

    public function cityName()
    {
        return $this->belongsTo(\App\Models\Admin\TAdminCity::class, 'city', 'id');
    }

    public function operationData()
    {
        return $this->hasMany(\App\Models\Api\TOperationHour::class, 'business_id');
    }

    public function galleryData()
    {
        return $this->hasMany(\App\Models\Api\TBusinessGallery::class, 'business_id');
    }

    public function ratings()
    {
        return $this->hasMany(\App\Models\Api\TBusinessRating::class, 'business_id')->where('status', 1)->orderBy('id', 'desc');
    }

    public function ratingsWithInactive()
    {
        return $this->hasMany(\App\Models\Api\TBusinessRating::class, 'business_id')->orderBy('id', 'desc');
    }

    public function averageRating()
    {
        $avarage = $this->ratings()->where('status', 1)->avg('rating_star');
        return number_format($avarage, 1);
    }

    public function halalCertificateData()
    {
        return $this->hasMany(\App\Models\Api\THalalCertificateData::class, 'business_id');
    }

    // new dev code start
    public function paymentInfo()
    {
        return $this->belongsTo(\App\Models\Api\TPayment::class, 'payment_id', 'id');
    }
    // new dev code end

    // get business-type name
    public function getBusinessTypeNameAttribute()
    {
        $typeIds = is_string($this->business_type_id)
            ? json_decode($this->business_type_id, true)
            : $this->business_type_id;

        $typeIds = is_array($typeIds) ? array_map('intval', $typeIds) : [];

        return \App\Models\Admin\TBusinessType::whereIn('id', $typeIds)
            ->pluck('name')
            ->toArray();
    }

    // get affiliation name
    public function getAffiliationNameAttribute()
    {
        // $affiliationIds = array_map('intval', $this->affiliation_id ?? []);
        $affiliationIds = is_string($this->affiliation_id)
            ? json_decode($this->affiliation_id, true)
            : $this->affiliation_id;

        $affiliationIds = is_array($affiliationIds) ? array_map('intval', $affiliationIds) : [];

        return \App\Models\Admin\TAdminAffiliation::whereIn('id', $affiliationIds)
            ->pluck('name')
            ->toArray();
    }

    // get creed-tags name
    public function getCreedTagsNameAttribute()
    {
        $creedTagsIds = is_string($this->creed_tags_id)
            ? json_decode($this->creed_tags_id, true)
            : $this->creed_tags_id;

        $creedTagsIds = is_array($creedTagsIds) ? array_map('intval', $creedTagsIds) : [];

        return \App\Models\Admin\TCreedTags::whereIn('id', $creedTagsIds)
            ->pluck('name')
            ->toArray();
    }

    // get restaurant name
    public function getRestaurantNameAttribute()
    {
        $restaurantIds = is_string($this->restaurant_id)
            ? json_decode($this->restaurant_id, true)
            : $this->restaurant_id;

        $restaurantIds = is_array($restaurantIds) ? array_map('intval', $restaurantIds) : [];

        return \App\Models\Admin\TAdminRestaurant::whereIn('id', $restaurantIds)
            ->pluck('name')
            ->toArray();
    }

    // get business activity log options stored/updated in the database
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['business_owner_id', 'payment_id', 'business_name', 'business_type_id', 'business_category_id', 'business_subcategory_id', 'creed_tags_id', 'business_email', 'country_code', 'business_phone_number', 'business_website', 'address', 'country', 'state', 'city', 'zip_code', 'lat', 'long', 'service_area', 'description', 'hotline_country_code', 'customer_hotline', 'customer_email_leads', 'business_profile_image', 'restaurant_id', 'halal_certificate', 'handcut_text', 'handcut_certificate', 'affiliation_id', 'discount_code_description', 'discount_code', 'status'])
            ->logOnlyDirty();
    }

    protected static function boot()
    {
        parent::boot();

        static::deleting(function ($business) {
            if ($business->isForceDeleting()) {
                $business->galleryData()->forceDelete(); // Hard delete related data
                $business->operationData()->forceDelete();
                $business->ratings()->forceDelete();
            } else {
                $business->galleryData()->delete();
                $business->operationData()->delete();
                $business->ratings()->delete();
            }
        });

        static::restoring(function ($business) {
            $business->galleryData()->withTrashed()->restore(); // Restore related data
            $business->operationData()->withTrashed()->restore();
            $business->ratings()->withTrashed()->restore();
        });
    }
}
