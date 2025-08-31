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
                                            <th>Customer Name</th>
                                            <th>Package Name</th>
                                            <th>Amount</th>
                                            <th>To Do</th>
                                            <!-- <th>Status</th> -->
                                            <th>Date</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($datas as $key => $value)
                                            <tr>
                                                <td>{{ ++$key }}</td>
                                                <td>{{ $value->users->name }}</td>
                                                <td>{{ $value->package_id }}</td>
                                                <td>{{ $value->amount }}</td>
                                                <td>
                                                    <button type="button"
                                                        class="btn btn-primary btn-sm view-rules-btn"
                                                        data-id="{{ $value->id }}"
                                                        data-user="{{ $value->user_id }}"
                                                        data-route="{{ route('buy-packages.rules.fetch', $value->id) }}"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#rulesModal">
                                                        View Rules
                                                    </button>
                                                </td>
                                                <td>{{ $value->created_at->format('d-m-Y') }}</td>
                                                <td>
                                                    @can('creed-tags-edit-btn')
                                                        @if($value->payment_status == 1)
                                                            <a href="{{ route('buypackage-accept.status', [$value->id,$id2=1]) }}"
                                                                class="btn btn-success btn-sm disabled-link"><i class=""></i> Passed</a>
                                                        @elseif($value->payment_status == 0)
                                                            <a href="{{ route('buypackage-accept.status', [$value->id,$id2=1]) }}"
                                                            class="btn btn-primary btn-sm"><i class=""></i> Pass</a>
                                                        @endif
                                                    @endcan
                                                    @can('creed-tags-edit-btn')
                                                        @if($value->payment_status == 2)
                                                            <a href="{{ route('buypackage-accept.status', [$value->id,$id2=2]) }}"
                                                                class="btn btn-danger btn-sm disabled-link"><i class=""></i> Failed</a>
                                                        @elseif($value->payment_status == 1)
                                                            <a href="{{ route('buypackage-accept.status', [$value->id,$id2=2]) }}"
                                                                class="btn btn-danger btn-sm disabled-link" style="display:none"><i class=""></i> Fail</a>
                                                        @else
                                                            <a href="{{ route('buypackage-accept.status', [$value->id,$id2=2]) }}"
                                                            class="btn btn-danger btn-sm"><i class=""></i> Fail</a>
                                                        @endif
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
    <!-- Rules Confirmation Modal -->
    <div class="modal fade" id="rulesModal" tabindex="-1" aria-labelledby="rulesModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <form id="rulesForm" method="POST" action="{{ route('buy-packages.todo-list') }}">
                    @csrf
                    <input type="hidden" name="user_id" id="userIdInput">
                    <input type="hidden" name="buy_id" id="buyIdInput">
                    <div class="modal-header">
                        <h5 class="modal-title" id="rulesModalLabel">Trading Rules Agreement</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" name="rules[min_profit]" id="min_profit">
                            <label class="form-check-label" for="min_profit">
                                মিনিমাম প্রফিট: প্রতিদিন +10%
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" name="rules[max_loss]" id="max_loss">
                            <label class="form-check-label" for="max_loss">
                                ম্যাক্স লস: প্রতিদিন –10%
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" name="rules[trade_limit]" id="trade_limit">
                            <label class="form-check-label" for="trade_limit">
                                ট্রেড লিমিট: দিনে সর্বোচ্চ 10
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" name="rules[risk_management]" id="risk_management">
                            <label class="form-check-label" for="risk_management">
                                রিস্ক ম্যানেজমেন্ট: প্রতি ট্রেডে ব্যালেন্সের 2%
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" name="rules[rule_break]" id="rule_break">
                            <label class="form-check-label" for="rule_break">
                                রুল ভাঙলে: সাথে সাথে অ্যাকাউন্ট ক্যানসেল
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" name="rules[profit_share]" id="profit_share">
                            <label class="form-check-label" for="profit_share">
                                প্রফিট শেয়ার: 60% ট্রেডার, 40% কোম্পানি
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">Confirm Rules</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const viewButtons = document.querySelectorAll(".view-rules-btn");
            const buyIdInput = document.getElementById("buyIdInput");
            const userIdInput = document.getElementById("userIdInput");

            viewButtons.forEach(button => {
                button.addEventListener("click", function () {
                    const buyId = this.getAttribute("data-id");
                    const userId = this.getAttribute("data-user");
                    const fetchUrl = this.getAttribute("data-route");

                    buyIdInput.value = buyId;
                    userIdInput.value = userId;

                    // Uncheck all checkboxes initially
                    document.querySelectorAll("#rulesModal .form-check-input").forEach(cb => {
                        cb.checked = false;
                    });

                    // Fetch saved rules for the selected buy_id
                    fetch(fetchUrl)
                        .then(response => response.json())
                        .then(savedRules => {
                            savedRules.forEach(ruleKey => {
                                const checkbox = document.getElementById(ruleKey);
                                if (checkbox) {
                                    checkbox.checked = true;
                                }
                            });
                        })
                        .catch(error => {
                            console.error("Failed to load rules:", error);
                        });
                });
            });
        });
    </script>


@endsection

@push('scripts')
@endpush
