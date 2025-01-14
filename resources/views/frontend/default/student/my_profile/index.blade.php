@extends('layouts.default')
@push('title', get_phrase('My profile'))
@push('meta')@endpush
@push('css')@endpush
@section('content')
    <section class="breadcrumb-section mb-32px">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div>
                        <nav aria-label="bn-breadcrumb" class="mb-20px">
                            <ul class="bn-breadcrumb">
                                <li class="bn-breadcrumb-item"><a href="#">{{ get_phrase('Go Back') }}</a></li>
                                <li class="bn-breadcrumb-item active" aria-current="page">{{ get_phrase('Profile') }}</li>
                            </ul>
                        </nav>
                        <h1 class="man-title-36px mb-12px">{{ get_phrase('Profile') }}</h1>
                        <p class="hs-subtitle-16px">শিখুন ওয়েব এবং অ্যাপ ডেভেলপমেন্ট, টেক-ক্যারিয়ার গড়ুন এখনই।</p>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section>
        <div class="container">
            <div class="row gx-4 mb-80px">
                <div class="col-lg-4 col-xl-3 d-none d-lg-block">
                    @include('frontend.default.student.left_sidebar');
                </div>
                <div class="col-lg-8 col-xl-9">
                    <div class="content-card">
                        <form action="{{ route('update.profile', $user_details->id) }}" method="POST">@csrf
                            <div class="d-flex align-items-center gap-12px mb-20px">
                                <div>
                                    <label for="formFile" class="form-label">
                                        <div class="upload-new ">
                                            <a href="#" class="profile-input-label" onclick="ajaxModal('{{ route('modal', ['frontend.default.student.my_profile.upload_profile_pic', 'id' => auth()->user()->id]) }}', '{{ get_phrase('Upload picture') }}')">
                                                <img src="{{ get_image(auth()->user()->photo) }}" alt="profile">
                                            </a>
                                        </div>
                                    </label>
                                    <input class="form-control" type="file" id="formFile" hidden>
                                </div>
                                <div>
                                    <h4 class="mb-1 hs-title-18px fw-semibold">{{ $user_details->name }}</h4>
                                    <p class="hs-subtitle-14px bn-text-body">
                                        {{ get_phrase('Update profile information') }}
                                    </p>
                                </div>
                            </div>

                            <div class="row">
                                <div class="mb-20px">
                                    <label for="full-name" class="form-label bn-form-label">{{ get_phrase('Full Name') }}</label>
                                    <input type="text" class="form-control bn-form-control" id="full-name" name="name" value="{{ $user_details->name }}" placeholder="{{ get_phrase('সম্পূর্ণ নাম') }}">
                                </div>


                                <div class="col-md-6">
                                    <div class="mb-20px">
                                        <label for="number" class="form-label bn-form-label">{{ get_phrase('Mobile Number') }}</label>
                                        <input type="number" class="form-control bn-form-control" id="number" name="phone" value="{{ $user_details->phone }}" placeholder="{{ get_phrase('প্রাইমারী নাম্বার') }}">
                                    </div>
                                </div>


                                <div class="col-md-6">
                                    <div class="mb-20px">
                                        <label for="email" class="form-label bn-form-label">{{ get_phrase('Email Address') }}</label>
                                        <input type="email" class="form-control bn-form-control" id="email" name="email" value="{{ $user_details->email }}" placeholder="{{ get_phrase('ইমেইল ঠিকানা') }}">
                                    </div>
                                </div>


                                <div class="col-md-6">
                                    <div class="mb-20px">
                                        <label for="website" class="form-label bn-form-label">{{ get_phrase('Website') }}</label>
                                        <input type="text" class="form-control bn-form-control" id="website" name="website" value="{{ $user_details->website }}" placeholder="{{ get_phrase('Website') }}">
                                    </div>
                                </div>


                                <div class="col-md-6">
                                    <div class="mb-20px">
                                        <label for="facebook" class="form-label bn-form-label">{{ get_phrase('Facebook') }}</label>
                                        <input type="text" class="form-control bn-form-control" id="facebook" name="facebook" value="{{ $user_details->facebook }}" placeholder="{{ get_phrase('Facebook') }}">
                                    </div>
                                </div>


                                <div class="col-md-6">
                                    <div class="mb-20px">
                                        <label for="twitter" class="form-label bn-form-label">{{ get_phrase('Twitter') }}</label>
                                        <input type="text" class="form-control bn-form-control" id="twitter" name="twitter" value="{{ $user_details->twitter }}" placeholder="{{ get_phrase('Twitter') }}">
                                    </div>
                                </div>


                                <div class="col-md-6">
                                    <div class="mb-20px">
                                        <label for="linkedin" class="form-label bn-form-label">{{ get_phrase('Linkedin') }}</label>
                                        <input type="text" class="form-control bn-form-control" id="linkedin" name="linkedin" value="{{ $user_details->linkedin }}" placeholder="{{ get_phrase('Linkedin') }}">
                                    </div>
                                </div>


                                <div class="mb-20px">
                                    <label for="skills" class="form-label bn-form-label">{{ get_phrase('Skills') }}</label>
                                    <input type="text" class="form-control bn-form-control tagify p-0" id="skills" name="skills" data-role="tagsinput" value="{{ $user_details->skills }}">
                                </div>


                                <div class="mb-20px">
                                    <label for="textarea" class="form-label bn-form-label">{{ get_phrase('About You') }}</label>
                                    <textarea class="form-control bn-form-control" name="biography" id="textarea" placeholder="{{ get_phrase('About You') }}">{{ $user_details->biography }}</textarea>
                                </div>
                            </div>


                            <button type="submit" class="btn bn-btn-skin py-2">{{ get_phrase('Update') }}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
