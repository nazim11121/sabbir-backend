<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;
use Laravel\Sanctum\HasApiTokens;
// use App\Traits\LogsCustomActivity;
// use Spatie\Activitylog\LogOptions;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasApiTokens, HasFactory, Notifiable, HasRoles, SoftDeletes; //, LogsCustomActivity;

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
        'total_invest_amount',
        'total_commissiom_amount',
        'total_withdraw_amount',
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
        return $this->hasMany(BuyPackage::class, 'user_id')->orderBy('id', 'desc');
    }

    public function deposits(){
        return $this->hasMany(TDeposit::class, 'user_id')->orderBy('id', 'desc');
    }

    public function invests(){
        return $this->hasMany(TInvest::class, 'user_id')->orderBy('id', 'desc');
    }

    public function withdraws(){
        return $this->hasMany(Withdraw::class, 'user_id')->orderBy('id', 'desc');
    }

    public function commissions(){
        return $this->hasMany(Commission::class, 'user_id')->orderBy('id', 'desc');
    }

    public function reviews(){
        return $this->hasMany(Review::class, 'user_id')->orderBy('id', 'desc');
    }

    public function getTotalWithdrawAttribute()
    {
        return $this->withdraws()->where('payment_status','!=', 2)->sum('amount');
    }

    public function getTotalDepositAttribute()
    {
        return $this->deposits()->where('payment_status', 1)->sum('amount');
    }

    public function getTotalInvestAttribute()
    {
        return $this->invests()->where('payment_status', 1)->sum('amount');
    }

    public function getFlexibleInvestmentSumAttribute()
    {
        return $this->invests()->where('payment_status', 1)->where('investment_type', 'flexible')->sum('amount');
    }

    public function getLockedInvestmentSumAttribute()
    {
        return $this->invests()->where('payment_status', 1)->where('investment_type', 'locked')->sum('amount');
    }

    public function referrals()
    {
        // All users who used this user's own_refer_code
        return $this->hasMany(User::class, 'refer_code', 'own_refer_code');
    }

    public function referrer()
    {
        // The user who owns the refer_code this user used
        return $this->belongsTo(User::class, 'refer_code', 'own_refer_code');
    }

    public function getTotalReferralCountAttribute()
    {
        // return $this->referrals()->count();
        return $this->referrals()
        ->whereDate('created_at', now()->toDateString())
        ->count();
    }

    // public function getActivitylogOptions(): LogOptions
    // {
    //     return LogOptions::defaults()
    //     ->logOnly(['name', 'first_name', 'last_name', 'email', 'phone_number', 'password', 'google_id', 'account_type',
    //     'otp', 'otp_expires_at', 'otp_sttaus', 'owner_id'])
    //     ->logOnlyDirty();
    // }

    public function unread_notifications(){
        return $this->hasMany(Commission::class, 'user_id')->where('status', 1)->orderBy('id', 'desc');
    }

    public function allRelevantNotifications()
    {
        return Notification::where(function ($q) {
                    $q->where('user_id', $this->id)
                    ->orWhere('user_id', 0);
                })
                ->where('read_at', null)
                ->where('status', 1)
                ->orderBy('id', 'desc')
                ->get();
    }

    public function mailAccount(){
        return $this->belongsTo(MailAccount::class, 'id','user_id');
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
