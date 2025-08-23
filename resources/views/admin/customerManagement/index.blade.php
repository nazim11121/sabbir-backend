@extends('layouts.app')
@push('style')
    <style>
        .custom-switch.custom-switch-md {
            padding-left: 2rem;
            padding-bottom: 0.8rem;
        }

        .custom-switch.custom-switch-md .custom-control-label::before {
            height: 1.5rem;
            width: 2.75rem;
            border-radius: 0.75rem;
            left: -2rem;
        }

        .custom-switch.custom-switch-md .custom-control-label::after {
            height: 1.25rem;
            width: 1.25rem;
            border-radius: 0.625rem;
            top: 0.125rem;
            left: -1.875rem;
            transition: transform 0.3s ease-in-out;
        }

        .custom-switch.custom-switch-md .custom-control-input:checked~.custom-control-label::after {
            transform: translateX(1.5rem) translateY(0.1rem);
        }


        /* Background when checked (green) */
        .custom-control-input:checked~.custom-control-label::before {
            background-color: green;
            border-color: green;
        }

        /* Background when not checked (red) */
        .custom-control-input:not(:checked)~.custom-control-label::before {
            background-color: #af0415;
            /* Bootstrap red */
            border-color: #dc3545;
        }
    </style>
@endpush

@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Customer List</h4>
                            <!-- <a class="btn btn-success" href="{{ route('customers.create') }}">Add New Account</a> -->
                        </div>
                        <div class="card-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-4 mx-auto">
                                        <div class="card text-center">
                                            <form action="{{ route('customers.list') }}" method="get"
                                                id="auto-submit-form">
                                                <select class="form-control" name="account_type" id="account_type">
                                                    <option value="all">All</option>
                                                    <option value="G" {{ $accountType == 'G' ? 'selected' : '' }}>
                                                        General
                                                        Account</option>
                                                    <option value="GB" {{ $accountType == 'GB' ? 'selected' : '' }}>
                                                        Business
                                                        Account</option>
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
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Customer Type</th>
                                            <th>Active Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($datas as $key => $value)
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

                                                <td>
                                                    <div class="custom-control custom-switch my-2 custom-switch-md">
                                                        <input type="checkbox" class="custom-control-input"
                                                            id="customSwitch{{ $value->id }}"
                                                            data-id="{{ $value->id }}"
                                                            {{ $value->status == 1 ? 'checked' : '' }}>
                                                        <label class="custom-control-label"
                                                            for="customSwitch{{ $value->id }}"></label>
                                                    </div>
                                                </td>

                                                <!-- <td>
            @if ($value->status == 1)
<span>Active</span>@else<span>Inactive</span>
    @endif
            </td> -->
                                                <td>
                                                    <a href="{{ route('customers-details.view', $value->id) }}"
                                                        class="btn btn-info btn-sm"><i class="fa fa-view"></i> View</a>

                                                    @can('customers-list-edit-btn')
                                                        <a href="{{ route('customers-list.edit', $value->id) }}"
                                                            class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> Edit</a>
                                                    @endcan

                                                    @can('customers-list-delete-btn')
                                                        <form action="{{ route('customers-list.delete', $value->id) }}"
                                                            method="POST" style="display: inline-block; margin-top: 10px;">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="btn btn-danger btn-sm"
                                                                onclick="return confirm('Are you sure you want to delete this?')">
                                                                <i class="fa fa-trash"></i> Archive
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


    <script>
        $(document).ready(function() {
            $('.custom-control-input').on('change', function() {
                let user_id = $(this).data('id');
                let is_active = $(this).is(':checked') ? 1 : 0;

                $.ajax({
                    url: '{{ route('customers-list.active-deactive') }}',
                    method: 'POST',
                    data: {
                        _token: $('meta[name="csrf-token"]').attr('content'),
                        user_id: user_id,
                        is_active: is_active,
                    },
                    success: function(response) {
                        location.reload();
                    },
                    error: function(xhr) {
                        console.error(xhr.responseText);
                    }
                });
            });
        });
    </script>
@endpush
