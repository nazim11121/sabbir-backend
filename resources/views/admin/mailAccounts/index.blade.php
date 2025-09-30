@extends('layouts.app')

@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <!-- row -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Mail Accounts List</h4>
                            @can('business-category-add-btn')
                                <a class="btn btn-info" href="{{ route('mail-accounts.create') }}">Add</a>
                            @endcan

                        </div>
                        <div class="card-body">

                            <table id="example" class="table table-bordered table-responsive">
                                <thead>
                                    <tr>
                                        <th>Sl</th>
                                        <th>Name</th>
                                        <th>Email (Username)</th>
                                        <th>Host</th>
                                        <th>Port</th>
                                        <th>Encryption</th>
                                        <th>To Mail</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($accounts as $key=>$account)
                                    <tr>
                                        <td>{{ ++$key }}</td>
                                        <td>{{ $account->name }}</td>
                                        <td>{{ $account->username }}</td>
                                        <td>{{ $account->host }}</td>
                                        <td>{{ $account->port }}</td>
                                        <td>{{ $account->encryption }}</td>
                                        <td>{{ $account->to_mail }}</td>
                                        <td class="text-center align-middle">
                                                    <div class="d-flex justify-content-center align-items-center">
                                                        @can('business-category-edit-btn')
                                                        <a href="{{ route('mail-accounts.edit', $account->id) }}"
                                                            class="btn btn-primary btn-sm mx-2 d-inline-flex align-items-center">
                                                            <i class="fa fa-edit me-1"></i> Edit
                                                        </a>
                                                        @endcan

                                                        @can('business-category-delete-btn')
                                                            <form action="{{ route('mail-accounts.destroy', $account->id) }}"
                                                                method="POST" onsubmit="return confirm('Are you sure you want to delete this?')">
                                                                @csrf
                                                                @method('DELETE')
                                                                <button type="submit" class="btn btn-danger btn-sm mx-2 d-inline-flex align-items-center">
                                                                    <i class="fa fa-trash mr-1"></i> Delete
                                                                </button>
                                                            </form>
                                                        @endcan
                                                    </div>
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
