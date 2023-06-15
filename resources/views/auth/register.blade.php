<?php

function is_valid($phone) {
    $api_key = '8fba9eb7';
    $api_secret = 'eDGtmXg7mq9fhj17';
    $endpoint = "https://api.nexmo.com/ni/advanced/json?api_key=$api_key&api_secret=$api_secret&number=$phone";

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $endpoint);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

    curl_close($ch);

    if ($httpCode === 200) {
        // Successful request
        $data = json_decode($response, true);

        if ($data['valid_number'] === 'valid') {
            // Phone number is valid
            return "number is valid";
        } else {
            // Phone number is not valid
            return "number is not valid";
        }
    } else {
        // Request failed
        return false;
    }
}


?>
@extends('layouts.auth')

@section('title')
    {{ localize('Sign Up') }}
@endsection

@section('contents')
    <section class="login-section py-5">
        <div class="container">
            <div class="row justify-content-center">
                {{-- todo:: make banner dynamic --}}
                <div class="col-lg-5 col-12 tt-login-img"
                    data-background="{{ staticAsset('frontend/default/assets/img/banner/login-signup.jpg') }}"></div>
                <div class="col-lg-5 col-12 bg-white d-flex p-0 tt-login-col shadow">
                    <form class="tt-login-form-wrap p-3 p-md-6 p-lg-6 py-7 w-100" method="POST" id="login-form" action="{{ route('register') }}">
                        @csrf
                        <div class="mb-7">
                            <a href="{{ route('home') }}">
                                <img src="{{ uploadedAsset(getSetting('navbar_logo')) }}" alt="logo">
                            </a>
                        </div>
                        <h2 class="mb-4 h3">{{ localize('Hey there!') }}
                            <br>{{ localize('Register as a Customer.') }}
                        </h2>

                        <div class="row g-3">
                            <div class="col-sm-12">
                                <div class="input-field">
                                    <label class="fw-bold text-dark fs-sm mb-1">{{ localize('Full name') }}<sup
                                            class="text-danger">*</sup>
                                    </label>
                                    <input type="text" id="name" name="name"
                                        placeholder="{{ localize('Enter your name') }}" class="theme-input"
                                        value="{{ old('name') }}" required>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="input-field">
                                    <label class="fw-bold text-dark fs-sm mb-1">{{ localize('Email') }}<sup
                                            class="text-danger">*</sup></label>
                                    <input type="email" id="email" name="email"
                                        placeholder="{{ localize('Enter your email') }}" class="theme-input"
                                        value="{{ old('email') }}" required>
                                </div>
                            </div>

                            <div class="col-sm-12">
                                <div class="input-field">
                                    <label class="fw-bold text-dark fs-sm mb-1">
                                        @if (getSetting('registration_with') == 'email_and_phone')
                                            {{ localize('Phone') }}<sup class="text-danger">*</sup>
                                        @else
                                            {{ localize('Phone') }}
                                        @endif
                                        <small>({{ localize('Enter phone number with country code') }})</small>
                                    </label>
                                    <input type="text" id="phone" name="phone" placeholder="+212xxxxxxx" value=""
                                        class="theme-input" value="{{ old('phone') }}"
                                        @if (getSetting('registration_with') == 'email_and_phone') required @endif>
                                </div>
                            </div>

                            <div class="col-sm-12">
                                <div class="input-field check-password">
                                    <label class="fw-bold text-dark fs-sm mb-1">{{ localize('Password') }}<sup
                                            class="text-danger">*</sup></label>
                                    <div class="check-password">
                                        <input type="password" name="password" placeholder="{{ localize('Password') }}"
                                            class="theme-input" required>
                                        <span class="eye eye-icon"><i class="fa-solid fa-eye"></i></span>
                                        <span class="eye eye-slash"><i class="fa-solid fa-eye-slash"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="input-field check-password">
                                    <label class="fw-bold text-dark fs-sm mb-1">{{ localize('Confirm Password') }}<sup
                                            class="text-danger">*</sup></label>
                                    <div class="check-password">
                                        <input type="password" name="password_confirmation"
                                            placeholder="{{ localize('Confirm Password') }}" class="theme-input" required>
                                        <span class="eye eye-icon"><i class="fa-solid fa-eye"></i></span>
                                        <span class="eye eye-slash"><i class="fa-solid fa-eye-slash"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row g-4 mt-3">
                            <div class="col-sm-12">
                                <button type="submit" class="btn btn-primary w-100 sign-in-btn">{{ localize('Sign Up') }}</button>
                            </div>

                        </div>
                        <p class="mb-0 fs-xs mt-4">{{ localize('Already have an Account?') }} <a
                                href="{{ route('login') }}">{{ localize('Sign In') }}</a></p>
                    </form>
                </div>
            </div>
        </div>
    </section>
@endsection

@section('scripts')
    <script>
        "use strict";

//         function is_valid(phone) {
//     var apiKey = '8fba9eb7';
//     var apiSecret = 'eDGtmXg7mq9fhj17';
//     var endpoint = `https://api.nexmo.com/ni/advanced/json?api_key=${apiKey}&api_secret=${apiSecret}&number=${phone}`;

//     return fetch(endpoint)
//         .then(response => {
//             if (response.ok) {
//                 return response.json();
//             } else {
//                 throw new Error('Request failed');
//             }
//         })
//         .then(data => {
//             if (data.valid_number === 'valid') {
//                 return 'number is valid';
//             } else {
//                 return 'number is not valid';
//             }
//         })
//         .catch(error => {
//             console.error(error);
//             return false;
//         });
// }

        document.getElementById('login-form').addEventListener('submit', function(event) {
            
                // Phone number is valid, disable the submit button
                document.querySelector('.sign-in-btn').disabled = true;
        
        });
    </script>
@endsection
