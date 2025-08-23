@extends('layouts.app')
@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12 col-xxl-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Add Pricing Plan</h4>
                        </div>
                        <div class="card-body">
                            <div class="basic-form">
                                <form class="text-black" method="POST" action="{{route('pricing-plan.store')}}">
                                    @csrf
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Type<span class="requiredStar">*</span></label>
                                        <div class="col-sm-10">
                                            {{-- <input type="text" name="type_name" id="type_name" value="{{old('type_name')}}" class="form-control" placeholder="" required> --}}
                                            <select name="type_name" id="type_name" class="form-control select2" required>
                                                <option value="">Select Type</option>
                                                <option value="Basic">Basic</option>
                                                <option value="Growth">Growth</option>
                                                <option value="Enterprise">Enterprise</option>
                                            </select>
                                            @error('type_name')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Pricing<span class="requiredStar">*</span></label>
                                        <div class="col-sm-10">
                                            <input type="text" name="pricing" id="pricing" value="{{old('pricing')}}" class="form-control" placeholder="" required>
                                            {{-- <select name="pricing" id="pricing" class="form-control select2" required>
                                                <option value="">Select Pricing</option>
                                                <option value="$120">$120</option>
                                                <option value="$180">$180</option>
                                                <option value="Let's talks">Let's talks</option>
                                            </select> --}}
                                            @error('pricing')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Plan Duration</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="plan_duration" id="plan_duration" value="{{old('plan_duration')}}" class="form-control" placeholder="">
                                            @error('plan_duration')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Features<span class="requiredStar">*</span></label>
                                        <div class="col-sm-10" id="features-list">
                                            <div class="row feature-item mb-2">
                                                <div class="col-md-5">
                                                    <input type="text" class="form-control" name="feature_title[]" placeholder="Feature Title">
                                                </div>
                                                <div class="col-md-5">
                                                    <select class="form-select" name="feature_status[]">
                                                        <option value="1">Active</option>
                                                        <option value="0">Inactive</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-2">
                                                    <button type="button" class="btn btn-success add-feature">+</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Key Tag</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="key_tag" id="key_tag" value="{{old('key_tag')}}" class="form-control" placeholder="">
                                            @error('key_tag')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Description</label>
                                        <div class="col-sm-10">
                                            <textarea name="description" id="description" value="{{old('description')}}" class="form-control"></textarea>
                                            @error('description')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-2">Status</div>
                                        <div class="col-sm-10">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="status" id="status" value="1" checked>
                                                <label class="form-check-label">
                                                    Active/Inactive
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-10 text-center">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                            <a href="{{url()->previous()}}" class="btn btn-secondary">Cancel</a>
                                        </div>
                                    </div>
                                </form>
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
    $(document).ready(function() {
        $(document).on("click", ".add-feature", function() {
            let featureItem = `<div class="row feature-item mb-2">
                <div class="col-md-5">
                    <input type="text" class="form-control" name="feature_title[]" placeholder="Feature Title">
                </div>
                <div class="col-md-5">
                    <select class="form-select" name="feature_status[]">
                        <option value="1">Active</option>
                        <option value="0">Inactive</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-danger remove-feature">-</button>
                </div>
            </div>`;
            $("#features-list").append(featureItem);
        });
    
        $(document).on("click", ".remove-feature", function() {
            $(this).closest(".feature-item").remove();
        });
    });
</script>
@endpush