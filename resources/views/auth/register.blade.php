@extends('layouts.default')
@push('title', get_phrase('Register'))
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
                        <h1 class="hs-title-36px mb-12px">অ্যাকাউন্ট তৈরি করুন</h1>
                        <p class="hs-subtitle-16px mb-32px">শিখুন ওয়েব এবং অ্যাপ ডেভেলপমেন্ট, টেক-ক্যারিয়ার গড়ুন এখনই।
                        </p>
                        <form action="{{ route('register') }}" method="post">
                            @csrf
                            <div class="mb-20px">
                                <label for="phone-or-email" class="form-label bn-form-label">আপনার নাম লিখুন</label>
                                <input type="text" class="form-control bn-form-control" name="name" id="phone-or-email" placeholder="আপনার নাম লিখুন">
                            </div>
                            @error('name')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                            <div class="mb-20px">
                                <label for="phone-or-email" class="form-label bn-form-label">ফোন নম্বর বা ইমেইল
                                    দিন</label>
                                <input type="text" class="form-control bn-form-control" name="email" id="phone-or-email" placeholder="ফোন নম্বর বা ইমেইল দিন">
                            </div>
                            @error('email')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                            <div class="mb-20px">
                                <div class="mb-2">
                                    <label for="password1" class="form-label bn-form-label">পাসওয়ার্ড দিন</label>
                                    <div class="input-password-wrap">
                                        <div class="password-icons lock toggle-password" toggle=".password-field1">
                                            <img class="eye-unlock" src="{{ asset('assets/frontend/default/images/icon/eye-gray-20.svg') }}" alt="">
                                            <img class="eye-lock" src="{{ asset('assets/frontend/default/images/icon/eye-slash-gray-16.svg') }}" alt="">
                                        </div>
                                        <input type="password" name="password" id="password" class="form-control bn-form-control password-field1" placeholder="পাসওয়ার্ড" aria-describedby="passwordHelpBlock">
                                    </div>

                                </div>
                                <div id="passwordHelpBlock" class="bn-form-text mt-0">
                                    কমপক্ষে 6 টি অক্ষর ব্যবহার করুন
                                </div>
                                @error('password')
                                    <small class="text-danger">{{ $message }}</small>
                                @enderror
                            </div>
                            <button type="submit" class="btn bn-btn-skin py-2 w-100 mb-3">অ্যাকাউন্ট তৈরি
                                করুন</button>
                            <div class="d-flex justify-content-center">
                                <p class="text-center hs-subtitle-14px fw-medium bn-text-body">অ্যাকাউন্ট আছে? <a href="{{ route('login') }}" class="bn-link-underline-14px">লগ ইন করুন</a></p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Form Area  -->
@endsection
