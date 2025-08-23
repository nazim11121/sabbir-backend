@extends('layouts.app')
@push('style')
@endpush
@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Reviews List</h4>
                            <!-- <a class="btn btn-success" href="{{ route('customers.create') }}">Add New Account</a> -->
                        </div>
                        <div class="card-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-4 mx-auto">
                                        <div class="card text-center">
                                            <span class="badge badge-primary"><h4 class="mt-2">{{ $reviews->business_name }}</h4></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table id="example" class="display" style="min-width: 845px;color:black">
                                    <thead>
                                        <tr>
                                            <th>Sl</th>
                                            <th>User</th>
                                            <th>Rating</th>
                                            <th>Description</th>
                                            <th>Photo</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($reviews->ratingsWithInactive as $key => $value)
                                            <tr>
                                                <td>{{ ++$key }}</td>
                                              
                                                <td>{{ $value->user->first_name . ' ' .$value->user->last_name }}</br>{{ $value->user->email }}</td>
                                                <td>{{ $value->rating_star }}</td>
                                                <td>{{ $value->description }}</td>
                                                <td>
                                                    @php
                                                        // Decode the JSON string into a PHP array
                                                        $data = json_decode($value->image, true);
                                                    @endphp

                                                    @foreach ($data as $image)
                                                        <div>
                                                            <!-- Display each image -->
                                                            <img src="{{ asset($image) }}" alt="Image" height="100" width="100" alt="img"/>
                                                        </div>
                                                    @endforeach
                                                </td>
                                                <td>
                                                    @if ($value->status == 1)
                                                        <span>Active</span>@else<span>Inactive</span>
                                                    @endif
                                                </td>
                                                <td>
                                                    @can('customers-list-delete-btn')
                                                        <form action="{{ route('customers.reviews.delete', $value->id) }}"
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
    </div>
@endsection
@push('script')
    <script>
        document.getElementById('account_type').addEventListener('change', function() {
            document.getElementById('auto-submit-form').submit();
        });
    </script>
@endpush
