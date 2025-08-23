@extends('admin.admin')

@section('content')
    <div class="content-body">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h3>Create</h3>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('permission-under-role.store') }}" method="POST">
                                @csrf

                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label>Role</label>
                                            <select name="role_id"
                                                class="form-control @error('role_id')
                                            is-invalid
                                        @enderror">
                                                <option selected disabled>-- Select Role --</option>
                                                @foreach ($roles as $role)
                                                    <option value="{{ $role->id }}">{{ $role->name }}</option>
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
                                    <div class="col-lg-12">
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
                                                        value="{{ $permission->id }}">
                                                    {{ $permission->name }}
                                                </div>
                                            @endforeach
                                        </div>
                                    @endforeach
                                </div>

                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </form>
                        </div>
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
