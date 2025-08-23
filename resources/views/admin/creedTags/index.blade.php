@extends('layouts.app')

@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Creed Tags List</h4>
                            @can('creed-tags-add-btn')
                                <a class="btn btn-info" href="{{ route('creed-tags.create') }}">Add</a>
                            @endcan
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="example" class="display" style="min-width: 845px;color:black">
                                    <thead>
                                        <tr>
                                            <th>Sl</th>
                                            <th>Name</th>
                                            <th>Priority</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($datas as $key => $value)
                                            <tr>
                                                <td>{{ ++$key }}</td>
                                                <td>{{ $value->name }}</td>
                                                <td>
                                                    <div class="d-flex">
                                                        <input type="number" class="form-control priority-input w-auto" 
                                                            value="{{ $value->priority }}" 
                                                            data-id="{{ $value->id }}" 
                                                            min="1">
                                                        <button class="btn btn-info update-priority btn-sm btn-rounded text-white" data-id="{{ $value->id }}">Update</button>
                                                    </div>
                                                </td>
                                                <td>
                                                    @if ($value->status == 1)
                                                    <span>Active</span>@else<span>Inactive</span>
                                                    @endif
                                                </td>
                                                <td>
                                                    @can('creed-tags-edit-btn')
                                                        <a href="{{ route('creed-tags.edit', $value->id) }}"
                                                            class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> Edit</a>
                                                    @endcan

                                                    @can('creed-tags-delete-btn')
                                                        <form action="{{ route('creed-tags.destroy', $value->id) }}"
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
@endsection
@push('script')
<script>
    document.querySelectorAll('.update-priority').forEach(button => {
        button.addEventListener('click', function () {
            let tagId = this.getAttribute('data-id');
            let priorityInput = document.querySelector(`.priority-input[data-id='${tagId}']`);
            let newPriority = priorityInput.value;
            const appUrl = @json(config('app.url'));

            fetch(`${appUrl}/business/creed-tags/priority/${tagId}`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                },
                body: JSON.stringify({ priority: newPriority })
            })
            .then(data => {
                Swal.fire({
                    icon: 'success',
                    title: 'Success!',
                    text: 'Priority updated successfully.',
                    confirmButtonText: 'Ok'
                });
            })
            .catch(error => {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Something went wrong. Check console.',
                    confirmButtonText: 'Try Again'
                });
            });

        });
    });
</script>
@endpush
