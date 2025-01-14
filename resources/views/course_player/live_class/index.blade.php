@php
    $live_class = App\Models\Live_class::where('course_id', $course_details->id)
        ->latest('id')
        ->first();
@endphp

<div class="tab-pane p-4 fade @if ($tab == 'live-class') show active @endif" id="pills-live-class" role="tabpanel" aria-labelledby="pills-live-class-tab" tabindex="0">
    @if ($live_class)
        <div>
            <div class="d-flex gap-2 align-items-start mb-10px">
                <img class="mt-2px" src="{{ asset('assets/frontend/default/images/icon/calendar2-black-20.svg') }}" alt="calender">
                <p class="hs-subtitle-16px">জুম লাইভ ক্লাস সময়সূচী</p>
            </div>
            <h5 class="hs-title-20px mb-3">{{ $live_class->title }}</h5>
            <div class="time-alert-warning mb-32px">
                <p class="man-subtitle-16px fw-semibold bn-text-dark text-center">Upcoming class are very important for everyone</p>
            </div>
            <a href="{{ route('live.class.join', ['id' => $live_class->id]) }}" class="btn bn-btn-skin">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M10.4415 17.0166H5.17484C2.5415 17.0166 1.6665 15.2666 1.6665 13.5083V6.49161C1.6665 3.85828 2.5415 2.98328 5.17484 2.98328H10.4415C13.0748 2.98328 13.9498 3.85828 13.9498 6.49161V13.5083C13.9498 16.1416 13.0665 17.0166 10.4415 17.0166Z" stroke="#1A1C1F"
                        stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                    <path d="M16.2669 14.25L13.9502 12.625V7.36665L16.2669 5.74165C17.4002 4.94999 18.3335 5.43332 18.3335 6.82499V13.175C18.3335 14.5667 17.4002 15.05 16.2669 14.25Z" stroke="#1A1C1F" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                    <path d="M9.5835 9.16663C10.2739 9.16663 10.8335 8.60698 10.8335 7.91663C10.8335 7.22627 10.2739 6.66663 9.5835 6.66663C8.89314 6.66663 8.3335 7.22627 8.3335 7.91663C8.3335 8.60698 8.89314 9.16663 9.5835 9.16663Z" stroke="#1A1C1F" stroke-width="1.25" stroke-linecap="round"
                        stroke-linejoin="round" />
                </svg>

                <span>লাইভ ক্লাসে যোগ দিন</span>
            </a>
        </div>
    @else
        <div class="time-alert-warning mb-32px">
            <p class="man-subtitle-16px fw-semibold bn-text-dark text-center">{{ get_phrase('No class available') }}</p>
        </div>
    @endif
</div>
