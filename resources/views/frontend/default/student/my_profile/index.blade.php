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
                                <li class="bn-breadcrumb-item"><a href="#">{{ get_phrase('ফিরে যাও') }}</a></li>
                                <li class="bn-breadcrumb-item active" aria-current="page">{{ get_phrase('প্রোফাইল') }}</li>
                            </ul>
                        </nav>
                        <h1 class="man-title-36px mb-12px">{{ get_phrase('প্রোফাইল') }}</h1>
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
                                            <a href="#" class="profile-input-label" onclick="ajaxModal('{{ route('modal', ['frontend.default.upload_profile_pic', 'id' => auth()->user()->id]) }}', '{{ get_phrase('Upload picture') }}')">
                                                <img src="{{ get_image(auth()->user()->photo) }}" alt="profile">
                                            </a>
                                        </div>
                                    </label>
                                    <input class="form-control" type="file" id="formFile" hidden>
                                </div>
                                <div>
                                    <h4 class="mb-1 hs-title-18px fw-semibold">{{ get_phrase('প্রোফাইল ফটো আপডেট করুন') }}</h4>
                                    <p class="hs-subtitle-14px bn-text-body">
                                        {{ get_phrase(' আপনার প্রোফাইল ফটো এবং ব্যক্তিগত বিবরণ আপডেট করুন') }}
                                    </p>
                                </div>
                            </div>

                            <div class="row">
                                <div class="mb-20px">
                                    <label for="full-name" class="form-label bn-form-label">{{ get_phrase('আপনার সম্পূর্ণ') }}নাম</label>
                                    <input type="text" class="form-control bn-form-control" id="full-name" name="name" value="{{ $user_details->name }}" placeholder="{{ get_phrase('সম্পূর্ণ নাম') }}">
                                </div>


                                <div class="col-md-6">
                                    <div class="mb-20px">
                                        <label for="number" class="form-label bn-form-label">{{ get_phrase('প্রাইমারী মোবাইল নাম্বার') }}</label>
                                        <input type="number" class="form-control bn-form-control" id="number" name="phone" value="{{ $user_details->phone }}" placeholder="{{ get_phrase('প্রাইমারী নাম্বার') }}">
                                    </div>
                                </div>


                                <div class="col-md-6">
                                    <div class="mb-20px">
                                        <label for="email" class="form-label bn-form-label">{{ get_phrase('আপনার ইমেইল ঠিকানা') }}</label>
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
                                    <label for="textarea" class="form-label bn-form-label">{{ get_phrase('আপনার সম্পর্কে একটি সংক্ষিপ্ত বর্ণনা লিখুন') }}</label>
                                    <textarea class="form-control bn-form-control" name="biography" id="textarea" placeholder="{{ get_phrase('আপনার সম্পর্কে একটি সংক্ষিপ্ত বর্ণনা লিখুন') }}">{{ $user_details->biography }}</textarea>
                                </div>
                            </div>


                            <button type="submit" class="btn bn-btn-skin py-2">{{ get_phrase('আপডেট করুন') }}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!------------ My profile area start  ------------>
    <section class="course-content">
        <div class="profile-banner-area"></div>
        <div class="container profile-banner-area-container">
            <div class="row">
                @include('frontend.default.student.left_sidebar')
                <div class="col-lg-9">
                    <h4 class="g-title mb-5">{{ get_phrase('Personal Information') }}</h4>
                    <div class="my-panel message-panel edit_profile">
                        <form action="{{ route('update.profile', $user_details->id) }}" method="POST">@csrf
                            <div class="row">
                                <div class="col-lg-12 mb-20">
                                    <div class="form-group">
                                        <label for="name" class="form-label">{{ get_phrase('Full Name') }}</label>
                                        <input type="text" class="form-control" name="name" value="{{ $user_details->name }}" id="name">
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-20">
                                    <div class="form-group">
                                        <label for="email" class="form-label">{{ get_phrase('Email Address') }}</label>
                                        <input type="email" class="form-control" name="email" value="{{ $user_details->email }}" id="email">
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-20">
                                    <div class="form-group">
                                        <label for="phone" class="form-label">{{ get_phrase('Phone Number') }}</label>
                                        <input type="tel" class="form-control" name="phone" value="{{ $user_details->phone }}" id="phone">
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-20">
                                    <div class="form-group">
                                        <label for="website" class="form-label">{{ get_phrase('Website') }}</label>
                                        <input type="text" class="form-control" name="website" value="{{ $user_details->website }}" id="website">
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-20">
                                    <div class="form-group">
                                        <label for="facebook" class="form-label">{{ get_phrase('Facebook') }}</label>
                                        <input type="text" class="form-control" name="facebook" value="{{ $user_details->facebook }}" id="facebook">
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-20">
                                    <div class="form-group">
                                        <label for="twitter" class="form-label">{{ get_phrase('Twitter') }}</label>
                                        <input type="text" class="form-control" name="twitter" value="{{ $user_details->twitter }}" id="twitter">
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-20">
                                    <div class="form-group">
                                        <label for="linkedin" class="form-label">{{ get_phrase('Linkedin') }}</label>
                                        <input type="text" class="form-control" name="linkedin" value="{{ $user_details->linkedin }}" id="linkedin">
                                    </div>
                                </div>
                                <div class="col-lg-12 mb-20">
                                    <div class="form-group">
                                        <label for="skills" class="form-label">{{ get_phrase('Skills') }}</label>
                                        <input type="text" class="form-control tagify" name="skills" data-role="tagsinput" value="{{ $user_details->skills }}" id="skills">
                                    </div>
                                </div>
                                <div class="col-lg-12 mb-20">
                                    <div class="form-group">
                                        <label for="biography" class="form-label">{{ get_phrase('Biography') }}</label>
                                        <textarea name="biography" class="form-control" id="biography" cols="30" rows="5">{{ $user_details->biography }}</textarea>
                                    </div>
                                </div>
                            </div>
                            <button class="eBtn btn gradient mt-10">{{ get_phrase('Save Changes') }}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!------------ My profile area end  ------------>
@endsection