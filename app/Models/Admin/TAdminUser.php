<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;
// use Spatie\Permission\Models\Permission;
use App\Models\Permission;

class TAdminUser extends Authenticatable
{
    use HasFactory, Notifiable, HasRoles;

    protected $table = 't_admin_users';

    protected $fillable = [
        'name', 'email', 'password',  'phone_number', 'address', 'country', 'state', 'city', 'zip_code'
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'password' => 'hashed',
        ];
    }

    public static function getPermisionGroups()
    {
        $groupNames = Permission::whereNull('group_name')->orderBy('priority_id','ASC')->get();
        return $groupNames;
    }

    public static function getPermissionByGroupName($group_name)
    {
        $permissions = Permission::where('group_name', $group_name)->get();
        return $permissions;
    }
}
