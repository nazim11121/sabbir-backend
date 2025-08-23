@extends('layouts.app')
@section('content')
        <div class="content-body">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Apps Terms and Conditions</h4>
                            </div>
                            <div class="card-body">
                                <form action="#" method="post" action="{{route('app-terms-and-conditions.store')}}" id="step-form-horizontal" class="step-form-horizontal" enctype="multipart/form-data">
                                    @csrf
                                    <div>
                                        <section>
                                            <div class="row">
                                                <div class="col-lg-12 mb-4">
                                                    <div class="form-group">
                                                        <label class="text-label">Let's Go Page</label>
                                                        <input type="text" name="page_1_heading" class="form-control" value="{{$datas->page_1_heading ?? ''}}" placeholder="">
                                                        @error('page_1_heading')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 mb-4" style="display:none">
                                                    <div class="form-group">
                                                        <label class="text-label">Page 2 Title</label>
                                                        <input type="text" name="page_2_title" class="form-control" value="{{$datas->page_2_title ?? ''}}" placeholder="">
                                                        @error('page_2_title')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 mb-4" style="display:none">
                                                    <div class="form-group">
                                                        <label class="text-label">Page 2 Heading</label>
                                                        <input type="text" name="page_2_heading" class="form-control" value="{{$datas->page_2_heading ?? ''}}" placeholder="">
                                                        @error('page_2_heading')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 mb-4" style="display:none">
                                                    <div class="form-group">
                                                        <label class="text-label">Page 2 Description</label>
                                                        <input type="text" name="page_2_description" class="form-control" value="{{$datas->page_2_description ?? ''}}" placeholder="">
                                                        @error('page_2_description')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div> 
                                        </section>
                                        <div class="form-group row">
                                            <div class="col-sm-10 text-center">
                                                <button type="submit" class="btn btn-primary">{{$datas?'Update':'Submit'}}</button>
                                                <a href="{{url()->previous()}}" class="btn btn-secondary">Cancel</a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Mobile number validation -->
<script>
$(document).ready(function() {
    $("#phone_number").on("input", function() {
        var mobileNumber = $(this).val();

        if (this.validity.valid) {
            $("#mobileValidation").text("");
            $("#submit").attr('disabled',false);
        } else {
            $("#mobileValidation").text("Invalid mobile number.");
            $("#submit").attr('disabled',true);
        }
    });
});
</script>
<script>
    $(document).ready(function () {
        // Get stored values
        const selectedCountry = "{{ $tCompanyInfo->country ??''}}";
        const selectedState = "{{ $tCompanyInfo->state ??''}}";
        const selectedCity = "{{ $tCompanyInfo->city ??''}}";

        // Load states based on the selected country
        if (selectedCountry) { 
            $.ajax({
                url: `/states/${selectedCountry}`,
                type: 'GET',
                success: function (states) {
                    let stateOptions = '<option value="">Select State</option>';
                    $.each(states, function (key, state) {
                        stateOptions += `<option value="${state.id}" ${state.id == selectedState ? 'selected' : ''}>${state.name}</option>`;
                    });
                    $('#state').html(stateOptions);

                    // Load cities based on the selected state
                    if (selectedState) {
                        $.ajax({
                            url: `/cities/${selectedState}`,
                            type: 'GET',
                            success: function (cities) {
                                let cityOptions = '<option value="">Select City</option>';
                                $.each(cities, function (key, city) {
                                    cityOptions += `<option value="${city.id}" ${city.id == selectedCity ? 'selected' : ''}>${city.name}</option>`;
                                });
                                $('#city').html(cityOptions);
                            }
                        });
                    }
                }
            });
        }

        // Update states when country is changed
        $('#country').change(function () { 
            const countryId = $(this).val();
            $('#state').html('<option value="">Select State</option>');
            $('#city').html('<option value="">Select City</option>');
            
            if (countryId) {
                $.ajax({
                    url: `/states/${countryId}`,
                    type: 'GET',
                    success: function (states) {
                        let stateOptions = '<option value="">Select State</option>';
                        $.each(states, function (key, state) {
                            stateOptions += `<option value="${state.id}">${state.name}</option>`;
                        });
                        $('#state').html(stateOptions);
                    }
                });
            } else {
                $('#state').html('<option value="">Select State</option>');
            }
        });

        // Update cities when state is changed
        $('#state').change(function () {
            const stateId = $(this).val();
            $('#city').html('<option value="">Loading...</option>');

            if (stateId) {
                $.ajax({
                    url: `/cities/${stateId}`,
                    type: 'GET',
                    success: function (cities) {
                        let cityOptions = '<option value="">Select City</option>';
                        $.each(cities, function (key, city) {
                            cityOptions += `<option value="${city.id}">${city.name}</option>`;
                        });
                        $('#city').html(cityOptions);
                    }
                });
            } else {
                $('#city').html('<option value="">Select City</option>');
            }
        });
    });
</script>
@endsection