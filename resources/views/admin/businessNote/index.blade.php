@extends('layouts.app')
@section('content')
        <div class="content-body">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Business Note</h4>
                            </div>
                            <div class="card-body">
                                <form action="#" method="post" action="{{route('business-note.store')}}" id="step-form-horizontal" class="step-form-horizontal" enctype="multipart/form-data">
                                    @csrf
                                    <div>
                                        <section>
                                            <div class="row">
                                                <div class="col-lg-12 mb-4">
                                                    <div class="form-group">
                                                        <label class="text-label">Owner Info Page</label>
                                                        <input type="text" name="owner_info_page" class="form-control" value="{{$datas->owner_info_page ?? ''}}" placeholder="">
                                                        @error('owner_info_page')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 mb-4">
                                                    <div class="form-group">
                                                        <label class="text-label">Business Info Step 1</label>
                                                        <input type="text" name="business_info_step_1" class="form-control" value="{{$datas->business_info_step_1 ?? ''}}" placeholder="">
                                                        @error('business_info_step_1')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 mb-4">
                                                    <div class="form-group">
                                                        <label class="text-label">Business Info Step 2</label>
                                                        <input type="text" name="business_info_step_2" class="form-control" value="{{$datas->business_info_step_2 ?? ''}}" placeholder="">
                                                        @error('business_info_step_2')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 mb-4">
                                                    <div class="form-group">
                                                        <label class="text-label">Business Info Step 3</label>
                                                        <input type="text" name="business_info_step_3" class="form-control" value="{{$datas->business_info_step_3 ?? ''}}" placeholder="">
                                                        @error('business_info_step_3')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 mb-4">
                                                    <div class="form-group">
                                                        <label class="text-label">Business Info Step 4</label>
                                                        <input type="text" name="business_info_step_4" class="form-control" value="{{$datas->business_info_step_4 ?? ''}}" placeholder="">
                                                        @error('business_info_step_4')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 mb-4">
                                                    <div class="form-group">
                                                        <label class="text-label">Business Info Step 5</label>
                                                        <input type="text" name="business_info_step_5" class="form-control" value="{{$datas->business_info_step_5 ?? ''}}" placeholder="">
                                                        @error('business_info_step_5')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 mb-4">
                                                    <div class="form-group">
                                                        <label class="text-label">Business Info Step 6</label>
                                                        <input type="text" name="business_info_step_6" class="form-control" value="{{$datas->business_info_step_6 ?? ''}}" placeholder="">
                                                        @error('business_info_step_6')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 mb-4">
                                                    <div class="form-group">
                                                        <label class="text-label">Business Info Step 7</label>
                                                        <input type="text" name="business_info_step_7" class="form-control" value="{{$datas->business_info_step_7 ?? ''}}" placeholder="">
                                                        @error('business_info_step_7')
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