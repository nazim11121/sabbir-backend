@extends('layouts.app')
<style>
    .disabled-link {
        pointer-events: none; /* disables click */
        opacity: 0.6;         /* looks disabled */
        cursor: not-allowed;
    }
</style>
@section('content')
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Buy Packages</h4>
                            <!-- @can('creed-tags-add-btn')
                                <a class="btn btn-info" href="{{ route('creed-tags.create') }}">Add</a>
                            @endcan -->
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="example" class="display" style="min-width: 845px;color:black">
                                    <thead>
                                        <tr>
                                            <th>Sl</th>
                                            <th>Name</th>
                                            <th>Order ID</th>
                                            <th>Amount</th>
                                            <th>Proof</th>
                                            <th>Status</th>
                                            <th>Date</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($datas as $key => $value)
                                            <tr>
                                                <td>{{ ++$key }}</td>
                                                <td>{{ $value->users->name }} </br> {{ $value->users->email }}</td>
                                                <!-- <td>{{ $value->binance_id }}</td> -->
                                                <td>{{ $value->order_id }}</td>
                                                <td>{{ $value->amount }}</td>
                                                <td>
                                                    <img src="{{ asset($value->invest_proof) }}" 
                                                         alt="image" 
                                                         class="img-thumbnail proof-img" 
                                                         style="width:80px; cursor:pointer;"
                                                         data-bs-toggle="modal" 
                                                         data-bs-target="#imageModal"
                                                         data-img="{{ asset($value->invest_proof) }}">
                                                </td>
                                                <td>
                                                    @if ($value->payment_status == 1)
                                                    <span>Success</span>@else<span>Pending</span>
                                                    @endif
                                                </td>
                                                <td>{{ $value->created_at->format('d-m-Y') }}</td>
                                                <td>
                                                    @can('creed-tags-edit-btn')
                                                        @if($value->payment_status == 1)
                                                            <a href="{{ route('invest-accept.status', $value->id) }}"
                                                                class="btn btn-success btn-sm disabled-link"><i class=""></i> OK</a>
                                                        @else
                                                            <a href="{{ route('invest-accept.status', $value->id) }}"
                                                            class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> Accept</a>
                                                        @endif
                                                    @endcan
                                                    <!-- @can('contact-creed-delete-btn')
                                                        <form action="{{ route('contact-creed.destroy', $value->id) }}"
                                                            method="POST" style="display: inline-block;">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="btn btn-danger btn-sm"
                                                                onclick="return confirm('Are you sure you want to delete this?')">
                                                                <i class="fa fa-trash"></i> Delete
                                                            </button>
                                                        </form>
                                                    @endcan -->
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
<!-- Image Preview Modal -->
    <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <img id="modalImage" src="" class="img-fluid rounded" alt="Preview">
                </div>
            </div>
        </div>
    </div>
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        const proofImgs = document.querySelectorAll(".proof-img");
        const modalImage = document.getElementById("modalImage");

        proofImgs.forEach(img => {
            img.addEventListener("click", function() {
                modalImage.src = this.getAttribute("data-img");
            });
        });
    });
</script>
@endsection

@push('scripts')
@endpush
