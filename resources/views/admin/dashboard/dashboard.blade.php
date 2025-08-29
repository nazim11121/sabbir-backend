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
                                    111
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
                                <div class="stat-digit"> <i class="fa fa-user"></i>11212</div>
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
                                <div class="stat-digit"> <i class="fa fa-user"></i> 123</div>
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
                                <div class="stat-text">Total Packages Sell</div>
                                <div class="stat-digit"> <i class="fa fa-user"></i>3333</div>
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
    <script>
        var ctx = document.getElementById('myPieChart').getContext('2d');
        var myPieChart = new Chart(ctx, {
            type: 'pie', // Pie chart type
            data: {
                labels: @json($labels), // Pass labels from the controller
                datasets: [{
                    label: 'Data Distribution',
                    data: @json($values), // Pass values from the controller
                    backgroundColor: ['#7ED321', '#593bdb', '#50E3C2', '#FFAA16'],
                    borderColor: ['#7ED321', '#593bdb', '#50E3C2', 'FFAA16'],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function(tooltipItem) {
                                return tooltipItem.label + ': ' + tooltipItem.raw;
                            }
                        }
                    }
                }
            }
        });
    </script>


    <script>
        var ctx = document.getElementById('myBarChart').getContext('2d');
        var myBarChart = new Chart(ctx, {
            type: 'bar', // Change type to 'bar' for bar chart
            data: {
                labels: @json($labels), // Pass labels from the controller
                datasets: [{
                    label: 'Bar charts',
                    data: @json($values), // Pass values from the controller
                    backgroundColor: ['#7ED321', '#593bdb', '#50E3C2', '#FFAA16'],
                    borderColor: ['#7ED321', '#593bdb', '#50E3C2', 'FFAA16'],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true, // Ensure Y axis starts from 0
                    }
                },
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function(tooltipItem) {
                                return tooltipItem.label + ': ' + tooltipItem.raw;
                            }
                        }
                    }
                }
            }
        });
    </script>
@endpush