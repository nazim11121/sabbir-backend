@extends('layouts.app')

@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12 col-xxl-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Edit Pricing Plan</h4>
                        </div>
                        <div class="card-body">
                            <div class="basic-form">
                                <form class="text-black" method="POST" action="{{ route('pricing-plan.update', $pricingPlan->id) }}">
                                    @method('PUT')
                                    @csrf
                                    
                                    <!-- Type -->
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Type<span class="requiredStar">*</span></label>
                                        <div class="col-sm-10">
                                            <select name="type_name" id="type_name" class="form-control select2" required>
                                                <option value="">Select Type</option>
                                                <option value="Basic" {{ $pricingPlan->type_name == 'Basic' ? 'selected' : '' }}>Basic</option>
                                                <option value="Growth" {{ $pricingPlan->type_name == 'Growth' ? 'selected' : '' }}>Growth</option>
                                                <option value="Enterprise" {{ $pricingPlan->type_name == 'Enterprise' ? 'selected' : '' }}>Enterprise</option>
                                            </select>
                                            @error('type_name')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <!-- Pricing -->
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Pricing<span class="requiredStar">*</span></label>
                                        <div class="col-sm-10">
                                            <input type="text" name="pricing" id="pricing" value="{{ $pricingPlan->pricing }}" class="form-control" required>
                                            @error('pricing')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <!-- Plan Duration -->
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Plan Duration</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="plan_duration" id="plan_duration" value="{{ $pricingPlan->plan_duration }}" class="form-control">
                                            @error('plan_duration')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <!-- Features -->
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Features<span class="requiredStar">*</span></label>
                                        <div class="col-sm-10" id="features-list">
                                            @foreach($pricingPlan->feature_title as $index => $feature)
                                                <div class="row feature-item mb-2">
                                                    <div class="col-md-5">
                                                        <input type="text" class="form-control" name="feature_title[]" value="{{ $feature }}" placeholder="Feature Title">
                                                    </div>
                                                    <div class="col-md-5">
                                                        <select class="form-select" name="feature_status[]">
                                                            <option value="1" {{ $pricingPlan->feature_status[$index] == 1 ? 'selected' : '' }}>Active</option>
                                                            <option value="0" {{ $pricingPlan->feature_status[$index] == 0 ? 'selected' : '' }}>Inactive</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <button type="button" class="btn btn-danger remove-feature">-</button>
                                                    </div>
                                                </div>
                                            @endforeach

                                            <!-- Button to add more features -->
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

                                    <!-- Key Tag -->
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Key Tag</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="key_tag" id="key_tag" value="{{ $pricingPlan->key_tag }}" class="form-control">
                                            @error('key_tag')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <!-- Description -->
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Description</label>
                                        <div class="col-sm-10">
                                            <textarea name="description" id="description" class="form-control">{{ $pricingPlan->description }}</textarea>
                                            @error('description')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <!-- Status -->
                                    <div class="form-group row">
                                        <div class="col-sm-2">Status</div>
                                        <div class="col-sm-10">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="status" id="status" value="1" {{ $pricingPlan->status == 1 ? 'checked' : '' }}>
                                                <label class="form-check-label">
                                                    Active/Inactive
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Submit Button -->
                                    <div class="form-group row">
                                        <div class="col-sm-10 text-center">
                                            <button type="submit" class="btn btn-primary">Update</button>
                                            <a href="{{ url()->previous() }}" class="btn btn-secondary">Cancel</a>
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
        // Add a new feature row
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
    
        // Remove a feature row
        $(document).on("click", ".remove-feature", function() {
            $(this).closest(".feature-item").remove();
        });
    });
</script>
@endpush
