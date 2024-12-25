@extends('layouts.default')
@push('title', get_phrase('My courses'))

@section('content')
    <section class="breadcrumb-section mb-32px">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div>
                        <nav aria-label="bn-breadcrumb" class="mb-20px">
                            <ul class="bn-breadcrumb">
                                <li class="bn-breadcrumb-item"><a href="#">{{ get_phrase('ফিরে যাও') }}</a></li>
                                <li class="bn-breadcrumb-item active" aria-current="page">{{ get_phrase('আমার কোর্স') }}</li>
                            </ul>
                        </nav>
                        <h1 class="man-title-36px mb-12px">{{ get_phrase('আমার কোর্স') }}</h1>
                        <p class="hs-subtitle-16px">{{ get_phrase('শিখুন ওয়েব এবং অ্যাপ ডেভেলপমেন্ট, টেক-ক্যারিয়ার গড়ুন এখনই।') }}</p>
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
                <div class="col-lg-8 col-xl-9 ">

                    <div class="content-card mb-3">

                        <ul class="course-list-group">
                            @foreach ($my_courses as $course)
                                <li class="d-flex align-items-start flex-column flex-md-row gap-12px course-list-item hover-btn-outline-secondary">
                                    <a href="#" class="course-list-banner">
                                        <img src="{{ get_image($course->thumbnail) }}" alt="banner">
                                    </a>
                                    <div class="course-list-details">
                                        <div class="d-flex align-items-start justify-content-between gap-12px mb-3">
                                            <a href="#" class="man-title-16px">{{ ucfirst($course->title) }}</a>
                                            <div class="dropdown mt-2px">
                                                <button class="btn dropdown-toggle icon-dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M11.6667 4.16667C11.6667 3.25 10.9167 2.5 10.0001 2.5C9.08341 2.5 8.33341 3.25 8.33341 4.16667C8.33341 5.08333 9.08341 5.83333 10.0001 5.83333C10.9167 5.83333 11.6667 5.08333 11.6667 4.16667Z" stroke="#1A1C1F" stroke-width="1.25" />
                                                        <path d="M11.6667 15.8334C11.6667 14.9167 10.9167 14.1667 10.0001 14.1667C9.08341 14.1667 8.33341 14.9167 8.33341 15.8334C8.33341 16.7501 9.08341 17.5001 10.0001 17.5001C10.9167 17.5001 11.6667 16.7501 11.6667 15.8334Z" stroke="#1A1C1F"
                                                            stroke-width="1.25" />
                                                        <path d="M11.6667 9.99992C11.6667 9.08325 10.9167 8.33325 10.0001 8.33325C9.08341 8.33325 8.33341 9.08325 8.33341 9.99992C8.33341 10.9166 9.08341 11.6666 10.0001 11.6666C10.9167 11.6666 11.6667 10.9166 11.6667 9.99992Z" stroke="#1A1C1F"
                                                            stroke-width="1.25" />
                                                    </svg>
                                                </button>
                                                <ul class="dropdown-menu dropdown-menu-end bn-dropdown-menu">
                                                    <li><a class="dropdown-item bn-dropdown-item" href="{{ route('courses') }}">কোর্সসমূহ</a></li>
                                                    <li><a class="dropdown-item bn-dropdown-item" href="#">ফ্রি শিখুন</a></li>
                                                    <li>
                                                        <a class="dropdown-item bn-dropdown-item" href="#">
                                                            <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <path d="M9 16.5C13.125 16.5 16.5 13.125 16.5 9C16.5 4.875 13.125 1.5 9 1.5C4.875 1.5 1.5 4.875 1.5 9C1.5 13.125 4.875 16.5 9 16.5Z" stroke="#1A1C1F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                                                                <path d="M9 6V9.75" stroke="#1A1C1F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                                                                <path d="M8.99609 12H9.00283" stroke="#1A1C1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                                            </svg>
                                                            <span>সমস্যা</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <ul class="d-flex align-items-start column-gap-4 row-gap-3 flex-wrap mb-12px">
                                            <li class="d-flex align-items-start gap-2 hs-subtitle-14px bn-text-body">
                                                <img src="{{ asset('assets/frontend/default/images/icon/video-circle-gray-20.svg') }}" alt="icon">
                                                <span> {{ lesson_count($course->id) }} লেসন</span>
                                            </li>

                                            <li class="d-flex align-items-start gap-2 hs-subtitle-14px bn-text-body">
                                                <img src="{{ asset('assets/frontend/default/images/icon/task-square-gary-20.svg') }}" alt="icon">
                                                <span> {{ total_quiz_count($course->id) }} সেট কুইজ</span>
                                            </li>
                                            <li class="d-flex align-items-start gap-2 hs-subtitle-14px bn-text-body">
                                                <img src="{{ asset('assets/frontend/default/images/icon/clock-gray-20.svg') }}" alt="icon">
                                                <span>{{ total_durations($course->id) }}
                                                    {{ get_phrase('ঘণ্টার ভিডিও লেসন') }}</span>
                                            </li>
                                        </ul>
                                        <div class="mb-12px">
                                            <div class="bn-progress" data-skill="{{ progress_bar($course->course_id) }}">
                                            </div>
                                        </div>
                                        <div class="d-flex
                                                align-items-center gap-3 flex-wrap justify-content-between">
                                            <div class="d-flex align-items-center gap-2">
                                                <div class="image-circle-40px">
                                                    <img src="{{ get_image($course->user_photo) }}" alt="user">
                                                </div>
                                                <p class="hs-subtitle-14px fw-medium"><span class="bn-text-body">{{ $course->user_name }}</span></p>
                                            </div>


                                            @php
                                                $watch_history = App\Models\Watch_history::where('course_id', $course->course_id)
                                                    ->where('student_id', auth()->user()->id)
                                                    ->first();

                                                $lesson = App\Models\Lesson::where('course_id', $course->course_id)
                                                    ->orderBy('sort', 'asc')
                                                    ->first();

                                                if (!$watch_history && !$lesson) {
                                                    $url = route('course.player', ['slug' => $course->slug]);
                                                } else {
                                                    if ($watch_history) {
                                                        $lesson_id = $watch_history->watching_lesson_id;
                                                    } elseif ($lesson) {
                                                        $lesson_id = $lesson->id;
                                                    }
                                                    $url = route('course.player', [
                                                        'slug' => $course->slug,
                                                        'id' => $lesson_id,
                                                    ]);
                                                }

                                            @endphp
                                            <a href="{{ $url }}" class="btn bn-btn-outline-secondary min-w-180px py-2">
                                                <img src="{{ asset('assets/frontend/default/images/icon/video-circle-black-24.svg') }}" alt="icon">
                                                <span>{{ get_phrase('শুরু করুন') }}</span>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                            @endforeach
                        </ul>

                    </div>

                    @if ($my_courses->count() == 0)
                        <div class="row bg-white radius-10">
                            <div class="com-md-12">
                                @include('frontend.default.empty')
                            </div>
                        </div>
                    @endif
                </div>



            </div>
            @if (count($my_courses) > 0)
                <div class="entry-pagination">
                    <nav aria-label="Page navigation example">
                        {{ $my_courses->links() }}
                    </nav>
                </div>
            @endif
        </div>
    </section>

    {{-- <section class="my-course-content">
        <div class="profile-banner-area"></div>
        <div class="container profile-banner-area-container">
            <div class="row">
                @include('frontend.default.student.left_sidebar')

                <div class="col-lg-9 px-4">
                    <h4 class="g-title">{{ get_phrase('My Courses') }}</h4>
                    <div class="row mt-5">
                        @foreach ($my_courses as $course)
                            @php
                                $course_progress = progress_bar($course->course_id);
                            @endphp
                            <div class="col-lg-4 col-md-4 col-sm-6 mb-30">
                                <div class="card Ecard g-card c-card">
                                    <div class="card-head">
                                        <img src="{{ get_image($course->thumbnail) }}" alt="course-thumbnail">
                                    </div>
                                    <div class="card-body entry-details">
                                        <div class="info-card mb-15">
                                            <div class="creator">
                                                <img src="{{ get_image($course->user_photo) }}" alt="author-image">
                                                <h5>{{ $course->user_name }}</h5>
                                            </div>
                                        </div>
                                        <div class="entry-title">
                                            <a href="{{ route('course.details', $course->slug) }}">
                                                <h3 class="w-100 ellipsis-line-2">{{ ucfirst($course->title) }}</h3>
                                            </a>
                                        </div>
                                        <div class="single-progress">
                                            <div class="d-flex justify-content-between align-items-center mb-10">
                                                <h5>{{ get_phrase('Progress') }}</h5>
                                                <p>{{ $course_progress }}%</p>
                                            </div>
                                            <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                                <div class="progress-bar" style="width: {{ $course_progress }}%"></div>
                                            </div>
                                        </div>


                                        @php
                                            $watch_history = App\Models\Watch_history::where('course_id', $course->course_id)
                                                ->where('student_id', auth()->user()->id)
                                                ->first();

                                            $lesson = App\Models\Lesson::where('course_id', $course->course_id)
                                                ->orderBy('sort', 'asc')
                                                ->first();

                                            if (!$watch_history && !$lesson) {
                                                $url = route('course.player', ['slug' => $course->slug]);
                                            } else {
                                                if ($watch_history) {
                                                    $lesson_id = $watch_history->watching_lesson_id;
                                                } elseif ($lesson) {
                                                    $lesson_id = $lesson->id;
                                                }
                                                $url = route('course.player', ['slug' => $course->slug, 'id' => $lesson_id]);
                                            }

                                        @endphp
                                        @if ($course_progress > 0)
                                            <a href="{{ $url }}" class="eBtn learn-btn w-100 text-center mt-20 f-500">
                                                {{ get_phrase('Continue') }}
                                            </a>
                                        @else
                                            <a href="{{ $url }}" class="eBtn learn-btn w-100 text-center mt-20 f-500">
                                                {{ get_phrase('Start Now') }}
                                            </a>
                                        @endif

                                    </div>
                                </div>
                            </div>
                        @endforeach
                        @if ($my_courses->count() == 0)
                            @include('frontend.default.empty')
                        @endif
                    </div>
                </div>
            </div>

            @if (count($my_courses) > 0)
                <div class="entry-pagination">
                    <nav aria-label="Page navigation example">
                        {{ $my_courses->links() }}
                    </nav>
                </div>
            @endif
        </div>
    </section> --}}
@endsection
