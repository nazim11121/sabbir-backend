@extends('layouts.app')

@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12 col-xxl-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Edit</h4>
                        </div>
                        <div class="card-body">
                            <div class="basic-form">

                                <form method="POST" action="{{ route('mail-accounts.update', $data->id) }}">
                                    @csrf
                                    @method('PATCH')
                                    <input type="hidden" name="id" value="{{$data->id}}" class="form-control">
                                    <div class="mb-3">
                                        <label>Name</label>
                                        <input type="text" name="name" value="Quotex Mail" class="form-control" required>
                                    </div>

                                    <div class="mb-3">
                                        <label>Email (Username)</label>
                                        <input type="email" name="username" value="{{$data->username}}" class="form-control" required>
                                    </div>

                                    <div class="mb-3">
                                        <label>Password (App Password)</label>
                                        <input type="text" name="password" value="{{$data->password}}" class="form-control" required>
                                    </div>

                                    <div class="mb-3">
                                        <label>Host</label>
                                        <input type="text" name="host" value="{{$data->host}}" class="form-control">
                                    </div>

                                    <div class="mb-3">
                                        <label>Port</label>
                                        <input type="number" name="port" value="{{$data->port}}" class="form-control">
                                    </div>

                                    <div class="mb-3">
                                        <label>Encryption</label>
                                        <input type="text" name="encryption" value="{{$data->encryption}}" class="form-control">
                                    </div>

                                    <div class="mb-3">
                                        <label>Mail To</label>
                                        <input type="text" name="to_mail" value="{{$data->to_mail}}" class="form-control">
                                    </div>

                                    <div class="mb-3">
                                        <label>Quotex Password</label>
                                        <input type="text" name="quotex_password" value="{{$data->quotex_password}}" class="form-control">
                                    </div>

                                    <button type="submit" class="btn btn-success">Update</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
