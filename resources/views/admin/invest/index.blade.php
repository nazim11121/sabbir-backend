@extends('layouts.app')

    <style>
        .disabled-link {
            pointer-events: none;
            opacity: 0.6;
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
                            <h4 class="card-title">Invest List</h4>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="example" class="display" style="min-width: 845px; color: black;">
                                    <thead>
                                        <tr>
                                            <th>Sl</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Amount</th>
                                            <th>Date</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($datas as $key => $value)
                                            <tr>
                                                <td>{{ ++$key }}</td>
                                                <td>{{ $value->users->name }}</td>
                                                <td>{{ $value->users->email }}</td>
                                                <td>{{ $value->amount }}</td>
                                                <td>{{ $value->created_at->format('d-m-Y') }}</td>
                                                <td>
                                                    @can('contact-creed-delete-btn')
                                                        @if ($value->investment_type == 'copy')
                                                            @if ($value->payment_status == 2)
                                                                <a href="{{ route('copy-accept.status', [$value->id, 2]) }}"
                                                                   class="btn btn-danger btn-sm disabled-link" disabled="true">
                                                                    Cancelled
                                                                </a>
                                                            @elseif ($value->payment_status == 1)
                                                                <a href="{{ route('copy-accept.status', [$value->id, 2]) }}"
                                                                   class="btn btn-danger btn-sm disabled-link" style="display: none;">
                                                                    Stay
                                                                </a>
                                                            @else
                                                                <button type="button"
                                                                    class="btn btn-danger btn-sm"
                                                                    data-toggle="modal"
                                                                    data-target="#cancelModal"
                                                                    data-id="{{ $value->id }}"
                                                                    data-user-id="{{ $value->user_id }}"
                                                                    data-user-name="{{ $value->users->name }}"
                                                                    data-amount="{{ $value->amount }}"
                                                                    data-date="{{ $value->created_at->format('d-m-Y') }}">
                                                                    Request to Cancel
                                                                </button>
                                                            @endif
                                                        @endif
                                                    @endcan
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div> <!-- /.table-responsive -->
                        </div> <!-- /.card-body -->
                    </div> <!-- /.card -->

                </div>
            </div>
        </div>
    </div>

    <!-- Cancel Modal -->
    <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="cancelModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Request to Cancel</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p><strong>User Name:</strong> <span id="userName"></span></p>
                    <p><strong>Amount:</strong> $<span id="amount"></span></p>
                    <p><strong>Date:</strong> <span id="date"></span></p>

                    <form id="cancelForm" method="POST">
                        @csrf
                        <div class="form-group">
                            <label for="returnAmount">Enter Return Amount</label>
                            <input type="number" class="form-control" id="returnAmount" name="returnAmount" required>
                        </div>
                        <button type="submit" class="btn btn-danger">Submit</button>
                    </form>
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
        document.addEventListener("DOMContentLoaded", function () {

            // Handle cancel modal population
            $('#cancelModal').on('show.bs.modal', function (event) {
                const button = $(event.relatedTarget);
                const id = button.data('id');
                const userId = button.data('user-id');
                const userName = button.data('user-name');
                const amount = button.data('amount');
                const date = button.data('date');

                const modal = $(this);
                modal.find('#userName').text(userName);
                modal.find('#amount').text(amount);
                modal.find('#date').text(date);

                // Set dynamic action for the form
                modal.find('#cancelForm').attr('action', `/copy-accept-status/${id}/${userId}`);
            });

            // Optional: Handle image preview modal
            const proofImgs = document.querySelectorAll(".proof-img");
            const modalImage = document.getElementById("modalImage");

            proofImgs.forEach(img => {
                img.addEventListener("click", function () {
                    modalImage.src = this.getAttribute("data-img");
                });
            });

        });
    </script>
@endsection
