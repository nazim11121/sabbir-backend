@extends('layouts.app')

@section('content')
    <!-- start page title -->
    <!-- end page title -->
    <div class="content-body">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-sm-12 col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Permission List</h4>
                            @can('permissions-add-btn')
                                <a class="btn btn-info" href="{{ route('permissions.create') }}">Add</a>
                            @endcan

                        </div>
                        <div class="card-body">
                            <table id="example" class="display" style="min-width: 845px;color:black">
                                <thead>
                                    <tr>
                                        <th>SL</th>
                                        <th>Permission Name</th>
                                        <th>Permission Group</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($permissions as $sl => $permission)
                                        <tr>
                                            <td>{{ $sl + 1 }}</td>
                                            <td>{{ $permission->name }}</td>
                                            <td>{{ $permission->group_name }}</td>
                                            <td>
                                                @can('permissions-edit-btn')
                                                    <a href="{{ route('permissions.edit', $permission->id) }}"
                                                        class="btn btn-primary">Edit</a>
                                                @endcan

                                                @can('permissions-delete-btn')
                                                    <form action="{{ route('permissions.destroy', $permission->id) }}"
                                                        method="POST" style="display: inline-block;">
                                                        @csrf

                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-danger btn-sm"
                                                            onclick="return confirm('Are you sure you want to delete this?')">
                                                            <i class="fa fa-trash"></i> Delete
                                                        </button>
                                                    </form>
                                                @endcan

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
