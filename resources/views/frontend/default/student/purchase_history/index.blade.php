@extends('layouts.default')
@push('title', get_phrase('Purchase History'))
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
                                <li class="bn-breadcrumb-item active" aria-current="page">{{ get_phrase('Payment History') }}</li>
                            </ul>
                        </nav>
                        <h1 class="man-title-36px mb-12px">{{ get_phrase('Payment History') }}</h1>
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

                <div class="col-lg-9">
                    <div class="content-card">
                        <div class="my-panel purchase-history-panel">


                            @if ($payments->count() > 0)
                                <div class="table-responsive">
                                    <table class="table eTable">
                                        <thead>
                                            <tr>
                                                <th>{{ get_phrase('Course Name') }}</th>
                                                <th>{{ get_phrase('Date') }}</th>
                                                <th>{{ get_phrase('Payment Method') }}</th>
                                                <th>{{ get_phrase('Price') }}</th>
                                                <th>{{ get_phrase('Invoice') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($payments as $payment)
                                                <tr>
                                                    <td>{{ $payment->course_title }}</td>
                                                    <td>{{ date('Y-m-d', strtotime($payment->created_at)) }}</td>
                                                    <td>{{ ucfirst($payment->payment_type) }}</td>
                                                    <td>{{ currency($payment->amount) }}</td>
                                                    <td>
                                                        <a href="{{ route('invoice', $payment->id) }}" class="btn bn-btn-skin" data-bs-toggle="tooltip" data-bs-title="{{ get_phrase('Print Invoice') }}">
                                                            <i class="fi fi-rr-print d-inline-flex"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            @else
                                <div class="row bg-white radius-10 mx-2">
                                    <div class="com-md-12">
                                        @include('frontend.default.empty')
                                    </div>
                                </div>
                            @endif
                        </div>

                        @if (count($payments) > 0)
                            <div class="entry-pagination">
                                <nav aria-label="Page navigation example">
                                    {{ $payments->links() }}
                                </nav>
                            </div>
                        @endif
                    </div>

                </div>
            </div>
        </div>
    </section>

@endsection
@push('js')@endpush
