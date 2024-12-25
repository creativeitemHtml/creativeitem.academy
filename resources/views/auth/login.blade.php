@extends('layouts.default')
@push('title', get_phrase('Login'))
{{-- @push('meta')@endpush --}}
{{-- @push('css')@endpush --}}
@section('content')
    <!-- Start Form Area  -->
    <section class="login-signup-section">
        <div class="container">
            <div class="row g-4 align-items-center justify-content-between">
                <div class="col-md-6 col-lg-6">
                    <div class="login-signup-banner">
                        <img src="{{ asset('assets/frontend/default/images/img/login-banner-1.svg') }}" alt="banner">
                    </div>
                </div>
                <div class="col-md-6 col-lg-5">
                    <div>
                        <h1 class="hs-title-36px mb-12px">লগ ইন করুন</h1>
                        <p class="hs-subtitle-16px mb-32px">শিখুন ওয়েব এবং অ্যাপ ডেভেলপমেন্ট, টেক-ক্যারিয়ার গড়ুন এখনই।</p>
                        <form action="{{ route('login') }}" method="post">
                            @csrf
                            <div class="mb-20px">
                                <label for="phone-or-email" class="form-label bn-form-label">ফোন নম্বর বা ইমেইল
                                    দিন</label>
                                <input type="text" class="form-control bn-form-control" id="phone-or-email email" name="email" placeholder="ফোন নম্বর বা ইমেইল দিন">
                            </div>
                            <div class="mb-20px">
                                <div class="mb-2">
                                    <label for="password1" class="form-label bn-form-label">পাসওয়ার্ড দিন</label>
                                    <div class="input-password-wrap">
                                        <div class="password-icons lock toggle-password" toggle=".password-field1">
                                            <img class="eye-unlock" src="{{ asset('assets/frontend/default/images/icon/eye-gray-20.svg') }}" alt="">
                                            <img class="eye-lock" src="{{ asset('assets/frontend/default/images/icon/eye-slash-gray-16') }}.svg" alt="">
                                        </div>
                                        <input type="password" id="password1" class="form-control bn-form-control password-field1" placeholder="পাসওয়ার্ড" name="password" aria-describedby="passwordHelpBlock">
                                    </div>
                                </div>
                                <div class="d-flex align-items-start justify-content-between gap-2">
                                    <div id="passwordHelpBlock" class="bn-form-text mt-0">
                                        কমপক্ষে 6 টি অক্ষর ব্যবহার করুন
                                    </div>
                                    <a href="{{ route('password.request') }}" class="bn-link-underline-12px">পাসওয়ার্ড ভুলে
                                        গেছেন‌</a>
                                </div>
                            </div>
                            <button type="submit" class="btn bn-btn-skin py-2 w-100 mb-3">লগ ইন করুন</button>
                            <div class="d-flex justify-content-center">
                                <a href="{{ route('register') }}" class="hs-subtitle-14px text-center bn-link fw-semibold">নতুন অ্যাকাউন্ট
                                    তৈরি করুন</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
<!-- End Form Area  -->
@push('js')

    <script>
        "use strict";

        $(document).ready(function() {
            $('.custom-btn').on('click', function(e) {
                e.preventDefault();

                var role = $(this).attr('id');
                if (role == 'admin') {
                    $('#email').val('admin@example.com');
                    $('#password').val('12345678');
                } else if (role == 'student') {
                    $('#email').val('student@example.com');
                    $('#password').val('12345678');
                } else {
                    $('#email').val('instructor@example.com');
                    $('#password').val('12345678');
                }
                $('#login').trigger('click');
            });
        });

        $(document).ready(function() {
            $('#showpassword').on('click', function(e) {
                e.preventDefault();
                const type = $('#password').attr('type');

                if (type == 'password') {
                    $('#password').attr('type', 'text');
                } else {
                    $('#password').attr('type', 'password');
                }
            });
        });
    </script>
@endpush
