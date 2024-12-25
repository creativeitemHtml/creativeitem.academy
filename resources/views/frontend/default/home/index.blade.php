@extends('layouts.default')
@push('title', get_phrase('Home'))
@push('meta')@endpush
@push('css')@endpush
@section('content')
    {{-- @php
        if (session('home')) {
            $builder = App\Models\Builder_page::where('id', session('home'))->firstOrNew();
        } else {
            $builder = App\Models\Builder_page::where('status', 1)->firstOrNew();
        }
    @endphp
    @if ($builder->is_permanent)
        @include('components.home_permanent_templates.' . $builder->identifier)
    @else
        @php $builder_files = $builder->html ? json_decode($builder->html, true) : []; @endphp
        @foreach ($builder_files as $builder_file_name)
            @include('components.home_made_by_builder.' . $builder_file_name)
        @endforeach
    @endif --}}

    @include('components.home_made_by_builder.header')
    <section class="overflow-x-hidden">
        <div class="container">
            <div class="row g-4 align-items-center mt-35px mb-100px">
                <div class="col-lg-6 order-2 order-lg-1">
                    <div>
                        <h1 class="hs-title-60px mb-20px"> {{ get_phrase('শেখার মাধ্যমে আপনার ক্যারিয়ার গড়ুন') }}</h1>
                        <p class="hs-subtitle-20px mb-32px">
                            {{ get_phrase('লার্নিং এর এই ইজি দুনিয়ায়, হাজারো অজুহাতে নিজের সফলতাকে
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        আটকে দিচ্ছেন নিজেই! সব অজুহাত ছাপিয়ে এখন ঘরে বসে স্কিল ডেভেলপ করুন দেশসেরা এক্সপার্টদের
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        কাছে।') }}
                        </p>
                        <a href="#" class="btn bn-btn-skin">
                            <span>{{ get_phrase('') }}ফ্রীতে ক্যারিয়ার গড়ুন</span>
                            <img src="{{ asset('assets/frontend/default/images/icon/arrow-right-black-24.svg') }}" alt="icon">
                        </a>
                    </div>
                </div>
                <div class="col-lg-6 order-1 order-lg-2">
                    <div class="hero-banner-wrap d-flex align-items-center justify-content-lg-end justify-content-center">
                        <div class="hero-banner">
                            <img src="{{ asset('assets/frontend/default/images/img/hero-banner.webp') }}" alt="banner">
                        </div>
                        <div class="total-active-students">
                            <ul class="rounded-img-group mb-2">
                                <li class="img-rounded-33px">
                                    <img src="{{ asset('assets/frontend/default/images/img/user-profile-sm1.svg') }}" alt="student">
                                </li>
                                <li class="img-rounded-33px">
                                    <img src="{{ asset('assets/frontend/default/images/img/user-profile-sm2.svg') }}" alt="student">
                                </li>
                                <li class="img-rounded-33px">
                                    <img src="{{ asset('assets/frontend/default/images/img/user-profile-sm3.svg') }}" alt="student">
                                </li>
                                <li class="img-rounded-33px">
                                    <img src="{{ asset('assets/frontend/default/images/img/user-profile-sm4.svg') }}" alt="student">
                                </li>
                                <li class="img-rounded-33px">
                                    <img src="{{ asset('assets/frontend/default/images/img/user-profile-sm5.svg') }}" alt="student">
                                </li>
                                <li class="img-rounded-33px">
                                    <img src="{{ asset('assets/frontend/default/images/img/user-profile-sm6.svg') }}" alt="student">
                                </li>
                            </ul>
                            <p class="ns-subtitle-13px">{{ get_phrase('') }}২৫০০+ একটিভ শিক্ষার্থী</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section>
        <div class="container">
            <div class="row mb-32px">
                <div class="col-12">
                    <div class="d-flex align-items-center column-gap-4 row-gap-3 justify-content-between flex-wrap">
                        <h1 class="hs-title-48px">{{ get_phrase('') }}স্কিল ডেভেলপমেন্ট হবে <span class="bn-text-skin">{{ get_phrase('') }}সম্পূর্ণ
                                ফ্রী</span></h1>
                        <a href="#" class="btn bn-btn-outline-skin">{{ get_phrase('') }}সবগুলো দেখুন</a>
                    </div>
                </div>
            </div>
            <div class="row g-4 mb-100px">
                <div class="col-md-6 col-lg-4">
                    <div class="md-card hover-card position-relative hover-btn-outline-secondary">
                        <a href="javascript:void(0)" class="md-card-link"></a>
                        <div class="md-card-image">
                            <img src="{{ asset('assets/frontend/default/images/img/lg-card-banner1.webp') }}" alt="banner">
                        </div>
                        <div class="md-card-body">
                            <h3 class="man-title-20px mb-2">{{ get_phrase('') }}UX Leadership: Strategy & Tactics of
                                Website Design</h3>
                            <div class="mb-3 d-flex align-items-center gap-2 flex-wrap">
                                <div class="sm-secondary-light-box d-flex align-items-center gap-2">
                                    <p class="hs-subtitle-14px">৫.০</p>
                                    <div class="d-flex align-items-center gap-1">
                                        <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-16.svg') }}" alt="star">
                                        <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-16.svg') }}" alt="star">
                                        <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-16.svg') }}" alt="star">
                                        <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-16.svg') }}" alt="star">
                                        <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-16.svg') }}" alt="star">
                                    </div>
                                </div>
                                <div class="sm-secondary-light-box d-flex align-items-center gap-2">
                                    <img src="{{ asset('assets/frontend/default/images/icon/user-octagon-black-20.svg') }}" alt="total-enroll">
                                    <p class="hs-subtitle-14px">{{ get_phrase('') }}৫৮৬৫ ইনরোল</p>
                                </div>
                            </div>
                            <p class="hs-subtitle-16px mb-3">{{ get_phrase('') }}ইফেক্টিভ এড রান করার জন্য শুরু থেকে যা
                                কিছু জানার প্রয়োজন
                                Customer journey map, Strategy, data analysis এবং Facebook marketing এর সকল টুলস
                                সম্বন্ধে জানতে পারবেন এই কোর্সে!</p>
                            <div class="d-flex align-items-center gap-3 justify-content-between flex-wrap">
                                <div class="d-flex align-items-center gap-1">
                                    <p class="hs2-title-18px line-through"><del>{{ get_phrase('') }}৳৫০০০</del></p>
                                    <p class="hs2-title-18px bn-text-success">{{ get_phrase('') }}সম্পূর্ণ ফ্রী</p>
                                </div>
                                <a href="#" class="btn bn-btn-outline-secondary py-2 position-relative">{{ get_phrase('') }}ইনরোল
                                    করুন</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="md-card hover-card position-relative hover-btn-outline-secondary">
                        <a href="javascript:void(0)" class="md-card-link"></a>
                        <div class="md-card-image">
                            <img src="{{ asset('assets/frontend/default/images/img/lg-card-banner2.webp') }}" alt="banner">
                        </div>
                        <div class="md-card-body">
                            <h3 class="man-title-20px mb-2">{{ get_phrase('') }}Web Development with PHP for website design
                            </h3>
                            <div class="mb-3 d-flex align-items-center gap-2 flex-wrap">
                                <div class="sm-secondary-light-box d-flex align-items-center gap-2">
                                    <p class="hs-subtitle-14px">৫.০</p>
                                    <div class="d-flex align-items-center gap-1">
                                        <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-16.svg') }}" alt="star">
                                        <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-16.svg') }}" alt="star">
                                        <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-16.svg') }}" alt="star">
                                        <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-16.svg') }}" alt="star">
                                        <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-16.svg') }}" alt="star">
                                    </div>
                                </div>
                                <div class="sm-secondary-light-box d-flex align-items-center gap-2">
                                    <img src="{{ asset('assets/frontend/default/images/icon/user-octagon-black-20.svg') }}" alt="total-enroll">
                                    <p class="hs-subtitle-14px">{{ get_phrase('') }}২৬৬৫ ইনরোল</p>
                                </div>
                            </div>
                            <p class="hs-subtitle-16px mb-3">{{ get_phrase('') }}ইফেক্টিভ এড রান করার জন্য শুরু থেকে যা
                                কিছু জানার প্রয়োজন
                                Customer journey map, Strategy, data analysis এবং Facebook marketing এর সকল টুলস
                                সম্বন্ধে জানতে পারবেন এই কোর্সে!</p>
                            <div class="d-flex align-items-center gap-3 justify-content-between flex-wrap">
                                <div class="d-flex align-items-center gap-1">
                                    <p class="hs2-title-18px line-through"><del>{{ get_phrase('') }}৳৮০০০</del></p>
                                    <p class="hs2-title-18px bn-text-success">{{ get_phrase('') }}সম্পূর্ণ ফ্রী</p>
                                </div>
                                <a href="#" class="btn bn-btn-outline-secondary py-2 position-relative">{{ get_phrase('') }}ইনরোল
                                    করুন</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="md-card hover-card position-relative hover-btn-outline-secondary">
                        <a href="javascript:void(0)" class="md-card-link"></a>
                        <div class="md-card-image">
                            <img src="{{ asset('assets/frontend/default/images/img/lg-card-banner3.webp') }}" alt="banner">
                        </div>
                        <div class="md-card-body">
                            <h3 class="man-title-20px mb-2">{{ get_phrase('') }}Fundamentals of Digital Marketing for
                                Beginners</h3>
                            <div class="mb-3 d-flex align-items-center gap-2 flex-wrap">
                                <div class="sm-secondary-light-box d-flex align-items-center gap-2">
                                    <p class="hs-subtitle-14px">৫.০</p>
                                    <div class="d-flex align-items-center gap-1">
                                        <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-16.svg') }}" alt="star">
                                        <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-16.svg') }}" alt="star">
                                        <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-16.svg') }}" alt="star">
                                        <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-16.svg') }}" alt="star">
                                        <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-16.svg') }}" alt="star">
                                    </div>
                                </div>
                                <div class="sm-secondary-light-box d-flex align-items-center gap-2">
                                    <img src="{{ asset('assets/frontend/default/images/icon/user-octagon-black-20.svg') }}" alt="total-enroll">
                                    <p class="hs-subtitle-14px">{{ get_phrase('') }}৭৫৬৫ ইনরোল</p>
                                </div>
                            </div>
                            <p class="hs-subtitle-16px mb-3">{{ get_phrase('') }}ইফেক্টিভ এড রান করার জন্য শুরু থেকে যা
                                কিছু জানার প্রয়োজন
                                Customer journey map, Strategy, data analysis এবং Facebook marketing এর সকল টুলস
                                সম্বন্ধে জানতে পারবেন এই কোর্সে!</p>
                            <div class="d-flex align-items-center gap-3 justify-content-between flex-wrap">
                                <div class="d-flex align-items-center gap-1">
                                    <p class="hs2-title-18px line-through"><del>{{ get_phrase('') }}৳৭০০০</del></p>
                                    <p class="hs2-title-18px bn-text-success">{{ get_phrase('') }}সম্পূর্ণ ফ্রী</p>
                                </div>
                                <a href="#" class="btn bn-btn-outline-secondary py-2 position-relative">{{ get_phrase('') }}ইনরোল
                                    করুন</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="dark-section mb-100px">
        <div class="container">
            <div class="row mb-32px">
                <div class="col-12">
                    <h1 class="hs-title-48px bn-text-skin text-center">{{ get_phrase('') }}ফ্রি ওয়েবিনার দেখুন</h1>
                </div>
            </div>
            <div class="row g-4 mb-52px">
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="sm-card position-relative hover-secondary-light-box max-sm-350px mx-auto mx-sm-0 hover-btn-outline-secondary">
                        <a href="javascript:void(0)" class="sm-card-link"></a>
                        <div class="sm-card-image">
                            <img src="{{ asset('assets/frontend/default/images/img/sm-card-banner1.webp') }} " alt="banner">
                        </div>
                        <div class="sm-card-body">
                            <div class="sm-secondary-light-box d-flex align-items-center gap-2 mb-2">
                                <img src="{{ asset('assets/frontend/default/images/icon/calendar-black-20.svg') }} " alt="calender">
                                <p class="hs-subtitle-14px">{{ get_phrase('') }}৭ জুলাই, রাত ৯:০০</p>
                            </div>
                            <h3 class="hs-title-18px mb-3">{{ get_phrase('') }}প্রোডাক্ট ম্যানেজার হবার প্রস্তুতি কীভাবে
                                শুরু করবো?</h3>
                            <a href="#" class="btn bn-btn-outline-secondary py-2 position-relative w-100">ইনরোল
                                করুন{{ get_phrase('') }}</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="sm-card position-relative hover-secondary-light-box max-sm-350px mx-auto mx-sm-0 hover-btn-outline-secondary">
                        <a href="javascript:void(0)" class="sm-card-link"></a>
                        <div class="sm-card-image">
                            <img src="{{ asset('assets/frontend/default/images/img/sm-card-banner4.webp') }} " alt="banner">
                        </div>
                        <div class="sm-card-body">
                            <div class="sm-secondary-light-box d-flex align-items-center gap-2 mb-2">
                                <img src="{{ asset('assets/frontend/default/images/icon/calendar-black-20.svg') }} " alt="calender">
                                <p class="hs-subtitle-14px"> {{ get_phrase('') }}২২ জুলাই, রাত ৯:০০</p>
                            </div>
                            <h3 class="hs-title-18px mb-3">{{ get_phrase('') }}ফ্লাটার শেখার ও মার্কেটপ্লেস থেকে ইনকাম
                                করার গাইডলাইন</h3>
                            <a href="#" class="btn bn-btn-outline-secondary py-2 position-relative w-100">ইনরোল
                                করুন</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="sm-card position-relative hover-secondary-light-box max-sm-350px mx-auto mx-sm-0 hover-btn-outline-secondary">
                        <a href="javascript:void(0)" class="sm-card-link"></a>
                        <div class="sm-card-image">
                            <img src="{{ asset('assets/frontend/default/images/img/sm-card-banner3.webp') }} " alt="banner">
                        </div>
                        <div class="sm-card-body">
                            <div class="sm-secondary-light-box d-flex align-items-center gap-2 mb-2">
                                <img src="{{ asset('assets/frontend/default/images/icon/calendar-black-20.svg') }} " alt="calender">
                                <p class="hs-subtitle-14px"> {{ get_phrase('') }}৫ জুলাই, রাত ৯:০০</p>
                            </div>
                            <h3 class="hs-title-18px mb-3">{{ get_phrase('') }}প্রোডাক্ট ম্যানেজার হবার প্রস্তুতি কীভাবে
                                শুরু করবো?</h3>
                            <a href="#" class="btn bn-btn-outline-secondary py-2 position-relative w-100">{{ get_phrase('') }}ইনরোল
                                করুন</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="sm-card position-relative hover-secondary-light-box max-sm-350px mx-auto mx-sm-0 hover-btn-outline-secondary">
                        <a href="javascript:void(0)" class="sm-card-link"></a>
                        <div class="sm-card-image">
                            <img src="{{ asset('assets/frontend/default/images/img/sm-card-banner4.webp') }} " alt="banner">
                        </div>
                        <div class="sm-card-body">
                            <div class="sm-secondary-light-box d-flex align-items-center gap-2 mb-2">
                                <img src="{{ asset('assets/frontend/default/images/icon/calendar-black-20.svg') }} " alt="calender">
                                <p class="hs-subtitle-14px">{{ get_phrase('২৮ জুলাই, রাত ৯:০০') }}</p>
                            </div>
                            <h3 class="hs-title-18px mb-3">ফ্লাটার শেখার ও মার্কেটপ্লেস থেকে ইনকাম করার গাইডলাইন</h3>
                            <a href="#" class="btn bn-btn-outline-secondary py-2 position-relative w-100">ইনরোল
                                করুন</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div>
                        <a href="#" class="btn bn-btn-outline-light mx-auto">{{ get_phrase('') }}সবগুলো দেখুন</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section>
        <div class="container">
            <div class="row g-4 justify-content-between mb-100px">
                <div class="col-lg-5 col-md-6">
                    <h2 class="hs-title-48px mb-20px">কি কি পাচ্ছেন আমাদের <span class="bn-text-skin">লাইভ
                            কোর্সে</span></h2>
                    <p class="hs-subtitle-20px">দেখে নিন কি কি পাচ্ছেন ক্রিয়েতিভআইটেম একাডেমী কোর্সে জয়েন করলে</p>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="secondary-card h-100">
                        <div class="sm-yellow-iconbox mb-3">
                            <img src="{{ asset('assets/frontend/default/images/icon/mirroring-screen-black-36.svg') }}" alt="icon">
                        </div>
                        <h3 class="hs-title-24px mb-12px">শিখুন ইন্ডাস্ট্রি এক্সপার্টদের থেকে লাইভে</h3>
                        <p class="hs-subtitle-18px">কোর্স কমপ্লিটে পাচ্ছেন জব প্লেসমেন্ট টিমের থেকে লাইফটাইম সিভি,
                            প্রোফাইল বিল্ড এবং জব এপ্লিকেশনসহ ইন্টেন্সিভ জব প্লেসমেন্ট সাপোর্ট।</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="secondary-card h-100">
                        <div class="sm-yellow-iconbox mb-3">
                            <img src="{{ asset('assets/frontend/default/images/icon/task-black-36.svg"') }}
                                alt="icon">
                        </div>
                        <h3 class="hs-title-24px mb-12px">মডিউল ভিত্তিক স্টাডি প্ল্যান</h3>
                        <p class="hs-subtitle-18px">কুইজ, এসাইনমেন্ট আর লাইভ এক্সাম দিয়ে সাজানো মডিউলভিত্তিক গোছানো
                            স্টাডিপ্ল্যানের সাথে ছিটকে পড়ার কোনো চান্সই নেই।</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="secondary-card h-100">
                        <div class="sm-yellow-iconbox mb-3">
                            <img src="{{ asset('assets/frontend/default/images/icon/like-shapes-black-36.svg') }}" alt="icon">
                        </div>
                        <h3 class="hs-title-24px mb-12px">ইন্টেন্সিভ জব প্লেসমেন্ট সাপোর্ট</h3>
                        <p class="hs-subtitle-18px">কোর্স কমপ্লিটে পাচ্ছেন জব প্লেসমেন্ট টিমের থেকে লাইফটাইম সিভি,
                            প্রোফাইল বিল্ড এবং জব এপ্লিকেশনসহ ইন্টেন্সিভ জব প্লেসমেন্ট সাপোর্ট।</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="secondary-card h-100">
                        <div class="sm-yellow-iconbox mb-3">
                            <img src="{{ asset('assets/frontend/default/images/icon/status-up-black-36.svg') }}" alt="icon">
                        </div>
                        <h3 class="hs-title-24px mb-12px">রিয়েলটাইম প্রোগ্রেস ট্র্যাকিং</h3>
                        <p class="hs-subtitle-18px">ট্র্যাক করুন আপনার প্রোগ্রেস রিয়েল টাইম, দেখে নিন লিডার বোর্ডে
                            আপনার পজিশন আর কম্পিটিশনে এগিয়ে যান সবার থেকে।</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="dark-section overflow-x-hidden mb-80px">
        <div class="container">
            <div class="row g-4 align-items-center">
                <div class="col-lg-6">
                    <h1 class="hs-title-48px text-white mb-32px">কেন ক্রিয়েতিভআইটেম একাডেমীতে <span class="bn-text-skin">কোর্স করবেন?</span></h1>
                    <p class="hs-subtitle-20px text-white mb-32px">বাংলাদেশের প্রথম ই-লার্নিং প্ল্যাটফর্ম যেখানে কোর্স
                        করেই ছেড়ে দেয়া হয় না; বরং, কোর্স করানোর পাশাপাশি লার্নারদের এসাইনমেন্ট দিয়ে সেই বিষয়ে দক্ষ করে
                        গড়ে তোলা হয়। কারণ ক্রিয়েতিভআইটেম একাডেমী বিশ্বাস করে স্কিল ছাড়া নলেজ মূল্যহীন।</p>
                    <p class="hs-subtitle-20px text-white mb-32px">এছাড়াও আমরা সকল শিক্ষার্থীদের মধ্যে একটা কমিউনিটি
                        তৈরি করে দেই যেটা পার্সোনাল এবং প্রফেশনাল লাইফে নিজেকে গ্রো করতে অভাবনিয় ভূমিকা রাখে।</p>
                    <a href="#" class="btn bn-btn-skin">
                        <span>যোগাযোগ করুন</span>
                        <img src="{{ asset('assets/frontend/default/images/icon/arrow-right-black-24.svg') }}" alt="icon">
                    </a>
                </div>
                <div class="col-lg-6">
                    <div class="video-outer-wrap">
                        <div class="video-player-wrap">
                            <div class="plyr__video-embed video-player">
                                <iframe src="https://www.youtube.com/embed/5YHAVhEJ9TM?si=GrmhAZyUahBciHUm" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1 class="hs-title-48px text-center">শিক্ষার্থীরা আমাদের <span class="bn-text-skin">সম্পর্কে কি
                            বলছে</span></h1>
                </div>
            </div>
        </div>
        <div class="slider-section overflow-x-hidden">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <!-- Swiper -->
                        <div class="swiper bn-slider slider-padding slider-shadow">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <div class="white-card h-100">
                                        <div class="d-flex align-items-center gap-1 mb-12px">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                        </div>
                                        <p class="hs-subtitle-18px mb-20px">অফলাইনে শেখার মত সময় হয়ে উঠছিল না তাই
                                            অনলাইন কোর্স কে বেছে নেওয়া । কোর্সটিতে খুব সুন্দর করে হরফ তানভীন মাদ পড়ানো
                                            হয়েছে । খুব সহজেই প্রতিদিন প্র্যাকটিস করে খুব দ্রুত শুদ্ধ তেলাওয়াত আয়ত্ত
                                            করতে পেরেছি।</p>
                                        <div class="d-flex gap-2">
                                            <div class="image-wrap-60px rounded-circle">
                                                <img class="rounded-circle" src="{{ asset('assets/frontend/default/images/img/user-sm-1.svg') }}" alt="user">
                                            </div>
                                            <div>
                                                <h5 class="hs-title-20px mb-1">তানিয়া ফারযানা</h5>
                                                <p class="hs-subtitle-18px">সফটওয়ার ডেভেলপার</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="white-card h-100">
                                        <div class="d-flex align-items-center gap-1 mb-12px">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                        </div>
                                        <p class="hs-subtitle-18px mb-20px">আমার একটি অনলাইন পেজ ছিল কিন্তু পেইজটিকে
                                            নিয়ে কিভাবে সামনে আগাবে কোন কিছু বুঝতে পারছিলাম না । কোর্সটি করার মাধ্যমে
                                            কিভাবে একটি বেসিক পোস্ট দিবো কিভাবে ইউজ করব কিভাবে কন্টাক্ট করবো শিখতে
                                            পেরেছি।</p>
                                        <div class="d-flex gap-2">
                                            <div class="image-wrap-60px rounded-circle">
                                                <img class="rounded-circle" src="{{ asset('assets/frontend/default/images/img/user-sm-2.svg') }}" alt="user">
                                            </div>
                                            <div>
                                                <h5 class="hs-title-20px mb-1">তানভীর আহমেদ</h5>
                                                <p class="hs-subtitle-18px">সফটওয়ার ডেভেলপার</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="white-card h-100">
                                        <div class="d-flex align-items-center gap-1 mb-12px">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                        </div>
                                        <p class="hs-subtitle-18px mb-20px">আমার একটি অনলাইন পেজ ছিল কিন্তু পেইজটিকে
                                            নিয়ে কিভাবে সামনে আগাবে কোন কিছু বুঝতে পারছিলাম না । কোর্সটি করার মাধ্যমে
                                            কিভাবে একটি বেসিক পোস্ট দিবো কিভাবে ইউজ করব কিভাবে কন্টাক্ট করবো শিখতে
                                            পেরেছি।</p>
                                        <div class="d-flex gap-2">
                                            <div class="image-wrap-60px rounded-circle">
                                                <img class="rounded-circle" src="{{ asset('assets/frontend/default/images/img/user-sm-3.svg') }}" alt="user">
                                            </div>
                                            <div>
                                                <h5 class="hs-title-20px mb-1">হাসিবুর রহমান</h5>
                                                <p class="hs-subtitle-18px">ডিজিটাল মার্কেটিং</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="white-card h-100">
                                        <div class="d-flex align-items-center gap-1 mb-12px">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                        </div>
                                        <p class="hs-subtitle-18px mb-20px">অফলাইনে শেখার মত সময় হয়ে উঠছিল না তাই
                                            অনলাইন কোর্স কে বেছে নেওয়া । কোর্সটিতে খুব সুন্দর করে হরফ তানভীন মাদ পড়ানো
                                            হয়েছে । খুব সহজেই প্রতিদিন প্র্যাকটিস করে খুব দ্রুত শুদ্ধ তেলাওয়াত আয়ত্ত
                                            করতে পেরেছি।</p>
                                        <div class="d-flex gap-2">
                                            <div class="image-wrap-60px rounded-circle">
                                                <img class="rounded-circle" src="{{ asset('assets/frontend/default/images/img/user-sm-1.svg') }}" alt="user">
                                            </div>
                                            <div>
                                                <h5 class="hs-title-20px mb-1">তানিয়া ফারযানা</h5>
                                                <p class="hs-subtitle-18px">সফটওয়ার ডেভেলপার</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="white-card h-100">
                                        <div class="d-flex align-items-center gap-1 mb-12px">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                        </div>
                                        <p class="hs-subtitle-18px mb-20px">আমার একটি অনলাইন পেজ ছিল কিন্তু পেইজটিকে
                                            নিয়ে কিভাবে সামনে আগাবে কোন কিছু বুঝতে পারছিলাম না । কোর্সটি করার মাধ্যমে
                                            কিভাবে একটি বেসিক পোস্ট দিবো কিভাবে ইউজ করব কিভাবে কন্টাক্ট করবো শিখতে
                                            পেরেছি।</p>
                                        <div class="d-flex gap-2">
                                            <div class="image-wrap-60px rounded-circle">
                                                <img class="rounded-circle" src="{{ asset('assets/frontend/default/images/img/user-sm-2.svg') }}" alt="user">
                                            </div>
                                            <div>
                                                <h5 class="hs-title-20px mb-1">তানভীর আহমেদ</h5>
                                                <p class="hs-subtitle-18px">সফটওয়ার ডেভেলপার</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="white-card h-100">
                                        <div class="d-flex align-items-center gap-1 mb-12px">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                            <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-24.svg') }}" alt="star">
                                        </div>
                                        <p class="hs-subtitle-18px mb-20px">আমার একটি অনলাইন পেজ ছিল কিন্তু পেইজটিকে
                                            নিয়ে কিভাবে সামনে আগাবে কোন কিছু বুঝতে পারছিলাম না । কোর্সটি করার মাধ্যমে
                                            কিভাবে একটি বেসিক পোস্ট দিবো কিভাবে ইউজ করব কিভাবে কন্টাক্ট করবো শিখতে
                                            পেরেছি।</p>
                                        <div class="d-flex gap-2">
                                            <div class="image-wrap-60px rounded-circle">
                                                <img class="rounded-circle" src="{{ asset('assets/frontend/default/images/img/user-sm-3.svg') }}" alt="user">
                                            </div>
                                            <div>
                                                <h5 class="hs-title-20px mb-1">হাসিবুর রহমান</h5>
                                                <p class="hs-subtitle-18px">ডিজিটাল মার্কেটিং</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
