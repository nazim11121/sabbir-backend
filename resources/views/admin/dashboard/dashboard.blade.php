@extends('layouts.app')
@section('content')
    <div class="content-body">
        <!-- row -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="stat-widget-two card-body">
                            <div class="stat-content">
                                <div class="stat-text">Total Users </div>
                                <div class="stat-digit"> <i class="fa fa-user"></i>
                                    {{ $totalUsers ?? '0' }}
                                </div>
                            </div>
                            <div class="progress">
                                <div class="progress-bar w-85 generalProfile" role="progressbar" aria-valuenow="85"
                                    aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="stat-widget-two card-body">
                            <div class="stat-content">
                                <div class="stat-text">Total Deposit</div>
                                <div class="stat-digit"> <i class="fa fa-money"></i>{{ $totalDeposit ?? '0' }} $</div>
                            </div>
                            <div class="progress">
                                <div class="progress-bar businessProfile w-75" role="progressbar" aria-valuenow="78"
                                    aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="stat-widget-two card-body">
                            <div class="stat-content">
                                <div class="stat-text">Total Invest</div>
                                <div class="stat-digit"> <i class="fa fa-money"></i> {{ $totalInvest ?? '0' }} $</div>
                            </div>
                            <div class="progress">
                                <div class="progress-bar incompleteProfile w-50" role="progressbar" aria-valuenow="50"
                                    aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="stat-widget-two card-body">
                            <div class="stat-content">
                                <div class="stat-text">Total WIthdraw</div>
                                <div class="stat-digit"> <i class="fa fa-money"></i>{{ $totalWithdraw ?? '0' }} $</div>
                            </div>
                            <div class="progress">
                                <div class="progress-bar totalVisitor w-65" role="progressbar" aria-valuenow="65"
                                    aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- <div class="row">
                {{-- bar chart --}}
                <div class="col-xl-7 col-lg-7 col-md-7 my-3">
                    <div class="card">
                        <div class="card-body">
                            <div style="margin: 0 auto;">
                                <canvas id="myBarChart" style="height: 400px;"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- pie chart --}}
                <div class="col-xl-5 col-lg-5 col-md-5 my-3">
                    <div class="card">
                        <div class="card-body">
                            <div style="margin: 0 auto; width: 100%; height: auto;">
                                <canvas id="myPieChart" style="height: 330px !important; width: 100% !important;"></canvas>
                            </div>
                        </div>
                    </div>
                </div>



                {{-- <div class="col-xl-7 col-lg-7 col-md-7">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="m-t-10">
                                <h4 class="card-title">Customer Feedback</h4>
                                <h2 class="mt-3">385749</h2>
                            </div>
                            <div class="widget-card-circle mt-5 mb-5" id="info-circle-card">
                                <i class="ti-control-shuffle pa"></i>
                            </div>
                            <ul class="widget-line-list m-b-15">
                                <li class="border-right">92% <br><span class="text-success"><i class="ti-hand-point-up"></i>
                                        Positive</span></li>
                                <li>8% <br><span class="text-danger"><i class="ti-hand-point-down"></i>Negative</span></li>
                            </ul>
                        </div>
                    </div>
                </div> --}}
            </div> -->
        </div>
    </div>
@endsection

@push('script')

@endpush