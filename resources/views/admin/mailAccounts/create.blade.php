@extends('layouts.app')

@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12 col-xxl-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Add</h4>
                        </div>
                        <div class="card-body">
                            <div class="basic-form">

                                <form method="POST" action="{{ route('mail-accounts.store') }}">
                                    @csrf

                                    <div class="mb-3">
                                        <label>Name</label>
                                        <input type="text" name="name" value="Quotex Mail" class="form-control" required>
                                    </div>

                                    <div class="mb-3">
                                        <label>Email (Username)</label>
                                        <input type="email" name="username" class="form-control" required>
                                    </div>

                                    <div class="mb-3">
                                        <label>Password (App Password)</label>
                                        <input type="password" name="password" class="form-control" required>
                                    </div>

                                    <div class="mb-3">
                                        <label>Quotex Password</label>
                                        <input type="text" name="quotex_password" class="form-control">
                                    </div>

                                    <div class="mb-3">
                                        <label>Host</label>
                                        <input type="text" name="host" value="imap.gmail.com" class="form-control">
                                    </div>

                                    <div class="mb-3">
                                        <label>Port</label>
                                        <input type="number" name="port" value="993" class="form-control">
                                    </div>

                                    <div class="mb-3">
                                        <label>Encryption</label>
                                        <input type="text" name="encryption" value="ssl" class="form-control">
                                    </div>

                                    <button type="submit" class="btn btn-success">Save</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
