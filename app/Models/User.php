<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;
use Laravel\Sanctum\HasApiTokens;
use App\Traits\LogsCustomActivity;
use Spatie\Activitylog\LogOptions;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasApiTokens, HasFactory, Notifiable, HasRoles, SoftDeletes, LogsCustomActivity;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'first_name',
        'last_name',
        'email',
        'phone_number',
        'password',
        'google_id',
        'avatar',
        'address',
        'country',
        'state',
        'city',
        'zip_code',
        'account_type',
        'otp',
        'otp_expires_at',
        'otp_sttaus',
        'owner_id',
        'refer_code',
        'own_refer_code',
        'level',
        'nid_image',
        'total_deposit_amount',
        'status'
    ];

    protected $dates = ['deleted_at'];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function buyPackages(){
        return $this->hasMany(BuyPackage::class, 'user_id');
    }

    public function deposits(){
        return $this->hasMany(TDeposit::class, 'user_id');
    }

    public function invests(){
        return $this->hasMany(TInvest::class, 'user_id');
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['name', 'first_name', 'last_name', 'email', 'phone_number', 'password', 'google_id', 'account_type',
        'otp', 'otp_expires_at', 'otp_sttaus', 'owner_id'])
        ->logOnlyDirty();
    }

    protected static function boot()
    {
        parent::boot();
        static::deleting(function ($user) {
            $user->buyPackages()->delete();
            $user->deposits()->delete();
            $user->invests()->delete();
        });
    }

}
