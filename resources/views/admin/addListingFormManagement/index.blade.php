@extends('layouts.app')
<style>
    /* Custom styles for the toggle switch */
    .switch {
      position: relative;
      display: inline-block;
      width: 60px;
      height: 34px;
    }

    .switch input {
      opacity: 0;
      width: 0;
      height: 0;
    }

    .slider {
      position: absolute;
      cursor: pointer;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background-color: #ccc;
      transition: 0.4s;
      border-radius: 34px;
    }

    .slider:before {
      position: absolute;
      content: "";
      height: 26px;
      width: 26px;
      border-radius: 50%;
      left: 4px;
      bottom: 4px;
      background-color: white;
      transition: 0.4s;
    }

    input:checked + .slider {
      background-color: #4caf50;
    }

    input:checked + .slider:before {
      transform: translateX(26px);
    }
  </style>
@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12 col-xxl-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Form Management</h4>
                        </div>
                        <div class="card-body">
                            <div class="basic-form">
                                <form class="color-black" method="POST" action="{{ route('add-listing-form-management.store') }}"
                                    style="color:black">
                                    @csrf
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Field Category<span
                                                class="requiredStar">*</span></label>
                                        <div class="col-sm-4">
                                            <select name="field_category" id="field_category" class="form-control" required>
                                                <option value="">Select Category</option>
                                                <option value="Owner Info">Owner Info</option>
                                                <option value="Business Info">Business Info</option>
                                                <option value="Business Contact Info">Business Contact Info</option>
                                                <option value="Add Business Images">Add Business Images</option>
                                                <option value="Hours & Service Area">Hours & Service Area</option>
                                                <option value="Your Creed Tags">Your Creed Tags</option>
                                                <option value="Creed Exclusive Promo">Creed Exclusive Promo</option>
                                            </select>
                                            @error('field_category')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Field Name<span
                                                class="requiredStar">*</span></label>
                                        <div class="col-sm-4">
                                            <input type="text" name="field_name" id="field_name"
                                                value="{{ isset($data) ? $data->field_name : '' }}" class="form-control"
                                                placeholder="" required>
                                            @error('field_name')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-4 d-flex align-items-center">
                                            <label class="switch">
                                              <input type="checkbox" id="toggleSwitch" name="field_status" value="1" onclick="toggleButton()">
                                              <span class="slider"></span>
                                            </label>
                                            <div id="status" class="ms-3">Disabled</div>
                                        </div>
                                    </div>

                                    {{-- <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Description</label>
                                        <div class="col-sm-10">
                                            <textarea name="description" class="form-control" rows="2"></textarea>
                                            @error('description')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div> --}}

                                    <div class="form-group row">
                                        <div class="col-sm-2">Status</div>
                                        <div class="col-sm-10">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="status"
                                                    id="status" value="1" checked>
                                                <label class="form-check-label">
                                                    Active/Inactive
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-10 text-center">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Add Listing Form Field List</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="example" class="display" style="min-width: 845px;color:black">
                                    <thead>
                                        <tr>
                                            <th>Sl</th>
                                            <th>Field Category/Page Name</th>
                                            <th>Field Name</th>
                                            <th>Field Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($datas as $key => $value)
                                            <tr>
                                                <td>{{ ++$key }}</td>
                                                <td>{{ $value->field_category }}</td>
                                                <td>{{ $value->field_name }}</td>
                                                <td>
                                                    <label class="switch">
                                                        <input type="checkbox" class="toggle-status" data-id="{{ $value->id }}" {{ $value->field_status ? 'checked' : '' }}>
                                                        <span class="slider"></span>
                                                    </label>
                                                </td>
                                                <td>
                                                    @can('add-listing-form-delete-btn')
                                                        <form action="{{ route('add-listing-form-management.destroy', $value->id) }}"
                                                            method="POST" style="display: inline-block;">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="btn btn-danger btn-sm"
                                                                onclick="return confirm('Are you sure you want to delete this?')">
                                                                <i class="fa fa-trash"></i> Delete
                                                            </button>
                                                        </form>
                                                    @endcan

                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

  <script>
    // Function to toggle the button state
    function toggleButton() {
      const toggleSwitch = document.getElementById('toggleSwitch');
      const statusText = document.getElementById('status');
      if (toggleSwitch.checked) {
        statusText.textContent = 'Enabled';
      } else {
        statusText.textContent = 'Disabled';
      }
    }
  </script>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script>
    $(document).ready(function() {
   
        // Handle toggle button change event
        $('.toggle-status').on('change', function() {
            var itemId = $(this).data('id');
            var isActive = $(this).prop('checked') ? 1 : 0;  // Check if the toggle is active

            // AJAX call to update status in database
            $.ajax({
                url: '/add-listing-form-management/field-status/' + itemId,
                method: 'POST',
                data: {
                    _token: '{{ csrf_token() }}',
                    field_status: isActive
                },
                success: function(response) {     
                    // Update the badge and toggle based on the response
                    if (response.success) {
                        var row = $('#item-' + itemId);
                        if (response.success) {
                            // Show success message using SweetAlert
                            Swal.fire({
                                icon: 'success',
                                title: 'Status Updated',
                                text: 'The status has been updated successfully.',
                            }).then((result) => {
                                // Reload the page after the user clicks "OK"
                                if (result.isConfirmed) {
                                    location.reload();
                                }
                            });
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                text: 'Something went wrong. Please try again later.',
                            });
                        }
                    } else {
                        alert('Error updating status');
                    }
                }
            });
        });
    });
</script>

<style>
    /* Custom Toggle Switch */
    .switch {
        position: relative;
        display: inline-block;
        width: 60px;
        height: 34px;
    }

    .switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        transition: 0.4s;
        border-radius: 34px;
    }

    .slider:before {
        position: absolute;
        content: "";
        height: 26px;
        width: 26px;
        border-radius: 50%;
        left: 4px;
        bottom: 4px;
        background-color: white;
        transition: 0.4s;
    }

    input:checked + .slider {
        background-color: #4caf50;
    }

    input:checked + .slider:before {
        transform: translateX(26px);
    }
</style>
@endsection
