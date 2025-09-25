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
                                <form class="color-black" method="POST" action="{{ route('notification.update', $data->id) }}"
                                    style="color:black" enctype="multipart/form-data">
                                    @csrf
                                    @method("PATCH")
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Select Audience<span
                                                class="requiredStar">*</span></label>
                                        <div class="col-sm-10">
                                            <select name="user_id" id="user_id" class="form-control" required>
                                                <option value="0" selected>All</option>
                                                @foreach ($users as $user)
                                                    <option value="{{ $user->id }}" {{ $data->user_id == $user->id ? 'selected' : '' }}>
                                                        {{ $user->name }}-({{ $user->email }})</option>
                                                @endforeach
                                            </select>
                                            @error('name')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Image<span
                                                class="requiredStar">*</span></label>
                                        <div class="col-sm-10">
                                            <input type="file" name="image" id="image" class="form-control" placeholder="">
                                            @if ($data->image)
                                                <img src="{{ asset($data->image) }}" alt="Image"
                                                    style="max-width: 150px; margin-top: 10px;">
                                            @endif
                                            @error('image')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Description</label>
                                        <div class="col-sm-10">
                                            <textarea type="text" name="remarks" id="remarks" value="{{ $data->remarks }}"
                                                class="form-control" placeholder="">{{ $data->remarks }}</textarea>    
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
                                                    id="status" value="1" {{ $data->status == 1 ? 'checked' : '' }}>
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
