@extends('frontend.default.layouts.master')

@section('title')
    {{ localize('About Us') }} {{ getSetting('title_separator') }} {{ getSetting('system_title') }}
@endsection

@section('breadcrumb-contents')
    <div class="breadcrumb-content">
        <h2 class="mb-2 text-center">{{ localize('About Us') }}</h2>
        <nav>
            <ol class="breadcrumb justify-content-center">
                <li class="breadcrumb-item fw-bold" aria-current="page"><a
                        href="{{ route('home') }}">{{ localize('Home') }}</a></li>
                <li class="breadcrumb-item fw-bold" aria-current="page">{{ localize('Pages') }}</li>
                <li class="breadcrumb-item fw-bold" aria-current="page">{{ localize('About') }}</li>
            </ol>
        </nav>
    </div>
@endsection

@section('contents')
    <!--breadcrumb-->
    @include('frontend.default.inc.breadcrumb')
    <!--breadcrumb-->

    <!--about section start-->
    <section class="pt-120 ab-about-section position-relative z-1 overflow-hidden">
        <div class="container">
            <div class="row g-5 g-xl-4 align-items-center">
                <div class="col-xl-6">
                    <div class="ab-left position-relative">
                        <img src="{{ uploadedAsset(getSetting('about_intro_image')) }}" alt="" class="img-fluid">
                        <div class="text-end">
                            <div class="ab-quote p-4 text-start">
                                <h4 class="mb-0 fw-normal text-white">“{{ getSetting('about_intro_quote') }}” <span
                                        class="fs-md fw-medium position-relative">{{ getSetting('about_intro_quote_by') }}</span>
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="ab-about-right">
                        <div class="subtitle d-flex align-items-center gap-3 flex-wrap">
                            <span class="gshop-subtitle">{{ getSetting('about_intro_sub_title') }}</span>
                            <span>
                                <svg width="78" height="16" viewBox="0 0 78 16" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <line x1="0.0138875" y1="7.0001" x2="72.0139" y2="8.0001" stroke="#FF7C08"
                                        stroke-width="2" />
                                    <path d="M78 8L66 14.9282L66 1.0718L78 8Z" fill="#FF7C08" />
                                </svg>
                            </span>
                        </div>
                        <h2 class="mb-4">{!! getSetting('about_intro_title') !!}</h2>
                        <p class="mb-8">{{ getSetting('about_intro_text') }}</p>
                        <div class="row g-4">
                            <div class="col-md-6">
                                <div class="image-box py-6 px-4 image-box-border">
                                    <div class="icon position-relative">
                                        <img src="{{ staticAsset('frontend/default/assets/img/icons/hand-icon.svg') }}"
                                            alt="hand icon" class="img-fluid">
                                    </div>
                                    <h4 class="mt-3">{{ localize('Our Mission') }}</h4>
                                    <p class="mb-0">{{ getSetting('about_intro_mission') }}</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="image-box py-6 px-4 image-box-border">
                                    <div class="icon position-relative">
                                        <img src="{{ staticAsset('frontend/default/assets/img/icons/hand-icon.svg') }}"
                                            alt="hand icon" class="img-fluid">
                                    </div>
                                    <h4 class="mt-3">{{ localize('Our Vision') }}</h4>
                                    <p class="mb-0">{{ getSetting('about_intro_vision') }}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--about section end-->
@endsection
