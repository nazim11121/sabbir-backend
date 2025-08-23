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
                            <h4 class="card-title">Customer's Business List</h4>
                            <!-- <a class="btn btn-success" href="{{ route('customers.create') }}">Add New Account</a> -->
                        </div>
                        <div class="card-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-4 mx-auto">
                                        <div class="card text-center">
                                            <form action="{{ route('customers.business.list') }}" method="get"
                                                id="auto-submit-form">
                                                <select class="form-control" name="business_status" id="businessStatus">
                                                    <option value="all">All</option>
                                                    <option value="incomplete" {{ $businessStatus == 'incomplete' ? 'selected' : '' }}>
                                                        Incomplete
                                                    </option>
                                                    <option value="pending" {{ $businessStatus == 'pending' ? 'selected' : '' }}>
                                                        Pending
                                                    </option>
                                                    <option value="published" {{ $businessStatus == 'published' ? 'selected' : '' }}>
                                                        Published
                                                    </option>
                                                    <option value="inactive" {{ $businessStatus == 'inactive' ? 'selected' : '' }}>
                                                        Inactive
                                                    </option>
                                                </select>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table id="example" class="display" style="min-width: 845px;color:black">
                                    <thead>
                                        <tr>
                                            <th>Sl</th>
                                            <th>Business Name</th>
                                            <th>Type</th>
                                            <th>Creed Tags</th>
                                            <th>Address</th>
                                            <th>Owner Info</th>
                                            <th>Status</th>
                                            @can('reviews-list-btn')
                                            <th>Action</th>
                                            @endcan
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($datas as $key => $value)
                                            <tr>
                                                <td>{{ ++$key }}</td>
                                                <td>{{ $value->business_name ??''}} </br>
                                                    Cat:<span class="badge badge-secondary">{{ $value->businessCategory->name ??''}}</span></br>
                                                    SubCat:<span class="badge badge-secondary">{{ $value->businessSubCategory->name ??''}}</span></br>
                                                    Email: {{ $value->business_email ??''}} </br>
                                                    Phone: {{ $value->country_code ??''}}{{ $value->business_phone_number ??''}} </br>
                                                    Cus.E.Leads: {{ $value->business_email ??''}} </br>
                                                    Cus.Hotline: {{ $value->hotline_country_code }}{{ $value->customer_hotline ??''}} </br>
                                                </td>
                                                <td>
                                                    @foreach ($value->getBusinessTypeNameAttribute() as $type)
                                                        <span class="badge badge-primary">{{ $type ??''}}</span> </br>
                                                    @endforeach
                                                </td>
                                                <td>
                                                    @foreach ($value->getCreedTagsNameAttribute() as $tag)
                                                        <span class="badge badge-info">{{ $tag ??''}}</span></br>
                                                    @endforeach
                                                </td>
                                                <td>{{ $value->address ??''}}</td>
                                                <td>
                                                    @foreach ($value->businessOwnerInfos as $owner)
                                                        {{ $owner->first_name ??''}} {{ $owner->last_name ??''}} </br> {{ $owner->email ??''}} </br> {{ $owner->phone_number ??''}} </br> {{ $owner->address ??''}} <br>
                                                    @endforeach
                                                </td>
                                                <td>@if ($value->status < 8 && $value->deleted_at == NULL)
                                                        <span class="badge badge-warning">Incomplete</span>
                                                    @elseif($value->status >= 8 && $value->onboard_status == 1 && $value->deleted_at == NULL)
                                                        <span class="badge badge-success">Published</span>
                                                    @elseif($value->status >= 8 && $value->onboard_status == 0 && $value->deleted_at == NULL)
                                                        <span class="badge badge-success">Inactive</span>
                                                    @elseif($value->deleted_at != NULL)
                                                        <span class="badge badge-danger">Deleted</span>
                                                    @endif
                                                </td>
                                                @can('reviews-list-btn')
                                                <td>
                                                    @if($value->deleted_at == NULL)
                                                    <a href="{{ route('customers.business.reviews', $value->id) }}"
                                                        class="btn btn-info btn-sm text-white">Reviews</a>
                                                    @else
                                                        <a href="{{ route('customers.business.reviews', $value->id) }}"
                                                        class="btn btn-info btn-sm text-white disabled">Reviews</a>
                                                    @endif
                                                </td>    
                                                @endcan
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
        document.getElementById('businessStatus').addEventListener('change', function() {
            document.getElementById('auto-submit-form').submit();
        });
    </script>
@endpush
