@extends('layouts.app')
@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <!-- row -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Commission List</h4>
                            @can('business-category-add-btn')
                                <a class="btn btn-info" href="{{ route('commission.create') }}">Add</a>
                            @endcan

                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="example" class="display" style="min-width: 845px;color:black">
                                    <thead>
                                        <tr>
                                            <th>Sl</th>
                                            <th>Customer Name</th>
                                            <th>Commission Type</th>
                                            <th>Percentage</th>
                                            <th>Amount</th>
                                            <th>Remarks</th>
                                            <th>Status</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($datas as $key => $value)
                                            <tr>
                                                <td>{{ ++$key }}</td>
                                                <td>{{ $value->user->name }}<br>{{ $value->user->email }}</td>
                                                <td>{{ $value->commission_type }}</td>
                                                <td>{{ $value->percentage }}</td>
                                                <td>{{ $value->amount }}</td>
                                                <td>{{ $value->remarks }}</td>
                                                <td>
                                                    @if ($value->status == 1)
                                                        <span
                                                            class="bg-success rounded text-white px-2 py-1 inline-block">Active</span>
                                                        </span>
                                                    @else
                                                        <span
                                                            class="bg-danger rounded text-white px-2 py-1 inline-block">Inactive</span>
                                                    @endif
                                                </td>

                                                <td class="text-center align-middle">
                                                    <div class="d-flex justify-content-center align-items-center">
                                                        @can('business-category-edit-btn')
                                                        <!-- <a href="{{ route('commission.edit', $value->id) }}"
                                                            class="btn btn-primary btn-sm mx-2 d-inline-flex align-items-center">
                                                            <i class="fa fa-edit me-1"></i> Edit
                                                        </a> -->
                                                        @endcan

                                                        @can('business-category-delete-btn')
                                                            <form action="{{ route('commission.delete', $value->id) }}"
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
    </div>
@endsection
