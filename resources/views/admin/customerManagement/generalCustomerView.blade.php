@extends('layouts.app')
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
                                        alt="Profile Picture" style="width: 120px; height: 120px; border-radius: 50%; cursor: pointer;"
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
                                                    <input type="file" name="avatar" id="imageInput"  class="custom-file-input" accept="image/*">
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
                                    <!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#userModal">
                                        Edit Profile
                                    </button> -->
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
                                <div class="card-header d-flex justify-content-between">
                                    <h3 class="text-center m-auto">
                                        Business Details - {{ $sl + 1 }}
                                    </h3>
                                    <button class="btn btn-primary" type="button" data-toggle="collapse"
                                        data-target="#businessInfo{{ $sl }}" aria-expanded="false"
                                        aria-controls="businessInfo{{ $sl }}">
                                        @if($businessList->status < 7) Incomplete @else Published @endif
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

                                    <div class="card-body">
                                        <h3>Owner Info</h3>
                                        @if (!empty($businessOwnerInfo))
                                            <div class="table-responsive">
                                                <table class="table" style="min-width: 845px;color:black">
                                                    <tbody>
                                                        <tr>
                                                            <td>First Name</td>
                                                            <td>:
                                                                {{ $businessOwnerInfo->first_name ?? '' }}
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Last Name</td>
                                                            <td>:
                                                                {{ $businessOwnerInfo->last_name ?? '' }}
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Email</td>
                                                            <td>: {{ $businessOwnerInfo->email ?? '' }}</td>
                                                        </tr>

                                                        <tr>
                                                            <td>Country Code</td>
                                                            <td>: {{ $businessOwnerInfo->country_code ?? '' }}</td>
                                                        </tr>

                                                        <tr>
                                                            <td>Phone Number</td>
                                                            <td>: {{ $businessOwnerInfo->phone_number ?? '' }}</td>
                                                        </tr>

                                                        <tr>
                                                            <td>Address</td>
                                                            <td>: {{ $businessOwnerInfo->address ?? '' }}</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        @endif
                                    </div>
                                    {{-- end owner info --}}

                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <h3>Business Info</h3>
                                            <table class="table" style="min-width: 845px;color:black">
                                                <tbody>
                                                    <tr>
                                                        <td>Business Name</td>
                                                        <td>: {{ $businessList->business_name ?? '' }}
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Business Types</td>
                                                        <td>:
                                                            @foreach ($businessList->getBusinessTypeNameAttribute() as $type)
                                                                <span class="badge badge-primary">{{ $type }}</span>
                                                            @endforeach
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Business Email</td>
                                                        <td>: {{ $businessList->business_email ?? '' }}
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Business Category</td>
                                                        <td>: <span class="badge badge-primary">{{ $businessList->businessCategory?->name ?? '' }}</span>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Business Subcategory</td>
                                                        <td>: <span class="badge badge-primary">{{ $businessList?->businessSubCategory?->name ?? '' }}</span>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Creed Tags</td>
                                                        <td>:
                                                            @foreach ($businessList?->getCreedTagsNameAttribute() as $creedTag)
                                                                <span class="badge badge-primary">{{ $creedTag }}</span>
                                                            @endforeach
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Address</td>
                                                        <td>: {{ $businessList?->address ?? '' }}</td>
                                                    </tr>

                                                    <tr>
                                                        <td>Country Short Code</td>
                                                        <td>: {{ $businessList?->country_short_code ?? '' }}
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Business Phone</td>
                                                        <td>: {{ $businessList?->business_phone_number ?? '' }}
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Business Website</td>
                                                        <td>: {{ $businessList?->business_website ?? '' }}
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Country Code</td>
                                                        <td>: {{ $businessList?->country_code ?? '' }}
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Country</td>
                                                        <td>: {{ $businessList?->countryname->name ?? '' }}</td>
                                                    </tr>

                                                    <tr>
                                                        <td>State</td>
                                                        <td>: {{ $businessList?->stateName->name ?? '' }}</td>
                                                    </tr>

                                                    <tr>
                                                        <td>City</td>
                                                        <td>: {{ $businessList?->cityName->name ?? '' }}</td>
                                                    </tr>

                                                    <tr>
                                                        <td>Zip Code</td>
                                                        <td>: {{ $businessList?->zip_code ?? '' }}</td>
                                                    </tr>

                                                    <tr>
                                                        <td>Latitude</td>
                                                        <td>: {{ $businessList?->lat ?? '' }}</td>
                                                    </tr>

                                                    <tr>
                                                        <td>Longitude</td>
                                                        <td>: {{ $businessList?->long ?? '' }}</td>
                                                    </tr>

                                                    <tr>
                                                        <td>Service Area</td>
                                                        <td>: @if($businessList?->service_area!='null'){{ is_array(json_decode($businessList?->service_area, true)) 
                                                            ? implode(', ', json_decode($businessList->service_area, true)) 
                                                            : $businessList?->service_area }}
                                                            @endif
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Description</td>
                                                        <td>: {{ $businessList?->description ?? '' }}
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Hotline Country Code</td>
                                                        <td>: {{ $businessList?->hotline_country_code ?? '' }}
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Customer Hotline</td>
                                                        <td>: {{ $businessList?->customer_hotline ?? '' }}
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Customer Email Leads</td>
                                                        <td>: {{ $businessList?->customer_email_leads ?? '' }}
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
                                                                <span class="badge badge-secondary">{{ $affliation }}</span>
                                                            @endforeach
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Discount Code</td>
                                                        <td>: {{ $businessList?->discount_code ?? '' }}
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Discount Code Description</td>
                                                        <td>: {{ $businessList?->discount_code_description ?? '' }}
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

                                                    <tr>
                                                        <td>Business Gallery Image</td>
                                                        <td>:
                                                            @foreach ($businessList?->galleryData as $gallery)
                                                                <img width="100" height="100"
                                                                    src="{{ asset('/' . $gallery->business_gallery_image ?? '') }}"
                                                                    alt="">
                                                            @endforeach
                                                        </td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    {{-- business open-close operation info --}}
                                    <div class="card-body">
                                        <h3>Operation Time Info</h3>

                                        @if (!empty($businessList?->operationData))
                                            <table class="table" style="min-width: 845px;color:black">
                                                <tr>
                                                    <td>Day</td>
                                                    <td>Operation Time</td>
                                                </tr>
                                                @foreach ($businessList?->operationData as $operationTime)
                                                    <tr>
                                                        <td>{{ $operationTime->day }}</td>
                                                        <td>: {{ $operationTime->open_time }} - {{ $operationTime->closed_time }}
                                                        </td>
                                                    </tr>
                                                @endforeach
                                            </table>
                                        @endif
                                    </div>

                                    {{-- business payment info --}}
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
                                                    <td>: {{ $businessList?->paymentInfo?->payment_method_types ?? '' }}
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>Billing Address</td>
                                                    <td> 
                                                        @if(isset($businessList?->paymentInfo?->billing_address))
                                                            @php
                                                                $billing = json_decode($businessList->paymentInfo->billing_address, true);
                                                            @endphp
                                                            <!-- <strong>Address:</strong> <br> -->
                                                            City: {{ $billing['address']['city'] ?? '' }} <br>
                                                            Country: {{ $billing['address']['country'] ?? '' }} <br>
                                                            Line 1: {{ $billing['address']['line1'] ?? '' }} <br>
                                                            Line 2: {{ $billing['address']['line2'] ?? '' }} <br>
                                                            Postal Code: {{ $billing['address']['postal_code'] ?? '' }} <br>
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
                                                    <td>: {{ date('d-m-Y h:i A', strtotime($businessList?->paymentInfo?->created_at ?? '')) }}
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
                        <input type="hidden" name="id" class="form-control" value="{{$user->id}}" required>
                        <div class="mb-3">
                            <label>First Name</label>
                            <input type="text" name="first_name" class="form-control" value="{{$user->first_name}}" required>
                        </div>
                        <div class="mb-3">
                            <label>Last Name</label>
                            <input type="text" name="last_name" class="form-control" value="{{$user->last_name}}" required>
                        </div>
                        <div class="mb-3">
                            <label>Email</label>
                            <input type="email" name="email" class="form-control" value="{{$user->email}}" required disabled>
                        </div>
                        <div class="mb-3">
                            <label>Phone Number</label>
                            <input type="text" name="phone_number" class="form-control" value="{{$user->phone_number}}" required>
                        </div>
                        <div class="mb-3">
                            <label>Country Code</label>
                            <input type="text" name="country_code" class="form-control" value="{{$user->country_code}}" required>
                        </div>
                        <div class="mb-3">
                            <label>Address</label>
                            <textarea name="address" class="form-control" value="{{$user->address}}" required>{{$user->address}}</textarea>
                        </div>
                        <button type="submit" class="btn btn-success">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
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
@endpush
