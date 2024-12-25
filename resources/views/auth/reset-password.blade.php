@extends('layouts.' . get_frontend_settings('theme'))
@push('title', get_phrase('Forget Password'))
@push('meta')@endpush
@push('css')
@endpush
@section('content')
    <section class="pt-40">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-7 col-md-6 col-sm-12 col-12">
                    <div class="sing-up-img">
                        <img src="{{ asset('assets/frontend/images/login-image.png') }}" alt="" />
                    </div>
                </div>
                <div class="col-lg-5 col-md-6 col-sm-12 col-12">
                    <div class="sing-up-right forget-pass">
                        <h3 class="fz-34 fw-700 lh-50 text-1e293b pb-16">{{ get_phrase('Forget Password') }}</h3>
                        <p class="fz-16 fw-400 lh-30 text-6e798a pb-50">
                            {{ get_phrase('See your growth and get consulting support !') }}</p>
                        <form action="{{ route('password.store') }}" method="post">
                            @csrf
                            <input type="hidden" name="token" value="{{ $request->route('token') }}">
                            <div class="pb-30">
                                <label for="signLogEmail" class="lsForm-label">{{ get_phrase('Your Email') }}</label>
                                <div class="form-icons">
                                    <div class="left"><img src="{{ asset('assets/frontend/images/icon/form-email.svg') }}" alt="" />
                                    </div>
                                    <input type="email" name="email" :value="old('email', $request - > email)" required class="form-control lsForm-control signLog-input" id="email" placeholder="{{ get_phrase('Your Email') }}" />
                                </div>
                            </div>
                            <div class="pb-30">
                                <label for="signLogEmail" class="lsForm-label">{{ get_phrase('Password') }}</label>
                                <div class="form-icons">
                                    <div class="left"><img src="{{ asset('assets/frontend/images/icon/form-key.svg') }}" alt="" />
                                    </div>
                                    <input type="password" name="password" required class="form-control lsForm-control signLog-input" id="password" placeholder="{{ get_phrase('Password') }}" />
                                </div>
                            </div>
                            <div class="pb-30">
                                <label for="signLogEmail" class="lsForm-label">{{ get_phrase('Confirm Password') }}</label>
                                <div class="form-icons">
                                    <div class="left"><img src="{{ asset('assets/frontend/images/icon/form-key.svg') }}" alt="" />
                                    </div>
                                    <input type="password" name="password_confirmation" required autocomplete="new-password" required class="form-control lsForm-control signLog-input" id="password_confirmation" placeholder="{{ get_phrase('Confirm Password') }}" />
                                </div>
                            </div>
                            <button type="submit" class="p-16 bg-754ffe bd-r-10 d-flex justify-content-center align-items-center fz-16 fw-600 lh-15 text-white border-0 w-100">{{ get_phrase('Send') }}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
@push('js')@endpush
