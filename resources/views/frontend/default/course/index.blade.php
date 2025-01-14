@extends('layouts.default')
@push('title', get_phrase('Courses'))


@section('content')
    @php
        if (isset($course)) {
            $review = App\Models\Review::where('course_id', $course->id)
                ->orderBy('id', 'DESC')
                ->get();

            $total = $review->count();
            $rating = array_sum(array_column($review->toArray(), 'rating'));

            $average_rating = 0;
            if ($total != 0) {
                $average_rating = $rating / $total;
            }

            $wishlist = App\Models\Wishlist::where('user_id', auth()->user()->id ?? '')
                ->pluck('course_id')
                ->toArray();
        }
    @endphp

    <section class="breadcrumb-section breadcrumb-grid-padding">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div>
                        <nav aria-label="bn-breadcrumb" class="mb-20px">
                            <ul class="bn-breadcrumb">
                                <li class="bn-breadcrumb-item"><a href="{{ route('home') }}">{{ get_phrase('ফিরে যাও') }}</a></li>
                                <li class="bn-breadcrumb-item active" aria-current="page"><a href="#">{{ get_phrase('কোর্সসমূহ') }}</a></li>
                            </ul>
                        </nav>
                        <h1 class="man-title-36px mb-12px">{{ get_phrase('সকল কোর্সসমূহ') }}</h1>
                        <p class="hs-subtitle-16px">{{ get_phrase('শিখুন ওয়েব এবং অ্যাপ ডেভেলপমেন্ট, টেক-ক্যারিয়ার গড়ুন এখনই।') }}</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="course-grid-margin">
        <div class="container">
            <div class="row g-4 mb-80px">

                @if (count($courses) > 0)
                    @foreach ($courses as $course)
                        <div class="col-md-6 col-lg-4">
                            <div class="md-card hover-card position-relative hover-btn-outline-secondary">
                                <a href="{{ route('course.details', $course->slug) }}" class="md-card-link"></a>
                                <div class="md-card-image">
                                    <img src="{{ get_image($course->thumbnail) }}" alt="banner">
                                </div>
                                <div class="md-card-body">
                                    <h3 class="man-title-20px mb-2">{{ $course->title }}</h3>
                                    <div class="mb-3 d-flex align-items-center gap-2 flex-wrap">
                                        <div class="sm-secondary-light-box d-flex align-items-center gap-2">
                                            <p class="hs-subtitle-14px">{{ number_format($course->average_rating, 1) }}</p>
                                            <div class="d-flex align-items-center gap-1">
                                                @for ($i = 1; $i <= $course->average_rating; $i++)
                                                    <img src="{{ asset('assets/frontend/default/images/icon/star-yellow-16.svg') }}" alt="star">
                                                @endfor
                                            </div>
                                        </div>
                                        <div class="sm-secondary-light-box d-flex align-items-center gap-2">
                                            <img src="{{ asset('assets/frontend/default/images/icon/user-octagon-black-20') }}.svg" alt="total-enroll">
                                            <p class="hs-subtitle-14px">{{ total_enroll($course->id) }} {{ get_phrase('Enrolled') }}</p>
                                        </div>
                                    </div>
                                    <p class="hs-subtitle-16px mb-3 ellipsis-3">{{ $course->short_description }}</p>
                                    <div class="d-flex align-items-center gap-3 justify-content-between flex-wrap">
                                        <div class="d-flex align-items-center gap-1">
                                            <p class="hs2-title-18px line-through">
                                                @if ($course->is_paid == 0)
                                                    <p class="hs2-title-18px"><del>{{ currency(number_format($course->price, 2)) }}</del></p>
                                                    <p class="hs2-title-18px bn-text-success">{{ get_phrase('Free') }}</p>
                                                @else
                                                    @if ($course->discount_flag == 1)
                                                        @php $discounted_price = number_format(($course->discounted_price), 2) @endphp
                                                        {{ currency($discounted_price) }}
                                                        <del>{{ currency(number_format($course->price, 2)) }}</del>
                                                    @else
                                                        {{ currency(number_format($course->price, 2)) }}
                                                    @endif
                                                @endif
                                            </p>

                                            {{-- @auth
                                                @if (in_array($course->id, $wishlist))
                                                    <span data-bs-toggle="tooltip" data-bs-title="{{ get_phrase('Remove from wishlist') }}" class="heart toggleWishItem stop-propagation inList" id="item-{{ $course->id }}"><i class="fa-regular fa-heart"></i></span>
                                                @else
                                                    <span data-bs-toggle="tooltip" data-bs-title="{{ get_phrase('Add to wishlist') }}" class="heart toggleWishItem stop-propagation" id="item-{{ $course->id }}"><i class="fa-regular fa-heart"></i></span>
                                                @endif
                                            @endauth --}}
                                        </div>

                                        <a href="{{ route('purchase.course', $course->id) }}" class="btn bn-btn-outline-secondary py-2 position-relative">{{ get_phrase('Enroll Now') }}</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach


                    <div class="entry-pagination">
                        <nav aria-label="Page navigation example">
                            {{ $courses->links() }}
                        </nav>
                    </div>
                @else
                    @include('frontend.default.empty')
                @endif
            </div>
        </div>
    </section>
@endsection
