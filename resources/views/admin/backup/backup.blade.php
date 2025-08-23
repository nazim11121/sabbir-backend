@extends('layouts.app')
@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12 col-xxl-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Backup Files</h4>
                            <a class="btn btn-primary" href="{{route('backup-database')}}">
                                <i class="fa fa-database mx-1"></i>
                                Click to Recent Backup</a>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="example" class="display" style="min-width: 845px;color:black">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>📁 Name</th>
                                            <th>📏 Size</th>
                                            <th>📅 Created Time</th>
                                            <th>⚙️ Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($files as $key => $file)
                                            <tr>
                                                <td>{{++$key}}</td>
                                                <td>{{$file['name']}}</td>
                                                <td>{{$file['size']}}</td>
                                                <td>{{ \Carbon\Carbon::parse($file['created_at'])->diffForHumans() }}</td>
                                                <td>
                                                    <a href="{{ route('backup-download', $file['name']) }}" class="btn btn-primary btn-sm mx-2"><i class="fa fa-download"></i> Download</a>
                                                    <form action="{{ route('backup-delete', $file['name']) }}" method="POST" style="display: inline-block;">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this?')">
                                                            <i class="fa fa-trash"></i> Delete
                                                        </button>
                                                    </form>
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
    </div>
@endsection
