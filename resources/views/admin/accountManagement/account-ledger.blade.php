@extends('layouts.app')

@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <form action="{{ route('income.index') }}" method="GET">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>Start Date</label>
                                            <input type="date" name="start_date" id="start_date" class="form-control"
                                                placeholder="Start Date" value="{{$startDate}}">
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="">End Date</label>
                                            <input type="date" name="end_date" id="end_date" class="form-control"
                                                placeholder="End Date" value="{{ $endDate }}">
                                        </div>
                                    </div>

                                    <div class="col-lg-4" style="margin-top: 32px;">
                                        <div class="form-group">
                                            <button class="btn btn-primary">Filter</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                </div>

                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Income</h4>
                            <span><b>Total Amount: </b>{{ $totalAmount }}</span>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="example" class="display" style="min-width: 845px;color:black">
                                    <thead>
                                        <tr>
                                            <th>Sl</th>
                                            <th>Business Info</th>
                                            <th>Owner Info</th>
                                            <th>Subscription Date</th>
                                            <th>Subscription Info</th>
                                            <th>Business Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($datas as $key => $value)
                                            <tr>
                                                <td>{{ ++$key }}</td>

                                                @php

                                                    // default values for avoiding undefined variable errors
                                                    $subcategory = [];
                                                    $businessType = [];
                                                    $creedTags = [];

                                                    // subcategory data
                                                    if (!empty($value->business_subcategory_id)) {
                                                        $ids = json_decode($value->business_subcategory_id);

                                                        if (is_array($ids) && count($ids) > 0) {
                                                            $subcategory = App\Models\Admin\TBusinessSubCategory::whereIn(
                                                                'id',
                                                                $ids,
                                                            )
                                                                ->pluck('name')
                                                                ->toArray();
                                                        }
                                                    }

                                                    // business type data
                                                    if (!empty($value->business_type_id)) {
                                                        $ids = json_decode($value->business_type_id);

                                                        if (is_array($ids) && count($ids) > 0) {
                                                            $businessType = App\Models\Admin\TBusinessType::whereIn(
                                                                'id',
                                                                $ids,
                                                            )
                                                                ->pluck('name')
                                                                ->toArray();
                                                        }
                                                    }

                                                    // creed tags data
                                                    if (!empty($value->creed_tags_id)) {
                                                        $ids = json_decode($value->creed_tags_id);

                                                        if (is_array($ids) && count($ids) > 0) {
                                                            $creedTags = App\Models\Admin\TCreedTags::whereIn(
                                                                'id',
                                                                $ids,
                                                            )
                                                                ->pluck('name')
                                                                ->toArray();
                                                        }
                                                    }

                                                @endphp

                                                <td>
                                                    <b>Name: </b>{{ $value->business_name }} <br>
                                                    <b>Email: </b>{{ $value->business_email }} <br>
                                                    <b>Phone No: </b>{{ $value->business_phone_number }} <br>
                                                    <b>Address: </b>{{ $value->address }} <br>
                                                    <b>Type: </b>{{ implode(', ', $businessType) }} <br>
                                                    <b>Category: </b>{{ $value?->businessCategory?->name ?? '' }} <br>
                                                    <b>Subcategory: </b>{{ implode(', ', $subcategory) }} <br>
                                                    <b>Creed Tags: </b>{{ implode(', ', $creedTags) }} <br>
                                                </td>

                                                <td>
                                                    <b> Name:</b> {{ $value?->businessOwnerInfos()?->first()->first_name }}
                                                    {{ $value?->businessOwnerInfos()?->first()->last_name ?? '' }} <br>
                                                    <b> Email:</b>
                                                    {{ $value?->businessOwnerInfos()?->first()->email ?? '' }}
                                                    <br>
                                                    <b> Phone No:</b>
                                                    {{ $value?->businessOwnerInfos()?->first()->phone_number ?? '' }} <br>
                                                    <b> Address:</b>
                                                    {{ $value?->businessOwnerInfos()?->first()->address ?? '' }} <br>
                                                </td>

                                                <td>
                                                    @php
                                                        $subscriptionStartDate =
                                                            $value?->paymentInfo?->subscription_start_date;

                                                        $subscriptionExpiredDate =
                                                            $value?->paymentInfo?->subscription_expired_date;

                                                        $today = Carbon\Carbon::now();
                                                    @endphp

                                                    @if ($subscriptionStartDate && $subscriptionExpiredDate)
                                                        {{ date('d F Y', strtotime($subscriptionStartDate)) }} -
                                                        {{ date('d F Y', strtotime($subscriptionExpiredDate)) }}
                                                    @else
                                                        <span class="text-muted">No Subscription</span>
                                                    @endif
                                                </td>

                                                <td>
                                                    @if (!empty($value->paymentInfo))
                                                        <b>Payment Method: </b>
                                                        {{ ucfirst($value->paymentInfo->payment_method_types) }} <br>
                                                        <b>Currency: </b> {{ ucfirst($value->paymentInfo->currency) }} <br>
                                                        <b>Paid Amount: </b> {{ $value->paymentInfo->paid_amount }} <br>
                                                    @else
                                                        <span class="text-muted">No Subscription</span>
                                                    @endif
                                                </td>


                                                {{-- <td>
                                                        @can('contact-creed-delete-btn')
                                                            <form action="{{ route('contact-creed.destroy', $value->id) }}"
                                                                method="POST" style="display: inline-block;">
                                                                @csrf
                                                                @method('DELETE')
                                                                <button type="submit" class="btn btn-danger btn-sm"
                                                                    onclick="return confirm('Are you sure you want to delete this?')">
                                                                    <i class="fa fa-trash"></i> Delete
                                                                </button>
                                                            </form>
                                                        @endcan
                                                    </td> --}}

                                                <td class="text-center align-middle">
                                                    @if ($value->onboard_status == 1)
                                                        @if ($subscriptionExpiredDate < $today)
                                                            <span
                                                                class="bg-danger rounded text-white px-3 py-2 inline-block">Expired</span>
                                                        @else
                                                            <span
                                                                class="bg-success rounded text-white px-3 py-2 inline-block">Active</span>
                                                        @endif
                                                    @else
                                                        @if ($subscriptionExpiredDate < $today)
                                                            <span
                                                                class="bg-danger rounded text-white px-3 py-2 inline-block">Expired</span>
                                                        @else
                                                            <span
                                                                class="bg-danger rounded text-white px-3 py-2 inline-block">Inactive</span>
                                                        @endif
                                                    @endif

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
