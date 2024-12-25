@extends('layouts.default')
@push('title', get_phrase('Courses Details'))

@section('content')
    @php
        $instructor_review = App\Models\Instructor_review::where('instructor_id', get_course_creator_id($course_details->id)->id)
            ->orderBy('id', 'DESC')
            ->get();

        $review = App\Models\Review::where('course_id', $course_details->id)
            ->orderBy('id', 'DESC')
            ->get();

        $total = $review->count();
        $rating = array_sum(array_column($review->toArray(), 'rating'));

        $average_rating = 0;
        if ($total != 0) {
            $average_rating = $rating / $total;
        }
        $instructor_ids = json_decode($course_details->instructors, true) ?? [];
        $instructors = !empty($instructor_ids) ? \App\Models\User::whereIn('id', $instructor_ids)->get() : collect();

        $faqs = $course_details->faqs ? json_decode($course_details->faqs, true) : [];

        $reviews = App\Models\Review::join('users', 'reviews.user_id', '=', 'users.id')
            ->select('reviews.*', 'reviews.user_id as reviewer_id', 'users.name as reviewer_name', 'users.email as reviewer_email', 'users.photo as reviewer_photo')
            ->where('reviews.course_id', $course_details->id)
            ->where('reviews.review_type', 'course')
            ->latest('id')
            ->paginate(15);

    @endphp

    <section class="breadcrumb-section breadcrumb-height">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-7 col-xl-8">
                    <div class="me-0 me-xl-3">
                        <div>
                            <nav aria-label="bn-breadcrumb" class="mb-20px">
                                <ul class="bn-breadcrumb">
                                    <li class="bn-breadcrumb-item"><a href="{{ route('home') }}">{{ get_phrase('ফিরে যাও') }}</a></li>
                                    <li class="bn-breadcrumb-item active" aria-current="page">{{ $course_details->title }}</li>
                                </ul>
                            </nav>
                            <h1 class="man-title-36px mb-12px">{{ $course_details->title }}</h1>
                            <p class="hs-subtitle-16px">{{ $course_details->short_description }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section>
        <div class="container">
            <div class="row g-4 mb-80px">
                <div class="col-lg-7 col-xl-8">
                    <div class="me-0 me-xl-3">
                        <div class="mt-40px">

                            <div class="course-tab sticky-top bg-white flex-wrap mb-20px py-3" id="pills-tab">
                                <a href="#study-plan" class="btn btn-yellow">{{ get_phrase('কোর্স সম্পর্কে বিস্তারিত') }}</a>
                                <a href="#instructor-details" class="btn btn-yellow">{{ get_phrase('ইন্সট্রাক্টর') }}</a>
                                <a href="#faq" class="btn btn-yellow">{{ get_phrase('সচরাচর জিজ্ঞাসা') }}</a>
                                <a href="#reviews" class="btn btn-yellow">{{ get_phrase('শিক্ষার্থীরা যা বলছে') }}</a>
                            </div>

                            <div class="course-details-sections">
                                <div class="mb-5" id="study-plan">
                                    <div>
                                        <h4 class="hs-title-20px mb-12px fw-bold">{{ get_phrase('স্টাডি প্ল্যান') }}</h4>
                                        @if ($sections->count() > 0)
                                            @foreach ($sections as $key => $section)
                                                <div class="accordion-item bn-accordion-item">
                                                    <h2 class="accordion-header bn-accordion-header">
                                                        <button class="accordion-button bn-accordion-button @if ($key > 0) collapsed @endif" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_{{ $section->id }}"
                                                            aria-expanded="@if ($key == 0) true @else false @endif" aria-controls="collapse_{{ $section->id }}">
                                                            {{ ucfirst($section->title) }}
                                                        </button>
                                                    </h2>


                                                    <div id="collapse_{{ $section->id }}" class="accordion-collapse collapse @if ($key == 0) show @endif" data-bs-parent="#accordionThree">
                                                        <div class="accordion-body bn-accordion-body">
                                                            <ul class="d-flex flex-column gap-3">
                                                                @php
                                                                    $lessons = DB::table('lessons')
                                                                        ->where('section_id', $section->id)
                                                                        ->get();
                                                                @endphp

                                                                @foreach ($lessons as $lesson)
                                                                    <li class="dashed-list-item">{{ ucfirst($lesson->title) }}</li>
                                                                @endforeach

                                                                @if (count($lessons) == 0)
                                                                    <li class="text-center">{{ get_phrase('Section is empty') }}</li>
                                                                @endif
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                        @else
                                            <p class="text-center">{{ get_phrase('Course curriculum Empty') }}</p>
                                        @endif
                                    </div>
                                </div>


                                <div class="mb-5" id="instructor-details">
                                    <h4 class="hs-title-20px mb-12px fw-bold">{{ get_phrase('ইন্সট্রাক্টর') }}</h4>

                                    @if ($instructors && $instructors->isNotEmpty())
                                        @foreach ($instructors as $instructor)
                                            <div class="bordered-card">
                                                <div class="d-flex gap-4 flex-wrap">
                                                    <div class="instructor-single d-flex gap-12px">
                                                        <div class="image-wrap-80px">
                                                            <img src="{{ get_image($instructor->photo) }}" alt="instructor">
                                                        </div>
                                                        <div>
                                                            <h5 class="hs2-title-18px fw-bold bn-text-dark mb-2">{{ ucfirst($instructor->name) }}</h5>
                                                            <p class="man-subtitle-16px">
                                                                {{ $instructor->skills ? implode(', ', array_column(json_decode($instructor->skills, true), 'value')) : '' }}
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    @else
                                        <p>{{ get_phrase('Empty') }}</p>
                                    @endif
                                </div>


                                <div class="mb-5" id="faq">
                                    <h4 class="hs-title-20px mb-12px fw-bold">{{ get_phrase('সচরাচর জিজ্ঞাসা') }}</h4>
                                    @if (count($faqs) > 0)
                                        @foreach ($faqs as $key => $faq)
                                            <div class="accordion bn-accordion accordion-spacing" id="accordionThree_{{ $key }}">
                                                <div class="accordion-item bn-accordion-item">
                                                    <h2 class="accordion-header bn-accordion-header">
                                                        <button class="accordion-button bn-accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne3_{{ $key }}" aria-expanded="false" aria-controls="collapseOne3_{{ $key }}">
                                                            {{ ucfirst($faq['title'] ?? '') }}
                                                        </button>
                                                    </h2>
                                                    <div id="collapseOne3_{{ $key }}" class="accordion-collapse collapse" data-bs-parent="#accordionThree_{{ $key }}">
                                                        <div class="accordion-body bn-accordion-body">
                                                            <ul class="d-flex flex-column gap-3">
                                                                <li class="dashed-list-item">{{ ucfirst($faq['description'] ?? '') }}</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    @else
                                        <p class="text-center">{{ get_phrase('FAQ area empty') }}</p>
                                    @endif
                                </div>


                                <div class="mb-5" id="reviews">
                                    <h4 class="hs-title-20px mb-12px fw-bold">{{ get_phrase('শিক্ষার্থীরা যা বলছে') }}</h4>

                                    <div class="d-flex flex-column gap-12px mb-32px">
                                        <div>
                                            <form action="{{ route('review.store') }}" method="POST">
                                                @csrf
                                                <div class="mb-20px write-review">
                                                    <div class="d-flex flex-wrap justify-content-between align-items-center mb-2">
                                                        <p class="description">{{ get_phrase('Rate this course : ') }}</p>
                                                        <div class="d-flex flex-wrap align-items-center justify-content-end gap-4">
                                                            <ul class="d-flex gap-1 rating-stars">
                                                                @for ($i = 1; $i <= 5; $i++)
                                                                    <li>
                                                                        <i class="fa-regular fa-star rating-star star-icon" id="id-{{ $i }}"></i>
                                                                    </li>
                                                                @endfor
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="rating" value="0">
                                                    <input type="hidden" name="course_id" value="{{ $course_details->id }}">
                                                    <textarea type="text" name="review" class="form-control bn-form-control" id="phone-or-email" placeholder="{{ get_phrase('মন্তব্য লিখুন..') }}"></textarea>
                                                    <input type="submit" class="btn bn-btn-skin py-2 px-2 px-sm-3 px-md-4 text-nowrap w-100 mt-2">
                                                </div>
                                            </form>
                                        </div>
                                        @foreach ($reviews as $review)
                                            <div class="bordered-card d-flex justify-content-between" id="review-{{ $review->id }}">
                                                <div>
                                                    <div class="d-flex ins-designation mb-1">
                                                        <ul class="d-flex re-star">
                                                            @for ($i = 0; $i < 5; $i++)
                                                                <li>
                                                                    <i class="@if ($i < $review->rating) fa fa-star star-icon @else fa-regular fa-star @endif "></i>
                                                                </li>
                                                            @endfor
                                                        </ul>
                                                    </div>
                                                    <h5 class="hs-subtitle-16px fw-medium mb-2">{{ $review->reviewer_name }}</h5>
                                                    <p class="hs-subtitle-16px">{{ $review->review }}</p>
                                                </div>
                                                <div class="ins-right flex-column align-items-end">
                                                    @auth
                                                        @php
                                                            $status = App\Models\LikeDislikeReview::where('review_id', $review->id)
                                                                ->where('user_id', auth()->user()->id)
                                                                ->first();
                                                        @endphp

                                                        <div class="action ">
                                                            <a onclick="ajaxModal('{{ route('modal', ['frontend.default.course.review_edit', 'id' => $review]) }}', '{{ get_phrase('Add new category') }}')" class="" href="javascript: void(0);">{{ get_phrase('Edit') }}</a>
                                                            <a onclick="confirmModal('{{ route('review.delete', $review->id) }}')" class="@isset($status->disliked) active @endisset" data-bs-toggle="tooltip" title="{{ get_phrase('Delete') }}"
                                                                href="javascript: void(0);">{{ get_phrase('Delete') }}</a>
                                                        </div>
                                                    @endauth
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                    {{ $reviews->links() }}
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-lg-5 col-xl-4">
                    <div class="cd-sidebar cd-sidebar-margin sticky-top-48">
                        <div class="cd-sidebar-image">
                            <img src="{{ get_image($course_details->thumbnail) }}" alt="banner">
                        </div>
                        <div class="p-20px">
                            <div class="d-flex align-items-center gap-2 flex-wrap mb-12px">
                                @if (isset($course_details->discount_flag) && $course_details->discount_flag == 1 && $course_details->discounted_price < $course_details->price)
                                    <h5 class="hs2-title-24px">{{ currency(number_format($course_details->price, 2)) }}</h5>
                                    <del>{{ currency(number_format($course_details->discounted_price, 2)) }}</del>
                                @elseif (isset($course_details->is_paid) && $course_details->is_paid == 0)
                                    <h5 class="hs2-title-24px bn-text-success">{{ get_phrase('সম্পূর্ণ ফ্রী') }}</h5>
                                @else
                                    <h5 class="hs2-title-24px">{{ currency(number_format($course_details->price, 2)) }}</h5>
                                @endif
                            </div>

                            @php
                                if (isset(auth()->user()->id)) {
                                    $is_enrolled = DB::table('enrollments')
                                        ->where('user_id', auth()->user()->id)
                                        ->where('course_id', $course_details->id)
                                        ->exists();

                                    $in_cart = DB::table('cart_items')
                                        ->where('user_id', auth()->user()->id)
                                        ->where('course_id', $course_details->id)
                                        ->exists();

                                    $in_wishlist = DB::table('wishlists')
                                        ->where('user_id', auth()->user()->id)
                                        ->where('course_id', $course_details->id)
                                        ->exists();

                                    $pending_course_for_payment = DB::table('offline_payments')
                                        ->where('user_id', auth()->user()->id)
                                        ->where('status', 0)
                                        ->first();

                                    $pending_course = $pending_course_for_payment ? json_decode($pending_course_for_payment->items, true) : [];
                                }
                            @endphp

                            @if (isset(auth()->user()->id))
                                @if (in_array($course_details->id, $pending_course))
                                    <a href="javascript::void(0);" class="btn bn-btn-skin w-100 mb-12px">{{ get_phrase('In progress') }}</a>
                                @else
                                    @if ($is_enrolled)
                                        <a href="{{ route('my.courses') }}" class="btn bn-btn-skin w-100 mb-12px">{{ get_phrase('Start Now') }}</a>
                                    @else
                                        <a href="{{ route('purchase.course', $course_details->id) }}" class="btn bn-btn-skin w-100 mb-12px">
                                            {{ get_phrase($course_details->is_paid ? 'Buy Now' : 'Enroll Now') }}
                                        </a>
                                    @endif
                                @endif
                            @else
                                <a href="{{ route('purchase.course', $course_details->id) }}" class="btn bn-btn-skin w-100 mb-12px">
                                    {{ get_phrase($course_details->is_paid ? 'Buy Now' : 'Enroll Now') }}
                                </a>
                            @endif


                            <h4 class="hs2-title-18px fw-bold bn-text-dark mb-12px">{{ get_phrase('এই কোর্সে যা থাকছে') }}</h4>
                            <ul class="d-flex flex-column gap-2">
                                <li class="d-flex gap-2 hs-subtitle-16px bn-text-body align-items-start">
                                    <img class="mt-2px" src="{{ asset('assets/frontend/default/images/icon/user-octagon-gray-20.svg') }}" alt="icon">
                                    <span>{{ get_phrase('কোর্সটি করছেন') }}</span> {{ total_enroll($course_details->id) }}
                                    <span>{{ get_phrase('জন') }} </span>
                                </li>
                                <li class="d-flex gap-2 hs-subtitle-16px bn-text-body align-items-start">
                                    <img class="mt-2px" src="{{ asset('assets/frontend/default/images/icon/clock-gray-20.svg') }}" alt="icon">
                                    <span> {{ total_durations($course_details->id) }} {{ get_phrase('ঘণ্টার ভিডিও লেসন') }}</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('js')
    <script>
        $(document).ready(function() {
            $('.course-tab a').on('click', function() {
                $(this).addClass('active').siblings().removeClass('active');
            });
        });
    </script>
@endpush
