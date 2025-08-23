@extends('layouts.app')

@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12 col-xxl-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Edit Business Type</h4>
                        </div>
                        <div class="card-body">
                            <div class="basic-form">
                                <form method="POST" action="{{ route('roles.update', $role->id) }}">
                                    @csrf
                                    @method('PUT')

                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <strong>Name:</strong>
                                                <input type="text" name="name" placeholder="Name" class="form-control"
                                                    value="{{ $role->name }}">
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <div class="form-gorup mb-3 pl-4">
                                                    <input type="checkbox" class="form-check-input" id="check">
                                                    All Permissions
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

                                                </div>

                                                <div class="row" style="display: flex; align-items: center;">
                                                    @foreach ($groupNames as $groupName)
                                                        <div class="col-lg-6 my-3">
                                                            <input type="checkbox" class="checkedGroup"
                                                                name="permission[{{ $groupName->id }}]"
                                                                value="{{ $groupName->id }}"
                                                                @foreach ($roleHasPermissions as $roleHasPermission)
                                                                        @checked($roleHasPermission->permission_id == $groupName->id) @endforeach>
                                                            {{ $groupName->name }}
                                                        </div>

                                                        <div class="col-lg-6 my-3">
                                                            @php
                                                                $permissions = \App\Models\Permission::where(
                                                                    'group_name',
                                                                    $groupName->name,
                                                                )->get();
                                                            @endphp

                                                            @foreach ($permissions as $permission)
                                                                <div class="my-1">
                                                                    <input type="checkbox"
                                                                        name="permission[{{ $permission->id }}]"
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
                                            </div>
                                        </div>



                                        <div class="col-xs-12 col-sm-12 col-md-12 text-left">
                                            <button type="submit" class="btn btn-primary btn-sm"><i
                                                    class="fa-solid fa-floppy-disk"></i> Update</button>
                                            <a href="{{ url()->previous() }}" class="btn btn-secondary btn-sm">Cancel</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection



@push('script')
    <script>
        $('#check').click(function(event) {
            if (this.checked) {
                $(':checkbox').prop('checked', true);
            } else {
                $(':checkbox').prop('checked', false);
            }
        });
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.querySelectorAll(".checkedGroup").forEach(groupCheckbox => {
                groupCheckbox.addEventListener("change", function() {
                    let parentDiv = this.closest(".col-lg-6").nextElementSibling;

                    if (parentDiv) {
                        let checkboxes = parentDiv.querySelectorAll('input[type="checkbox"]');
                        checkboxes.forEach(checkbox => {
                            checkbox.checked = groupCheckbox.checked;
                        });
                    }
                });
            });
        });
    </script>
@endpush
