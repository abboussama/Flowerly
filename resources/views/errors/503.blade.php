@extends('frontend.default.layouts.master')
@section('title')
    Under Maintenance
@endsection
@section('contents')
    <section class="section-404 ptb-120 position-relative overflow-hidden z-1">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="content-404 text-center">
                        <img src="{{ staticAsset('frontend/default/assets/img/503.svg') }}" alt="not found"
                            class="img-fluid">
                        <h2 class="mt-4">We are under development.</h2>
                        <p class="mb-6">The page you are looking for is
                            temporarily unavailable.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
