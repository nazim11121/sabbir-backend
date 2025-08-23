@extends('layouts.app')

@section('content')
    <div class="content-body">
        <div class="container my-2">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Permission Under Role</h4>
                            {{-- <a class="btn btn-info" href="{{ route('permission-under-role.create') }}">Add</a> --}}
                        </div>

                        <div class="card-body">
                            <table id="example" class="display" style="min-width: 845px;color:black">
                                <thead>
                                    <tr>
                                        <th>SL</th>
                                        <th>Role Name</th>
                                        <th>Permissions</th>
                                        {{-- <th>Action</th> --}}
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($roles as $sl => $role)
                                        <tr>
                                            <td>{{ $sl + 1 }}</td>
                                            <td>{{ $role->name }}</td>
                                            <td>
                                                @forelse ($role->permissions as $permission)
                                                    <span class="bg-primary badge text-white mx-1 my-1">
                                                        {{ $permission->name }}</span>
                                                @empty
                                                    <span>NA</span>
                                                @endforelse
                                            </td>
                                            {{-- <td>
                                                <a href="{{ route('permission-under-role.edit', $role->id) }}"
                                                    class="btn btn-primary btn-sm mx-2 my-2">Edit</a>

                                                <a data-link="{{ route('permission-under-role.destroy', $role->id) }}"
                                                    class="btn btn-danger btn-sm delete text-white">Delete</a>

                                            </td> --}}
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
