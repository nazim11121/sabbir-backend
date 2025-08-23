@extends('layouts.app')

@section('content')
    <div class="content-body">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-sm-12 col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Assigned Role</h4>
                            <a class="btn btn-info" href="{{ route('assign-role.create') }}">Add</a>
                        </div>

                        <div class="card-body">
                            <table id="example" class="display" style="min-width: 845px;color:black">
                                <thead>
                                    <tr>
                                        <th>SL</th>
                                        <th>User</th>
                                        <th>Role</th>
                                        <th>Permissions</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($users as $sl => $user)
                                        <tr>
                                            <td>{{ $sl + 1 }}</td>
                                            <td>{{ $user->name }}</td>
                                            <td>
                                                @forelse ($user->getRoleNames() as $roleName)
                                                    <span class="badge bg-primary text-white">{{ $roleName }}</span>
                                                @empty
                                                    NA
                                                @endforelse
                                            </td>
                                            <td>
                                                @forelse ($user->getAllPermissions() as $permission)
                                                    <span
                                                        class="badge bg-info text-white mx-1 my-1">{{ $permission->name }}</span>
                                                @empty
                                                    NA
                                                @endforelse
                                            </td>
                                            <td class="d-flex">
                                                <a href="{{ route('assign-role.edit', $user->id) }}"
                                                    class="btn btn-primary mx-2 btn-sm">Edit</a>

                                                <a data-link="{{ route('assign-role.destroy', $user->id) }}"
                                                    class="btn btn-danger delete btn-sm text-white">Delete</a>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
