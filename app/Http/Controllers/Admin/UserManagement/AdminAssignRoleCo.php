<?php

namespace App\Http\Controllers\Admin\UserManagement;

use App\Http\Controllers\Controller;
use App\Models\Admin\TAdminUser;
use Illuminate\Http\Request;
// use Spatie\Permission\Models\Permission;
use App\Models\Permission;
use Spatie\Permission\Models\Role;


class AdminAssignRoleCo extends Controller
{
    public function index()
    {
        try {
            $users = TAdminUser::all();

            return view('admin.userManagement.assign_role.index', [
                'users'         => $users,
            ]);
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    public function create()
    {
        try {
            $roles = Role::all();
            $users = TAdminUser::all();

            return view('admin.userManagement.assign_role.create', [
                'roles'             => $roles,
                'users'             => $users,
            ]);
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    public function store(Request $request)
    {
        $request->validate([
            'role_id'           => 'required',
            'user_id'           => 'required',
        ]);

        try {
            $user = TAdminUser::findOrFail($request->user_id);
            $role = Role::findOrFail($request->role_id);

            // delete previous roles
            $user->syncRoles([]);
            $user->assignRole($role);

            return back()->with('success', 'Role assigned into user');
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    public function edit($userId)
    {
        try {
            $roles = Role::all();
            $users = TAdminUser::all();

            // get role id
            $user = TAdminUser::findOrFail($userId);
            $roleName = $user->getRoleNames()->first(); // Get the first role name

            if (!empty($roleName)) {
                $roleId = \Spatie\Permission\Models\Role::findByName($roleName)->id;
            } else {
                $roleId = '';
            }

            return view('admin.userManagement.assign_role.edit', [
                'userId'         => $userId,
                'roleId'         => $roleId,
                'users'          => $users,
                'roles'          => $roles,
            ]);
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    public function update(Request $request, $userId)
    {
        $request->validate([
            'role_id'           => 'required',
        ]);

        try {
            $user = TAdminUser::findOrFail($userId);
            $role = Role::findOrFail($request->role_id);

            // delete previous roles
            $user->syncRoles([]);
            $user->assignRole($role);

            return redirect()->route('assign-role.index')->with('success', 'Role assigned into user');
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    public function destroy($userId)
    {
        try {
            $user = TAdminUser::findOrFail($userId);
            $user->syncRoles([]);

            return back()->with('success', 'Role removed from user');
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }
}
