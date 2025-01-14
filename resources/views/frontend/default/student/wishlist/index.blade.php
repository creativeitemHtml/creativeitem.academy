@extends('layouts.default')
@push('title', get_phrase('Wishlist'))
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
                                <li class="bn-breadcrumb-item active" aria-current="page">{{ get_phrase('Wishlist') }}</li>
                            </ul>
                        </nav>
                        <h1 class="man-title-36px mb-12px">{{ get_phrase('Wishlist') }}</h1>
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
                        <div class="row mt-5">
                            @foreach ($wishlist as $wishitem)
                                <div class="col-lg-4 col-md-4 col-sm-6 mb-30">
                                    <a href="{{ route('course.details', $wishitem->slug) }}" class="">
                                        <div class="card Ecard g-card wish-card">
                                            <div class="card-head">
                                                <img src="{{ get_image($wishitem->course_thumbnail) }}" alt="{{ get_phrase('course_thumbnail') }}">
                                            </div>
                                            <div class="card-body entry-details">
                                                <div class="info-card">
                                                    <div class="creator">
                                                        <img src="{{ get_image($wishitem->user_photo) }}" alt="{{ get_phrase('user_photo') }}">
                                                        <h5>{{ $wishitem->user_name }}</h5>
                                                    </div>
                                                    <span data-bs-toggle="tooltip" data-bs-title="{{ get_phrase('Remove from wishlist') }}" class="heart fill-heart toggleWishItem" id="item-{{ $wishitem->course_id }}"><i class="fa-solid fa-heart"></i></span>
                                                </div>
                                                <div class="entry-title">
                                                    <h3 class="w-100 ellipsis-line-2">{{ $wishitem->title }}</h3>
                                                </div>
                                                <div class="ct-text">
                                                    <h4>
                                                        @if ($wishitem->is_paid == 0)
                                                            {{ get_phrase('Free') }}
                                                        @else
                                                            @if ($wishitem->discount_flag == 1)
                                                                @php $discounted_price = number_format(($wishitem->discounted_price), 2) @endphp
                                                                {{ currency($discounted_price) }}
                                                            @else
                                                                {{ currency(number_format($wishitem->price, 2)) }}
                                                            @endif
                                                        @endif
                                                    </h4>
                                                    <p><span>4.8</span><i class="fa fa-star"></i></p>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            @endforeach

                        </div>
                        @if ($wishlist->count() == 0)
                            <div class="row bg-white radius-10 mx-2">
                                <div class="com-md-12">
                                    @include('frontend.default.empty')
                                </div>
                            </div>
                        @endif

                        @if (count($wishlist) > 0)
                            <div class="entry-pagination">
                                <nav aria-label="Page navigation example">
                                    {{ $wishlist->links() }}
                                </nav>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
@push('js')

@endpush
