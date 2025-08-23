@extends('layouts.app')

@section('content')
    <!-- end page title -->
    <div class="content-body">
        <div class="container">
            <div class="col-lg-12 col-sm-12 col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Update Permissions</h4>
                        <a class="btn btn-info" href="{{ route('permissions.index') }}">List</a>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('permissions.update', $permission->id) }}" method="POST">
                            @csrf

                            @method('PUT')

                            <div class="row">
                                <div class="col-lg-12 my-2">
                                    <div class="form-group mb-1">
                                        <label>Permission Name* (Required)</label>
                                        <input type="text" name="name"
                                            class="form-control @error('name')
                                                    is-invalid
                                                @enderror"
                                            value="{{ $permission->name }}" placeholder="Ex: Create User(if your permission key name is create_user)">
                                    </div>
                                    <span class="text-danger mt-n1" style="font-size: .9rem">
                                        Note: Write Create User(if your permission key name is create_user).
                                    </span>
                                </div>

                                <div class="col-lg-12 my-2">
                                    <div class="form-group">
                                        <label>Permission Group (Optional)</label>
                                        <select name="group_name"
                                            class="form-control @error('group_name')
                                            is-invalid
                                        @enderror">

                                            <option value="">Select Group</option>
                                            @foreach ($permissionGroups as $permissionGroup)
                                                <option value="{{ $permissionGroup->name }}" @selected($permission->group_name == $permissionGroup->name)>
                                                    {{ $permissionGroup->name }}</option>
                                            @endforeach

                                            @error('group_name')
                                                <strong class="text-danger">
                                                    {{ $message }}
                                                </strong>
                                            @enderror
                                        </select>
                                    </div>
                                </div>

                                <div class="col-lg-6 my-2">
                                    <button class="btn btn-primary" type="submit">
                                        <i class="fa-solid fa-floppy-disk"></i>
                                        Update</button>
                                </div>

                            </div>
                        </form>
                    </div>
                </div> <!-- tab-content -->
            </div>
        </div> <!-- end card-body -->
    </div>
@endsection
