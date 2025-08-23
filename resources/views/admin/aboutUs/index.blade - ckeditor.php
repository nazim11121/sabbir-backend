@extends('layouts.app')
@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12 col-xxl-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">About Us</h4>
                        </div>
                        <div class="card-body">
                            <div class="basic-form">
                                <form class="color-black" method="POST" action="{{ route('about-us.store') }}"
                                    style="color:black">
                                    @csrf

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Individual Title<span
                                                class="requiredStar">*</span></label>
                                        <div class="col-sm-10">
                                            <input type="text" name="individual_title" id="individual_title"
                                                value="{{ isset($data) ? $data->individual_title : old('individual_title') }}"
                                                class="form-control" placeholder="" required>
                                            @error('individual_title')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Business Title<span
                                                class="requiredStar">*</span></label>
                                        <div class="col-sm-10">
                                            <input type="text" name="business_title" id="business_title"
                                                value="{{ isset($data) ? $data->business_title : '' }}" class="form-control"
                                                placeholder="" required>
                                            @error('business_title')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Individual Description<span
                                                class="requiredStar">*</span></label>
                                        <div class="col-sm-10">
                                            <textarea name="individual_description" class="editor" id="summary-ckeditor">
                                                @isset($data)
                                                {!! $data->individual_description !!}
                                                @else
                                                {{ old('individual_description') }}
                                                @endisset
                                            </textarea>
                                            @error('individual_description')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Business Description<span
                                                class="requiredStar">*</span></label>
                                        <div class="col-sm-10">
                                            <textarea name="business_description" class="editor" required>
                                                @isset($data)
                                                {!! $data->business_description !!}
                                                @else
                                                {{ old('business_description') }}
                                                @endisset
                                            </textarea>
                                            @error('business_description')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Individual Tab Description<span
                                                class="requiredStar">*</span></label>
                                        <div class="col-sm-10">
                                            <textarea name="individual_tab_description" class="editor" required>
                                                @isset($data)
                                                {!! $data->individual_tab_description !!}
                                                @endisset
                                            </textarea>
                                            @error('individual_tab_description')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Business Tab Description<span
                                                class="requiredStar">*</span></label>
                                        <div class="col-sm-10">
                                            <textarea name="business_tab_description" class="editor" required>
                                                @isset($data)
                                                {!! $data->business_tab_description !!}
                                                @else
                                                {{ old('business_tab_description') }}
                                                @endisset
                                            </textarea>
                                            @error('business_tab_description')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-2">Status</div>
                                        <div class="col-sm-10">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="status"
                                                    id="status" value="1" {{ $data->status==1 ? ' checked' : 0 }}>
                                                <label class="form-check-label">
                                                    Active/Inactive
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-10 text-center">
                                            <button type="submit" class="btn btn-primary">Update</button>
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

    <script src="{{ asset('admin/assets/ckeditor/ckeditor.js') }}"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.editor').forEach(textarea => {
                CKEDITOR.replace(textarea);
            });
        });
    </script>
@endsection
