@extends('backend.layouts.master')

@section('title')
    {{ localize('Dashboard') }} {{ getSetting('title_separator') }} {{ getSetting('system_title') }}
@endsection

@section('contents')
    @can('dashboard')
        <section class="tt-section pt-4">
            <div class="container">

                <div class="row g-3 mb-3">
                 
                </div>
                <br><br><br><br><br><br><br><br>
                @can('manage_orders')
                    <div class="row g-3 mb-3">
                        <a href="{{ route('admin.orders.index') }}" class="col-lg-3 col-sm-6">
                            <div class="card h-100 flex-column">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar avatar-lg">
                                            <div class="text-center bg-soft-primary rounded-circle">
                                                <span class="text-primary"> <i data-feather="shopping-bag"></i></span>
                                            </div>
                                        </div>
                                        <div class="ms-3">
                                            <h4 class="mb-1">{{ \App\Models\Order::count() }}</h4>
                                            <span class="text-muted">{{ localize('Total Orders') }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                        <a href="{{ route('admin.orders.index') }}?delivery_status={{ orderPendingStatus() }}"
                            class="col-lg-3 col-sm-6">
                            <div class="card h-100 flex-column">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar avatar-lg">
                                            <div class="text-center bg-soft-warning rounded-circle">
                                                <span class="text-warning"> <i data-feather="clock"></i></span>
                                            </div>
                                        </div>
                                        <div class="ms-3">
                                            <h4 class="mb-1">{{ \App\Models\Order::isPlacedOrPending()->count() }}</h4>
                                            <span class="text-muted">{{ localize('Order Pending') }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                        <a href="{{ route('admin.orders.index') }}?delivery_status={{ orderProcessingStatus() }}"
                            class="col-lg-3 col-sm-6">
                            <div class="card h-100 flex-column">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar avatar-lg">
                                            <div class="text-center bg-soft-info rounded-circle">
                                                <span class="text-info"> <i data-feather="refresh-cw"></i></span>
                                            </div>
                                        </div>
                                        <div class="ms-3">
                                            <h4 class="mb-1">{{ \App\Models\Order::isProcessing()->count() }}</h4>
                                            <span class="text-muted">{{ localize('Order Processing') }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                        <a href="{{ route('admin.orders.index') }}?delivery_status={{ orderDeliveredStatus() }}"
                            class="col-lg-3 col-sm-6">
                            <div class="card h-100 flex-column">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar avatar-lg">
                                            <div class="text-center bg-soft-success rounded-circle">
                                                <span class="text-success"> <i data-feather="check-circle"></i></span>
                                            </div>
                                        </div>
                                        <div class="ms-3">
                                            <h4 class="mb-1">{{ \App\Models\Order::isDelivered()->count() }}</h4>
                                            <span class="text-muted">{{ localize('Total Delivered') }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                @endcan
                <div class="row g-3 mb-3">
                    @can('manage_orders')



                        <a href="{{ route('admin.orders.index') }}?payment_status={{ paidPaymentStatus() }}"
                            class="col-lg-3 col-sm-6">
                            <div class="card h-100 flex-column">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar avatar-lg">
                                            <div class="text-center bg-soft-success rounded-circle">
                                                <span class="text-success"> <i data-feather="dollar-sign"></i></span>
                                            </div>
                                        </div>
                                        <div class="ms-3">
                                            <h4 class="mb-1">{{ \App\Models\Order::isPaid()->count() }}</h4>
                                            <span class="text-muted">{{ localize('Paid Orders') }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>

                        <a href="{{ route('admin.orders.index') }}?payment_status={{ unpaidPaymentStatus() }}"
                            class="col-lg-3 col-sm-6">
                            <div class="card h-100 flex-column">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar avatar-lg">
                                            <div class="text-center bg-soft-info rounded-circle">
                                                <span class="text-info"> <i data-feather="credit-card"></i></span>
                                            </div>
                                        </div>
                                        <div class="ms-3">
                                            <h4 class="mb-1">{{ \App\Models\Order::isUnpaid()->count() }}</h4>
                                            <span class="text-muted">{{ localize('Unpaid Orders') }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    @endcan





                    <div class="col-lg-3 col-sm-6">
                        <div class="card h-100 flex-column">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="avatar avatar-lg">
                                        <div class="text-center bg-soft-info rounded-circle">
                                            <span class="text-info"> <i data-feather="dollar-sign"></i></span>
                                        </div>
                                    </div>
                                    <div class="ms-3">
                                        <h4 class="mb-1">{{ formatPrice($totalEarning) }}</h4>
                                        <span class="text-muted">{{ localize('Total Earning') }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>







                    <a href="{{ route('admin.brands.index') }}" class="col-lg-3 col-sm-6 d-none">
                        <div class="card h-100 flex-column">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="avatar avatar-lg">
                                        <div class="text-center bg-soft-success rounded-circle">
                                            <span class="text-success"> <i data-feather="check-circle"></i></span>
                                        </div>
                                    </div>
                                    <div class="ms-3">
                                        <h4 class="mb-1">{{ \App\Models\Brand::count() }}</h4>
                                        <span class="text-muted">{{ localize('Total Brands') }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>

            </div>
        </section>
    @endcan
@endsection

@section('scripts')
    <script>
        "use strict";
        new ApexCharts(document.querySelector("#totalSales"), totalSales).render();

        var chartTopFive = new ApexCharts(
            document.querySelector("#topFive"),
            optionsTopFive
        );
        chartTopFive.render();

        // last 30 days order chart 
    
        var chartBar = new ApexCharts(document.querySelector("#last30DaysOrders"), optionsBar);
        chartBar.render();

        // this month sales 
    
        var chart = new ApexCharts(document.querySelector("#thisMonthChart"), options);
        chart.render();
    </script>
@endsection
