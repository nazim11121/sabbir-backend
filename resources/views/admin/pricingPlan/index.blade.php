@extends('layouts.app')

@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Pricing Plans List</h4>
                            @can('pricing-plan-add-btn')
                                <a class="btn btn-info" href="{{ route('pricing-plan.create') }}">Add</a>
                            @endcan

                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="example" class="display" style="min-width: 845px;color:black">
                                    <thead>
                                        <tr>
                                            <th>Sl</th>
                                            <th>Plan Type</th>
                                            <th>Pricing</th>
                                            <th>Duration</th>
                                            <th>Key Tag</th>
                                            <th>Features</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($datas as $key => $value)
                                            <tr>
                                                <td>{{ ++$key }}</td>
                                                <td>{{ $value->type_name }}</td>
                                                <td>{{ $value->pricing }}</td>
                                                <td>{{ $value->plan_duration }}</td>
                                                <td>{{ $value->key_tag }}</td>
                                                <td>
                                                    @foreach ($value->feature_title as $index => $title)
                                                        {{ $title }} {{ $value->feature_status[$index] == 1 ? '(Active)' : '(Inactive)' }},<br>
                                                    @endforeach
                                                </td>
                                                <td>
                                                    @if ($value->status == 1)
                                                    <span>Active</span>@else<span>Inactive</span>
                                                    @endif
                                                </td>
                                                <td>
                                                    @can('pricing-plan-edit-btn')
                                                        <a href="{{ route('pricing-plan.edit', $value->id) }}"
                                                            class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> Edit</a>
                                                    @endcan

                                                    @can('pricing-plan-delete-btn')
                                                        <form action="{{ route('pricing-plan.destroy', $value->id) }}"
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
