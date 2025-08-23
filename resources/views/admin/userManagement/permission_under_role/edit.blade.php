@extends('admin.admin')

@section('content')
    <div class="container" style="margin-top: 100px;">
        <a href="{{ route('admin.permission_under_role.index') }}" class="btn btn-primary my-3">List</a>
        <div class="row">
            <div class="col-lg-12 my-3">
                <div class="card">
                    <div class="card-header">
                        <h3 class="m-auto text-center">Update</h3>
                    </div>

                    <div class="card-body">
                        <form action="{{ route('admin.permission_under_role.update', $roleId) }}" method="POST">
                            @csrf

                            @method('PUT')

                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label>Role</label>
                                        <select name="role_id"
                                            class="form-control @error('role_id')
                                            is-invalid
                                        @enderror">
                                            <option selected disabled>Select Role</option>
                                            @foreach ($roles as $role)
                                                <option value="{{ $role->id }}" @selected($roleId == $role->id) disabled>
                                                    {{ $role->name }}</option>
                                            @endforeach
                                        </select>


                                    </div>
                                </div>


                                <div class="col-lg-12">
                                    <div class="form-gorup mb-3 pl-4">
                                        <input type="checkbox" class="form-check-input" id="check"> Primary
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-6">
                                    <h2>Group Name</h2>
                                    <hr>
                                </div>

                                <div class="col-lg-6">
                                    <h2>Permissions</h2>
                                    <hr>
                                </div>

                                @foreach ($groupNames as $groupName)
                                    <div class="col-lg-6 my-2">

                                        <span>{{ $groupName->group_name }}</span>
                                    </div>

                                    <div class="col-lg-6 my-2">
                                        @php
                                            $permissions = App\Models\User::getPermissionByGroupName(
                                                $groupName->group_name,
                                            );
                                        @endphp

                                        @foreach ($permissions as $permission)
                                            <div class="my-1">
                                                <input type="checkbox" name="permission_id[]"
                                                    class="form-check-input @error('permission_id')
                                                    is-invalid
                                                @enderror"
                                                    value="{{ $permission->id }}"
                                                    @foreach ($roleHasPermissions as $roleHasPermission)
                                                        @checked($roleHasPermission->permission_id == $permission->id) @endforeach>
                                                {{ $permission->name }}
                                            </div>
                                        @endforeach

                                    </div>
                                @endforeach
                            </div>

                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        $('#check').click(function(event) {
            if (this.checked) {
                $(':checkbox').prop('checked', true);
            } else {
                $(':checkbox').prop('checked', false);
            }
        });
    </script>
@endpush
