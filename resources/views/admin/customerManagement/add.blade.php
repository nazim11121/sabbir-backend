@extends('layouts.app')
@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12 col-xxl-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Acoount Info</h4>
                        </div>
                        <form class="text-black" method="POST" action="{{route('customers.store')}}">
                            @csrf
                            <!-- Login Info -->
                            <div class="card-body">
                                <div class="basic-form">
                                    
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Email<span class="requiredStar">*</span></label>
                                            <div class="col-sm-10">
                                                <input type="email" name="login_email" id="email" value="{{old('email')}}" class="form-control" placeholder="" required>
                                                @error('email')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Password<span class="requiredStar">*</span></label>
                                            <div class="col-sm-10">
                                                <input type="password" name="login_password" id="password" value="{{old('password')}}" class="form-control" placeholder="" required>
                                                @error('password')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                </div>
                            </div>
                            <!-- Owner Info -->
                            <div class="row">
                                <h4 class="text-center">Owner Info</h4>
                            </div>
                            <div class="card-body">
                                <div class="basic-form">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">First Name<span class="requiredStar">*</span></label>
                                        <div class="col-sm-4">
                                            <input type="text" name="first_name" id="first_name" value="{{old('first_name')}}" class="form-control" placeholder="" required>
                                            @error('first_name')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <label class="col-sm-2 col-form-label">Last Name<span class="requiredStar">*</span></label>
                                        <div class="col-sm-4">
                                            <input type="text" name="last_name" id="last_name" value="{{old('last_name')}}" class="form-control" placeholder="" required>
                                            @error('password')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Email<span class="requiredStar">*</span></label>
                                        <div class="col-sm-4">
                                            <input type="email" name="email" id="email" value="{{old('email')}}" class="form-control" placeholder="" required>
                                            @error('email')
                                                    <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <label class="col-sm-2 col-form-label">Phone Number<span class="requiredStar">*</span></label>
                                        <div class="col-sm-4">
                                            <input type="text" name="phone_number" id="phone_number" value="{{old('phone_number')}}" class="form-control" placeholder="" required>
                                            @error('phone_number')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Address</label>
                                        <div class="col-sm-4">
                                            <textarea name="owner_address" id="owner_address" class="form-control"></textarea>
                                            @error('owner_address')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                </div>    
                            </div>
                            <!-- Business Info -->
                            <div class="row">
                                <h4 class="text-center">Business Info</h4>
                            </div>
                            <div class="card-body">
                                <div class="basic-form">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Business Name<span class="requiredStar">*</span></label>
                                        <div class="col-sm-4">
                                            <input type="text" name="business_name" id="business_name" value="{{old('business_name')}}" class="form-control" placeholder="" required>
                                            @error('business_name')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>

                                        <label class="col-sm-2 col-form-label">Type<span class="requiredStar">*</span></label>
                                        <div class="col-sm-4">
                                            <select name="business_type_id" id="business_type_id" class="form-control select2" required>
                                                <option value="">Select Type</option>
                                                @foreach($types as $value)
                                                    <option value="{{$value->id}}">{{$value->name}}</option>
                                                @endforeach
                                            </select>
                                            @error('business_type_id')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Category<span class="requiredStar">*</span></label>
                                        <div class="col-sm-4">
                                            <select name="business_category_id" id="business_category_id" class="form-control select2" required>
                                                <option value="">Select Category</option>
                                                @foreach($categories as $category)
                                                    <option value="{{$category->id}}">{{$category->name}}</option>
                                                @endforeach
                                            </select>
                                            @error('business_category_id')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <label class="col-sm-2 col-form-label">SubCategory<span class="requiredStar">*</span></label>
                                        <div class="col-sm-4">
                                            <select name="business_subcategory_id" id="business_subcategory_id" class="form-control select2" required>
                                                <option value="">Select SubCategory</option>
                                                @foreach($subCategories as $value)
                                                    <option value="{{$value->id}}">{{$value->name}}</option>
                                                @endforeach
                                            </select>
                                            @error('business_subcategory_id')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        {{-- Hidden Latitude & Longitude Fields --}}
                                        <input type="hidden" id="latitude" name="lat">
                                        <input type="hidden" id="longitude" name="long">
                                        <label class="col-sm-2 col-form-label">Address</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="address" id="autocomplete" class="form-control" placeholder="Type to search..." autocomplete="off">
                                            <!-- <input type="text" id="address" name="address" class="form-control" required> -->
                                            @error('address')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <label class="col-sm-2 col-form-label">Country<span class="requiredStar">*</span></label>
                                        <div class="col-sm-4">
                                            <input type="text" name="country" id="country" class="form-control" placeholder="" required>
                                            @error('country')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">State<span class="requiredStar">*</span></label>
                                        <div class="col-sm-2">
                                            <input type="text" name="state" id="state" class="form-control" placeholder="" required>
                                            @error('state')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <label class="col-sm-2 col-form-label">City<span class="requiredStar">*</span></label>
                                        <div class="col-sm-2">
                                            <input type="text" name="city" id="city" value="{{old('city')}}" class="form-control" placeholder="" required>
                                            @error('city')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <label class="col-sm-2 col-form-label">Zip Code<span class="requiredStar">*</span></label>
                                        <div class="col-sm-2">
                                            <input type="text" name="zip_code" id="zip_code" value="{{old('zip_code')}}" class="form-control" placeholder="" required>
                                            @error('zip_code')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        
                                    </div>
                                    <div class="form-group row">
                                        <div id="map-load" style="height: 200px;"></div>
                                    </div>
                                    
                                    <div class="form-group row">
                                        <div class="col-sm-12 text-center">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                            <button type="reset" class="btn btn-secondary">Reset</a>
                                        </div>
                                    </div>
                                </div>    
                            </div>
                        </form>    
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('script')
{{-- Google Maps API --}}
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBytP025ufTxrLJDhEDOmgGZ6dZCNjlR8M&callback=initMap&libraries=places" async defer></script>

<script>
    let map, marker, autocomplete;

    function initMap() {
        // Check if Geolocation is supported
        if (navigator.geolocation) {
            // Get the user's current location
            navigator.geolocation.getCurrentPosition(
                (position) => {
                    // Use the device's current location
                    const defaultLocation = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude,
                    };

                    // Initialize Google Map with the device's location
                    initializeMap(defaultLocation);
                },
                (error) => {
                    // If the user denies permission or Geolocation fails, use a fallback location
                    console.error("Error getting location:", error);
                    const fallbackLocation = { lat: 23.8103, lng: 90.4125 }; // Fallback location
                    initializeMap(fallbackLocation);
                }
            );
        } else {
            // If Geolocation is not supported, use a fallback location
            console.error("Geolocation is not supported by this browser.");
            const fallbackLocation = { lat: 23.8103, lng: 90.4125 }; // Fallback location
            initializeMap(fallbackLocation);
        }
    }

    function initializeMap(defaultLocation) {
        // Initialize Google Map
        map = new google.maps.Map(document.getElementById("map-load"), {
            center: defaultLocation,
            zoom: 15,
        });

        // Initialize marker
        marker = new google.maps.Marker({
            position: defaultLocation,
            map: map,
            draggable: true,
        });

        // Initialize Places Autocomplete
        autocomplete = new google.maps.places.Autocomplete(document.getElementById("autocomplete"));
        autocomplete.addListener("place_changed", fillAddressFields);

        // Event: When marker is dragged, update coordinates
        google.maps.event.addListener(marker, "dragend", function () {
            let position = marker.getPosition();
            $('#latitude').val(position.lat());
            $('#longitude').val(position.lng());
        });
    }

    function fillAddressFields() { 
    let place = autocomplete.getPlace();
    if (!place.geometry) return;
    
    // Move marker to new location
    map.setCenter(place.geometry.location);
    marker.setPosition(place.geometry.location);

    // Update latitude & longitude
    $('#latitude').val(place.geometry.location.lat());
    $('#longitude').val(place.geometry.location.lng());
   
    // Extract address components
    let address = "";
    let city = "";
    let state = "";
    let country = "";
    let zip_code = "";

    place.address_components.forEach((component) => {
        let type = component.types[0];

        if (type === "street_number" || type === "route") {
            address += component.long_name + " ";
        } else if (type === "locality") {
            city = component.long_name;
        } else if (type === "administrative_area_level_1") {
            state = component.long_name;
        } else if (type === "country") {
            country = component.long_name;
        } else if (type === "postal_code") {
            zip_code = component.long_name;
        }
    });

    // Check if input elements exist before setting values
    if (document.getElementById("address")) {
        document.getElementById("address").value = address.trim();
    }
    if (document.getElementById("city")) {
        document.getElementById("city").value = city;
    }
    if (document.getElementById("state")) {
        document.getElementById("state").value = state;
    }
    if (document.getElementById("country")) {
        document.getElementById("country").value = country;
        }
        if (document.getElementById("zip_code")) {
            document.getElementById("zip_code").value = zip_code;
        }
    }

</script>
@endpush