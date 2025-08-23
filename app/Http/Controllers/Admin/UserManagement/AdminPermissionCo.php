<?php

namespace App\Http\Controllers\Admin\UserManagement;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
// use Spatie\Permission\Models\Permission;
use App\Models\Permission;

use Spatie\Permission\Models\Role;
use Str;

class AdminPermissionCo extends Controller
{
    public function index()
    {
        try {
            $permissions = Permission::orderBy('id', 'DESC')->get();

            return view('admin.userManagement.permission.index', compact('permissions'));
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    public function create()
    {
        try {
            $permissionGroups = Permission::whereNull('group_name')->get();

            return view('admin.userManagement.permission.create', [
                'permissionGroups'          => $permissionGroups,
            ]);
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name'                  => 'required|unique:permissions,name',
            'group_name'            => 'nullable',
        ]);

        try {
            $data['permission_key'] = Str::slug($request->name);
            Permission::create($data);

            return redirect()->route('permissions.index')->with('success', 'Created Successfully');
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    public function edit(Permission $permission)
    {
        try {
            $permissionGroups = Permission::whereNull('group_name')->get();

            return view('admin.userManagement.permission.edit', [
                'permission'            => $permission,
                'permissionGroups'      => $permissionGroups,
            ]);
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    public function update(Request $request, Permission $permission)
    {
        $data = $request->validate([
            'name'                          => 'required|unique:permissions,name,' . $permission->id,
            'group_name'                    => 'nullable',
        ]);

        try {
            $data['permission_key'] = Str::slug($request->name);
            $permission->update($data);

            return redirect()->route('permissions.index')->with('success', 'Updated Successfully');
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    public function destroy(Permission $permission)
    {
        try {
            $permission->delete();

            return redirect()->route('permissions.index')->with('success', 'Deleted Successfully');
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    public function show(Permission $permission)
    {
        try {
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }
}
