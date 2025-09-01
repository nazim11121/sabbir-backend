@extends('layouts.app')
@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12 col-xxl-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Edit</h4>
                        </div>
                        <div class="card-body">
                            <div class="basic-form">
                                <form class="color-black" method="POST"
                                    action="{{ route('commission.update', $datas->id) }}" style="color:black" enctype="multipart/form-data">
                                    @csrf
                                    @method('PUT')
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Customer Name<span
                                                class="requiredStar">*</span></label>
                                        <div class="col-sm-10">
                                            <select name="user_id" id="user_id" class="form-control" required>
                                                <option value="" disabled selected>Select Customer</option>
                                                @foreach ($users as $user)
                                                    <option value="{{ $user->id }}"
                                                        {{ $datas->user_id == $user->id ? 'selected' : '' }}>
                                                        {{ $user->name }}-({{ $user->email }})</option>
                                                @endforeach
                                            </select>
                                            @error('user_id')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Commission Type<span
                                                class="requiredStar">*</span></label>
                                        <div class="col-sm-10">
                                            <select name="commission_type" id="commission_type" class="form-control" required>
                                                <option value="" disabled {{ empty($datas->commission_type) ? 'selected' : '' }}>Select Commission Type</option>
                                                <option value="For Investment" {{ $datas->commission_type == 'For Investment' ? 'selected' : '' }}>For Investment</option>
                                                <option value="For Trading" {{ $datas->commission_type == 'For Trading' ? 'selected' : '' }}>For Trading</option>
                                                <option value="For Referral" {{ $datas->commission_type == 'For Referral' ? 'selected' : '' }}>For Referral</option>
                                                <option value="For FTD" {{ $datas->commission_type == 'For FTD' ? 'selected' : '' }}>For FTD</option>
                                                <option value="Others" {{ $datas->commission_type == 'Others' ? 'selected' : '' }}>Others</option>
                                            </select>

                                            @error('commission_type')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Percentage</label>
                                        <div class="col-sm-10">
                                            <input type="number" name="percentage" id="percentage" value="{{ $datas->percentage }}"
                                                class="form-control" placeholder="">
                                            @error('percentage')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Amount<span
                                                class="requiredStar">*</span></label>
                                        <div class="col-sm-10">
                                            <input type="number" name="amount" id="amount" value="{{ $datas->amount }}"
                                                class="form-control" placeholder="" required>
                                            @error('amount')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Remarks</label>
                                        <div class="col-sm-10">
                                            <input type="remarks" name="remarks" id="remarks" value="{{ $datas->remarks }}"
                                                class="form-control" placeholder="">
                                            @error('remarks')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-2">Status</div>
                                        <div class="col-sm-10">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="status"
                                                    id="status" value="1" {{ $datas->status == 1 ? 'checked' : '' }}>
                                                <label class="form-check-label">
                                                    Active/Inactive
                                                </label>
                                            </div>
                                        </div>
                                    </div>

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
