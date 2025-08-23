@extends('layouts.app')

@section('content')
<div class="content-body">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-sm-12 col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Update Assign Role</h4>
                        <a class="btn btn-info" href="{{ route('assign-role.index') }}">Add</a>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('assign-role.update', $userId) }}" method="POST">
                            @csrf

                            @method('PUT')

                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group my-2">
                                        <label class="my-1">Select User</label>
                                        <select name="user_id"
                                            class="form-control select @error('user_id')
                                            is-invalid
                                        @enderror">
                                            <option value="">User</option>
                                            @foreach ($users as $user)
                                                <option value="{{ $user->id }}" @selected($user->id == $userId) disabled>
                                                    {{ $user->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="form-group my-2">
                                        <label class="my-1">Select Role</label>
                                        <select name="role_id"
                                            class="form-control select @error('role_id')
                                            is-invalid
                                        @enderror">
                                            <option value="">Role</option>
                                            @foreach ($roles as $role)
                                                <option value="{{ $role->id }}" @selected($role->id == $roleId)>
                                                    {{ $role->name }}</option>
                                            @endforeach
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
        </div>
    </div> <!-- end card-body -->
</div>
@endsection
