@extends('layouts.app')
@push('style')
    <!-- Include Select2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

    <style>
        /* Hide the selected values in the input box */
        .select2-selection__rendered {
            display: none;
        }

        /* Style the dropdown options */
        .select2-container--default .select2-results__option[aria-selected=true] {
            background-color: #f8f9fa;
        }

        .select2-container--default .select2-results__option--highlighted[aria-selected] {
            background-color: #007bff;
            color: white;
        }

        /* Style the checkboxes */
        .select2-checkbox {
            margin-right: 8px;
        }


        /* toggle switch for active / inactive */
        /* ============================
                           Medium-Sized Custom Switch
                           ============================ */

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

        /* ============================

                            /* ============================
                           Switch Colors
                           ============================ */

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

    <style>
       .tooltip-wrapper {
            position: relative;
            display: inline-block;
            cursor: not-allowed;
        }

        .tooltip-wrapper .tooltip-text {
            visibility: hidden;
            width: 180px;
            background-color: #333;
            color: #fff;
            text-align: center;
            border-radius: 6px;
            padding: 8px;
            position: absolute;
            z-index: 100;
            bottom: 125%;
            /* Position above */
            left: 50%;
            transform: translateX(-50%);
            opacity: 0;
            transition: opacity 0.3s;
            font-size: 13px;
        }

        .tooltip-wrapper .tooltip-text::after {
            content: "";
            position: absolute;
            top: 100%;
            /* Arrow pointing down */
            left: 50%;
            margin-left: -5px;
            border-width: 5px;
            border-style: solid;
            border-color: #333 transparent transparent transparent;
        }

        .tooltip-wrapper:hover .tooltip-text {
            visibility: visible;
            opacity: 1;
        }
    </style>
@endpush
@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header text-center">
                            <h4 class="profile-image text-center m-auto">Customer Profile</h4>
                        </div>

                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4 text-center">
                                    <img class="profile-pic img-fluid rounded-circle"
                                        src="{{ $user->avatar ? asset('/' . $user->avatar) : asset('/images/business/profile/default.jpg') }}"
                                        alt="Profile Picture"
                                        style="width: 120px; height: 120px; border-radius: 50%; cursor: pointer;"
                                        onclick="document.getElementById('profile-picture-input').click();">
                                    <div class="mt-4">
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                            data-target="#exampleModal">
                                            Upload Image
                                        </button>
                                    </div>
                                </div>


                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                                    aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Upload Image</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="custom-file">
                                                    <input type="file" name="avatar" id="imageInput"
                                                        class="custom-file-input" accept="image/*">
                                                    <label class="custom-file-label">Choose file</label>
                                                </div>

                                                <input type="hidden" name="id" value="{{ $user->id }}"
                                                    class="user">

                                                <!-- Preview -->
                                                <div class="my-2">
                                                    <img src="" id="imagePreview" height="100" width="100"
                                                        style="object-fit: cover; border: 1px solid #ccc; display: none;">
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">Close</button>
                                                <button type="button" class="btn btn-primary uploadBtn">Upload</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-8">
                                    <h5>Name: {{ $user->name }}</h5>
                                    <p class="text-dark">Email: {{ $user->email }}</p>
                                    <p class="text-dark">Phone: {{ $user->phone_number }}</p>
                                    <p class="text-dark">Address: {{ $user->address }}</p>
                                    <p class="text-dark">Account Type:
                                        @if ($user->account_type == 'G')
                                            <span class="text-success">General</span>
                                        @elseif ($user->account_type == 'GB')
                                            <span class="text-success">Business</span>
                                        @endif
                                    </p>

                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                        data-bs-target="#userModal">
                                        Edit Profile
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                {{-- saved business lists --}}
                <div class="col-lg-12 col-sm-12 col-md-12 col-xl-12 my-2">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between">
                            <h3 class="text-center m-auto">
                                Saved Business List
                            </h3>
                            <button class="btn btn-primary" type="button" data-toggle="collapse"
                                data-target="#savedBusinessList" aria-expanded="false" aria-controls="savedBusinessList">
                                <i class="fa-solid fa-chevron-down"></i>
                            </button>
                        </div>
                        <div class="collapse" id="savedBusinessList">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table" style="min-width: 845px;color:black">
                                        <tbody>
                                            @foreach ($savedBusinessLists as $sl => $savedBusinessList)
                                                <tr>
                                                    <td>{{ $sl + 1 }}.</td>
                                                    <td>{{ $savedBusinessList?->business?->business_name ?? '' }}</td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                {{-- end saved business lists --}}

                {{-- business type user --}}
                @if ($user->account_type == 'GB')
                    {{-- business info --}}
                    @foreach ($businessLists as $sl => $businessList)
                        <div class="col-lg-12 col-sm-12 col-md-12 col-xl-12 my-2">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <form action="{{ route('business.account.delete', $businessList->id) }}"
                                        method="POST" style="display: inline-block;">
                                        @csrf

                                        @method('DELETE')

                                        <button type="submit" class="btn btn-danger btn-sm mx-2"
                                            onclick="return confirm('Are you sure you want to delete this?')">
                                            <i class="fa fa-trash"></i> Delete
                                        </button>
                                    </form>


                                    <h3 class="text-center m-auto">
                                        Business Details - {{ $sl + 1 }}
                                    </h3>

                                    {{-- active/inactive business --}}
                                    @php
                                        $payment = App\Models\Api\TPayment::where(
                                            'business_id',
                                            $businessList->id,
                                        )->first();

                                        $expired = 0;

                                        if (!empty($payment)) {
                                            if ($payment->subscription_expired_date < now()) {
                                                $expired = 1;
                                            }
                                        }
                                    @endphp

                                    <div class="custom-control custom-switch custom-switch-md" style="margin: 0px 30px;">

                                        {{-- <input type="checkbox" class="custom-control-input"
                                            id="customSwitch{{ $businessList->id }}" data-id="{{ $businessList->id }}"
                                            {{ $businessList->onboard_status == 1 ? 'checked' : '' }}
                                            data-expired={{ $expired }} >
                                        <label class="custom-control-label"
                                            for="customSwitch{{ $businessList->id }}"></label> --}}

                                        <div class="{{$expired == 1 ? 'tooltip-wrapper':''}}">
                                            <span class="{{$expired == 1 ? 'tooltip-text': ''}}">
                                                {{ $expired == 1 ? 'Subscription Already Expired. Please renew your subscription.' : '' }}
                                            </span>

                                            <!-- Your checkbox and label -->
                                            <input type="checkbox" class="custom-control-input"
                                                id="customSwitch{{ $businessList->id }}"
                                                data-id="{{ $businessList->id }}"
                                                {{ $businessList->onboard_status == 1 ? 'checked' : '' }}
                                            data-expired={{ $expired }} {{$expired == 1 ? 'disabled': ''}}>
                                            <label class="custom-control-label"
                                                for="customSwitch{{ $businessList->id }}"></label>
                                        </div>
                                    </div>



                                    {{-- @if ($businessList->deleted_at == null)
                                        <a href="{{route('business.account.deactive', $businessList->id)}}" class="btn btn-success btn-sm mr-2">Active</a>
                                    @else
                                        <a href="{{route('business.account.active', $businessList->id)}}" class="btn btn-danger btn-sm mr-2">Deactive</a>
                                    @endif --}}



                                    <button class="btn btn-primary" type="button" data-toggle="collapse"
                                        data-target="#businessInfo{{ $sl }}" aria-expanded="false"
                                        aria-controls="businessInfo{{ $sl }}">
                                        <i class="fa-solid fa-chevron-down"></i>
                                    </button>
                                </div>
                                <div class="collapse" id="businessInfo{{ $sl }}">
                                    {{-- owner info --}}
                                    @php
                                        $businessOwnerInfo = $businessList?->businessOwnerInfos?->first();
                                        $firstName = $businessOwnerInfo->first_name ?? '';
                                        $lastName = $businessOwnerInfo->last_name ?? '';
                                        $businessOwnerFullName = $firstName . ' ' . $lastName;
                                    @endphp

                                    @if (!empty($businessOwnerInfo))
                                        <form id="userForm"
                                            action="{{ route('customers-owner-details.update', $businessOwnerInfo->id) }}"
                                            method="POST">
                                            @csrf
                                            @method('PATCH')
                                            <div class="card-body">
                                                <h3>Owner Info</h3>
                                                @if (!empty($businessOwnerInfo))
                                                    <div class="table-responsive">
                                                        <table class="table" style="min-width: 845px;color:black">
                                                            <tbody>
                                                                <tr>
                                                                    <td>First Name</td>
                                                                    <td class="d-flex">
                                                                        <span class="mt-2 mr-2">:</span>
                                                                        <input type="text" class="form-control"
                                                                            name="first_name"
                                                                            value="{{ $businessOwnerInfo->first_name ?? '' }}">
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Last Name</td>
                                                                    <td class="d-flex">
                                                                        <span class="mt-2 mr-2">:</span>
                                                                        <input type="text" class="form-control"
                                                                            name="last_name"
                                                                            value="{{ $businessOwnerInfo->last_name ?? '' }}">
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Email</td>
                                                                    <td class="d-flex">
                                                                        <span class="mt-2 mr-2">:</span>
                                                                        <input type="text" class="form-control"
                                                                            name="email"
                                                                            value="{{ $businessOwnerInfo->email ?? '' }}">
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Country Code</td>
                                                                    <td class="d-flex">
                                                                        <span class="mt-2 mr-2">:</span>
                                                                        <input type="text" class="form-control"
                                                                            name="country_code"
                                                                            value="{{ $businessOwnerInfo->country_code ?? '' }}">
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Phone Number</td>
                                                                    <td class="d-flex">
                                                                        <span class="mt-2 mr-2">:</span>
                                                                        <input type="text" class="form-control"
                                                                            name="phone_number"
                                                                            value="{{ $businessOwnerInfo->phone_number ?? '' }}">
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Address</td>
                                                                    <td class="d-flex">
                                                                        <span class="mt-2 mr-2">:</span>
                                                                        <input type="text" class="form-control"
                                                                            name="address"
                                                                            value="{{ $businessOwnerInfo->address ?? '' }}">
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <div class="col-sm-12 text-center">
                                                            <button type="submit" class="btn btn-success">Update</button>
                                                        </div>
                                                    </div>
                                                @endif
                                            </div>
                                        </form>
                                    @endif

                                    {{-- end owner info --}}
                                    <form id="userForm"
                                        action="{{ route('customers-business-details.update', $businessList->id) }}"
                                        method="POST">
                                        @csrf
                                        @method('PATCH')
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <h3>Business Info</h3>
                                                <table class="table" style="min-width: 845px;color:black">
                                                    <tbody>
                                                        <input type="hidden" class="form-control" name="id"
                                                            value="{{ $businessList->id ?? '' }}">
                                                        <tr>
                                                            <td>Business Name</td>
                                                            <td class="d-flex">
                                                                <span class="mt-2 mr-2">:</span>
                                                                <input type="text" class="form-control"
                                                                    name="business_name"
                                                                    value="{{ $businessList->business_name ?? '' }}">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Business Types</td>
                                                            <td>:
                                                                @foreach ($businessList->getBusinessTypeNameAttribute() as $type)
                                                                    <span class="badge badge-primary">{{ $type }}
                                                                    </span>
                                                                @endforeach
                                                            </td>
                                                            <!-- <td class="d-flex">
                                                                                                        <span class="mt-2 mr-2">:</span>
                                                                                                        <select class="form-control select2" name="business_type" multiple>
                                                                                                            @foreach ($businessList->getBusinessTypeNameAttribute() as $type)
    <option value="{{ $type }}">{{ $type }}</option>
    @endforeach
                                                                                                        </select>
                                                                                                    </td> -->
                                                        </tr>

                                                        <tr>
                                                            <td>Business Email</td>
                                                            <td class="d-flex">
                                                                <span class="mt-2 mr-2">:</span>
                                                                <input type="text" class="form-control"
                                                                    name="business_email"
                                                                    value="{{ $businessList->business_email ?? '' }}">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Business Category</td>
                                                            <td>: <span
                                                                    class="badge badge-primary">{{ $businessList->businessCategory?->name ?? '' }}</span>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Business Subcategory</td>
                                                            <td>: <span
                                                                    class="badge badge-primary">{{ $businessList?->businessSubCategory?->name ?? '' }}</span>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Creed Tags</td>
                                                            <td>:
                                                                @foreach ($businessList?->getCreedTagsNameAttribute() as $creedTag)
                                                                    <span
                                                                        class="badge badge-primary">{{ $creedTag }}</span>
                                                                @endforeach
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Country Code</td>
                                                            <td class="d-flex">
                                                                <span class="mt-2 mr-2">:</span>
                                                                <input type="text" class="form-control"
                                                                    name="country_code"
                                                                    value="{{ $businessList->country_code ?? '' }}">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Country Short Code</td>
                                                            <td class="d-flex">
                                                                <span class="mt-2 mr-2">:</span>
                                                                <input type="text" class="form-control"
                                                                    name="country_short_code"
                                                                    value="{{ $businessList->country_short_code ?? '' }}">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Business Phone</td>
                                                            <td class="d-flex">
                                                                <span class="mt-2 mr-2">:</span>
                                                                <input type="text" class="form-control"
                                                                    name="business_phone_number"
                                                                    value="{{ $businessList->business_phone_number ?? '' }}">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Business Website</td>
                                                            <td class="d-flex">
                                                                <span class="mt-2 mr-2">:</span>
                                                                <input type="text" class="form-control"
                                                                    name="business_website"
                                                                    value="{{ $businessList->business_website ?? '' }}">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Address</td>
                                                            <td class="d-flex">
                                                                <span class="mt-2 mr-2">:</span>
                                                                <input type="text" class="form-control" name="address"
                                                                    value="{{ $businessList->address ?? '' }}">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Country</td>
                                                            <td>: {{ $businessList?->countryName->name ?? '' }}</td>
                                                        </tr>

                                                        <tr>
                                                            <td>State</td>
                                                            <td>: {{ $businessList?->statename->name ?? '' }}</td>
                                                        </tr>

                                                        <tr>
                                                            <td>City</td>
                                                            <td>: {{ $businessList?->cityName->name ?? '' }}</td>
                                                        </tr>

                                                        <tr>
                                                            <td>Zip Code</td>
                                                            <td class="d-flex">
                                                                <span class="mt-2 mr-2">:</span>
                                                                <input type="text" class="form-control"
                                                                    name="zip_code"
                                                                    value="{{ $businessList->zip_code ?? '' }}">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Latitude</td>
                                                            <td class="d-flex">
                                                                <span class="mt-2 mr-2">:</span>
                                                                <input type="text" class="form-control" name="lat"
                                                                    value="{{ $businessList->lat ?? '' }}">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Longitude</td>
                                                            <td class="d-flex">
                                                                <span class="mt-2 mr-2">:</span>
                                                                <input type="text" class="form-control" name="long"
                                                                    value="{{ $businessList->long ?? '' }}">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Service Area</td>
                                                            <td>: @if ($businessList?->service_area != 'null')
                                                                    {{ is_array(json_decode($businessList?->service_area, true))
                                                                        ? implode(', ', json_decode($businessList->service_area, true))
                                                                        : $businessList?->service_area }}
                                                                @endif
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Description</td>
                                                            <td class="d-flex">
                                                                <span class="mt-2 mr-2">:</span>
                                                                <input type="text" class="form-control"
                                                                    name="description"
                                                                    value="{{ $businessList->description ?? '' }}">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Hotline Country Code</td>
                                                            <td class="d-flex">
                                                                <span class="mt-2 mr-2">:</span>
                                                                <input type="text" class="form-control"
                                                                    name="hotline_country_code"
                                                                    value="{{ $businessList->hotline_country_code ?? '' }}">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Customer Hotline</td>
                                                            <td class="d-flex">
                                                                <span class="mt-2 mr-2">:</span>
                                                                <input type="text" class="form-control"
                                                                    name="customer_hotline"
                                                                    value="{{ $businessList->customer_hotline ?? '' }}">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Customer Email Leads</td>
                                                            <td class="d-flex">
                                                                <span class="mt-2 mr-2">:</span>
                                                                <input type="text" class="form-control"
                                                                    name="customer_email_leads"
                                                                    value="{{ $businessList->customer_email_leads ?? '' }}">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Restaurant</td>
                                                            <td>: {{ $businessList?->restaurant?->name ?? '' }}
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Affliation</td>
                                                            <td>:
                                                                @foreach ($businessList?->getAffiliationNameAttribute() as $affliation)
                                                                    <span
                                                                        class="badge badge-secondary">{{ $affliation }}</span>
                                                                @endforeach
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Discount Code</td>
                                                            <td class="d-flex">
                                                                <span class="mt-2 mr-2">:</span>
                                                                <input type="text" class="form-control"
                                                                    name="discount_code"
                                                                    value="{{ $businessList->discount_code ?? '' }}">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Discount Code Description</td>
                                                            <td class="d-flex">
                                                                <span class="mt-2 mr-2">:</span>
                                                                <input type="text" class="form-control"
                                                                    name="discount_code_description"
                                                                    value="{{ $businessList->discount_code_description ?? '' }}">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Business Profile</td>
                                                            <td>:
                                                                <img width="100" height="100"
                                                                    src="{{ asset('/' . $businessList?->business_profile_image ?? '') }}"
                                                                    alt="">
                                                            </td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                                <div class="col-sm-12 text-center">
                                                    <button type="submit" class="btn btn-success">Update</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card-body">
                                            <h3>Payment Info</h3>

                                            @if (!empty($businessList?->paymentInfo))
                                                <table class="table" style="min-width: 845px;color:black">
                                                    <tr>
                                                        <td>Invoice</td>
                                                        <td>: {{ $businessList?->paymentInfo?->invoice_id ?? '' }}
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Payment Method</td>
                                                        <td>:
                                                            {{ $businessList?->paymentInfo?->payment_method_types ?? '' }}
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Billing Address</td>
                                                        <td>
                                                            @if (isset($businessList?->paymentInfo?->billing_address))
                                                                @php
                                                                    $billing = json_decode(
                                                                        $businessList->paymentInfo->billing_address,
                                                                        true,
                                                                    );
                                                                @endphp
                                                                <!-- <strong>Address:</strong> <br> -->
                                                                City: {{ $billing['address']['city'] ?? '' }} <br>
                                                                Country: {{ $billing['address']['country'] ?? '' }} <br>
                                                                Line 1: {{ $billing['address']['line1'] ?? '' }} <br>
                                                                Line 2: {{ $billing['address']['line2'] ?? '' }} <br>
                                                                Postal Code: {{ $billing['address']['postal_code'] ?? '' }}
                                                                <br>
                                                                State: {{ $billing['address']['state'] ?? '' }} <br>
                                                                Email: {{ $billing['email'] ?? '' }} <br>
                                                                Name: {{ $billing['name'] ?? '' }} <br>
                                                                Phone: {{ $billing['phone'] ?? 'N/A' }} <br>
                                                                Tax Exempt: {{ $billing['tax_exempt'] ?? 'none' }} <br>
                                                            @endif
                                                        </td>
                                                    </tr>

                                                    <!-- <tr>
                                                                                            <td>Subscription Plan Name</td>
                                                                                            <td>:
                                                                                                {{ $businessList?->paymentInfo?->subscription_plan_name ?? '' }}
                                                                                            </td>
                                                                                        </tr> -->

                                                    <tr>
                                                        <td>Payable Amount</td>
                                                        <td>: {{ $businessList?->paymentInfo?->payable_amount ?? '' }}
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Paid Amount</td>
                                                        <td>: {{ $businessList?->paymentInfo?->paid_amount ?? '' }}
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Currency</td>
                                                        <td>: {{ $businessList?->paymentInfo?->currency ?? '' }}
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Customer ID</td>
                                                        <td>: {{ $businessList?->paymentInfo?->customer_id ?? '' }}
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Payment Date</td>
                                                        <td>:
                                                            {{ date('d-m-Y h:i A', strtotime($businessList?->paymentInfo?->created_at ?? '')) }}
                                                        </td>
                                                    </tr>

                                                    <!-- <tr>
                                                                                            <td>Receipt URL</td>
                                                                                            <td>: {{ $businessList?->paymentInfo?->receipt_url ?? '' }}
                                                                                            </td>
                                                                                        </tr> -->

                                                    <tr>
                                                        <td>Payment Status</td>
                                                        <td>:
                                                            @if ($businessList?->paymentInfo?->status == 1)
                                                                <span class="badge badge-success text-white">Payment
                                                                    Successful</span>
                                                            @elseif ($businessList?->paymentInfo?->status == 0)
                                                                <span class="badge badge-danger">Payment Failed</span>
                                                            @endif
                                                        </td>
                                                    </tr>
                                                </table>
                                            @endif
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @endif
                {{-- end business type user --}}
            </div>
        </div>
    </div>
    <!-- User Info Modal -->
    <div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="userModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="userModalLabel">Add User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="userForm" action="{{ route('profile.update', $user->id) }}" method="POST">
                        @csrf
                        @method('PATCH')
                        <input type="hidden" name="id" class="form-control" value="{{ $user->id }}" required>
                        <div class="mb-3">
                            <label>First Name</label>
                            <input type="text" name="first_name" class="form-control"
                                value="{{ $user->first_name }}" required>
                        </div>
                        <div class="mb-3">
                            <label>Last Name</label>
                            <input type="text" name="last_name" class="form-control" value="{{ $user->last_name }}"
                                required>
                        </div>
                        <div class="mb-3">
                            <label>Email</label>
                            <input type="email" name="email" class="form-control" value="{{ $user->email }}"
                                required disabled>
                        </div>
                        <div class="mb-3">
                            <label>Phone Number</label>
                            <input type="text" name="phone_number" class="form-control"
                                value="{{ $user->phone_number }}" required>
                        </div>
                        <div class="mb-3">
                            <label>Country Code</label>
                            <input type="text" name="country_code" class="form-control"
                                value="{{ $user->country_code }}" required>
                        </div>
                        <div class="mb-3">
                            <label>Address</label>
                            <textarea name="address" class="form-control" value="{{ $user->address }}" required>{{ $user->address }}</textarea>
                        </div>
                        <button type="submit" class="btn btn-success">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Include Select2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script>
        $(document).ready(function() {
            // Initialize Select2
            $('.select2').select2({
                templateResult: formatOptions, // Customize how options are displayed in the dropdown
                templateSelection: formatSelection, // Hide selected values in the input box
                closeOnSelect: false // Prevent the dropdown from closing after selection
            });

            // Customize the dropdown options to include checkboxes
            function formatOptions(option) {
                if (!option.id) {
                    return option.text;
                }
                var $option = $(
                    '<div><input type="checkbox" class="select2-checkbox" ' + (option.element.selected ?
                        'checked' : '') + '> ' + option.text + '</div>'
                );
                return $option;
            }

            // Hide selected values in the input box
            function formatSelection() {
                return ''; // Return an empty string to hide selected values
            }

            // Handle checkbox click
            $(document).on('click', '.select2-checkbox', function(e) {
                e.stopPropagation();
                var $option = $(this).closest('.select2-results__option');
                var $select = $('.select2');
                var selectedValues = $select.val() || [];

                if (this.checked) {
                    selectedValues.push($option.data('data').id);
                } else {
                    selectedValues = selectedValues.filter(function(val) {
                        return val !== $option.data('data').id;
                    });
                }

                $select.val(selectedValues).trigger('change');
            });
        });
    </script>
    <script>
        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function() {
                // Update the profile picture with the selected image
                document.getElementById('profile-pic').src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }

        // handle image preview new code
        document.getElementById('imageInput').addEventListener('change', function(event) {
            const imagePreview = document.getElementById('imagePreview');
            const file = event.target.files[0];

            if (file) {
                imagePreview.src = URL.createObjectURL(file);
                imagePreview.style.display = 'block';
            } else {
                imagePreview.src = '';
                imagePreview.style.display = 'none';
            }
        });

        //    image upload process
        $('.uploadBtn').on('click', function() {
            let userId = $('.user').val();

            const formData = new FormData();
            const fileInput = $('#imageInput')[0].files[0];

            if (fileInput) {
                formData.append('avatar', fileInput);
                formData.append('id', userId);

                $.ajaxSetup({
                    headers: {
                        "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content")
                    }
                });

                $.ajax({
                    url: '{{ route('customers-profile.image') }}',
                    type: 'POST',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function(response) {
                        $('#exampleModal').modal('hide');
                        toastr.success('Image uploaded successfully');
                        setTimeout(() => {
                            location.reload();
                        }, 1000);
                    },
                    error: function(xhr, status, error) {
                        toastr.error(xhr.responseJSON.message);
                    }
                });
            } else {
                toastr.error('Please select an image to upload.');
            }
        });
    </script>

    {{-- handdling toggle switch for active/deactive business --}}
    <script>
        $(document).ready(function() {
            $('.custom-control-input').on('change', function() {
                let expired = $(this).data('expired');

                if (expired == 1) {
                    Swal.fire({
                        icon: "error",
                        title: "Expired",
                        text: "Subscription Already Expired. Please renew your subscription.",
                        footer: ''
                    });

                    $(this).prop('checked', false);
                } else {
                    let business_id = $(this).data('id');
                    let is_active = $(this).is(':checked') ? 1 : 0;

                    $.ajax({
                        url: '{{ route('business.account.active-deactive') }}',
                        method: 'POST',
                        data: {
                            _token: $('meta[name="csrf-token"]').attr('content'),
                            business_id: business_id,
                            is_active: is_active,
                        },
                        success: function(response) {
                            location.reload();
                        },
                        error: function(xhr) {
                            console.error(xhr.responseText);
                        }
                    });
                }

            });
        });
    </script>
@endpush
