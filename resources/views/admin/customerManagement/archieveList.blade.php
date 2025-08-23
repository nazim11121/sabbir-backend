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
                            <h4 class="card-title">Customer List</h4>
                            <!-- <a class="btn btn-info" href="{{ route('creed-tags.create') }}">Add</a> -->
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="example" class="display" style="min-width: 845px;color:black">
                                    <thead>
                                        <tr>
                                            <th>Sl</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Customer Type</th>
                                            <!-- <th>Status</th> -->
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($archiveData as $key => $value)
                                            <tr>
                                                <td>{{ ++$key }}</td>
                                                <td>{{ $value->first_name . ' ' . $value->last_name }}</td>
                                                <td>{{ $value->email }}</td>
                                                <td>{{ $value->phone_number }}</td>
                                                <td>
                                                    @if ($value->account_type == 'G')
                                                        <span class="badge badge-warning"> General </span>
                                                    @else
                                                        <span class="badge badge-info"> Business </span>
                                                    @endif
                                                </td>
                                                <!-- <td>
        @if ($value->status == 1)
<span>Active</span>@else<span>Inactive</span>
    @endif
        </td> -->
                                                <td>
                                                    <!-- <a href="{{ route('customers-details.view', $value->id) }}" class="btn btn-info btn-sm"><i class="fa fa-view"></i> View</a> -->
                                                    @can('archieve-list-retrieve-btn')
                                                        <a href="{{ route('customers.archive.list.retrieve', $value->id) }}"
                                                            class="btn btn-primary btn-sm"><i class="fa fa-undo"></i>
                                                            Retrieve</a>
                                                    @endcan
                                                    @can('archieve-list-delete-btn')
                                                        <form
                                                            action="{{ route('customers.archive.list.parmanent-delete', $value->id) }}"
                                                            method="POST" style="display: inline-block;">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="btn btn-danger btn-sm"
                                                                onclick="return confirm('Are you sure you want to delete this?')">
                                                                <i class="fa fa-trash-o"></i> Permanent Delete
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

                <div class="col-12 my-2">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Business List</h4>
                            <!-- <a class="btn btn-info" href="{{ route('creed-tags.create') }}">Add</a> -->
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="example2" class="display" style="min-width: 845px;color:black">
                                    <thead>
                                        <tr>
                                            <th>Sl</th>
                                            <th>Business Name</th>
                                            <th>Owner Info</th>
                                            <th>User Info</th>
                                            <th>Deleted Date</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($archiveBusinessData as $key => $value)
                                            <tr>
                                                @php
                                                    // business owner info
                                                    $ownerInfoName =
                                                        $value?->businessOwnerInfos?->first()?->first_name .
                                                        ' ' .
                                                        $value?->businessOwnerInfos?->first()?->last_name;
                                                    $ownerInfoEmail = $value?->businessOwnerInfos?->first()?->email;
                                                    $ownerInfoPhone = $value?->businessOwnerInfos?->first()?->phone_number;
                                                    $ownerInfoAddress = $value?->businessOwnerInfos?->first()?->address;

                                                    // user info
                                                    $userName = $value?->businessOwnerInfos?->first()?->users?->name;
                                                    $userEmail = $value?->businessOwnerInfos?->first()?->users?->email;
                                                    $userPhone = $value?->businessOwnerInfos?->first()?->users?->phone_number;
                                                    $userAddress = $value?->businessOwnerInfos?->first()?->users?->address;

                                                @endphp
                                                <td>{{ ++$key }}</td>
                                                <td>{{ $value->business_name }}</td>
                                                <td>
                                                    Name: {{ $ownerInfoName }} <br>
                                                    Email: {{ $ownerInfoEmail }} <br>
                                                    Phone: {{ $ownerInfoPhone }} <br>
                                                    Address: {{ $ownerInfoAddress }} <br>
                                                </td>

                                                <td>
                                                    Name: {{ $userName }} <br>
                                                    Email: {{ $userEmail }} <br>
                                                    Phone: {{ $userPhone }} <br>
                                                    Address: {{ $userAddress }} <br>
                                                </td>

                                                <td>{{date('d-F-Y', strtotime($value->deleted_at))}}</td>
                                                <td>
                                                    <a href="{{ route('business.account.restore', $value->id) }}"
                                                        class="btn btn-primary btn-sm"><i class="fa fa-undo"></i>
                                                        Retrieve</a>

                                                    {{-- @can('archieve-list-delete-btn')
                                                        <form
                                                            action="{{ route('customers.archive.list.parmanent-delete', $value->id) }}"
                                                            method="POST" style="display: inline-block;">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="btn btn-danger btn-sm"
                                                                onclick="return confirm('Are you sure you want to delete this?')">
                                                                <i class="fa fa-trash-o"></i> Permanent Delete
                                                            </button>
                                                        </form>
                                                    @endcan --}}
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
