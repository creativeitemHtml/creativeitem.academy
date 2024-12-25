<div class="tab-pane p-4 fade @if ($tab == 'live-class') show active @endif" id="pills-live-class" role="tabpanel" aria-labelledby="pills-live-class-tab" tabindex="0">
    <div>
        <div class="d-flex gap-2 align-items-start mb-10px">
            <img class="mt-2px" src="assets/images/icon/calendar2-black-20.svg" alt="calender">
            <p class="hs-subtitle-16px">জুম লাইভ ক্লাস সময়সূচী</p>
        </div>
        <h5 class="hs-title-20px mb-3">রাত ০৮:০০ বুধবার, ০৭ সেপ্টেম্বর ২০২৪</h5>
        <div class="time-alert-warning mb-32px">
            <p class="man-subtitle-16px fw-semibold bn-text-dark text-center">Upcoming class are very important for everyone</p>
        </div>
        <a href="#" class="btn bn-btn-primary py-2">
            <img src="assets/images/icon/video-white-20.svg" alt="icon">
            <span>লাইভ ক্লাসে যোগ দিন</span>
        </a>
    </div>


    <div class="row">
        <div class="col-md-12">
            <h6>{{ get_phrase('Class Schedules') }}:</h6>
        </div>
        <div class="col-md-12">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <th>#</th>
                        <th>{{ get_phrase('Topic') }}</th>
                        <th>{{ get_phrase('Date & time') }}</th>
                        <th>{{ get_phrase('Action') }}</th>
                    </thead>
                    <tbody>

                        @foreach (App\Models\Live_class::where('course_id', $course_details->id)->get() as $key => $live_class)
                            <tr>
                                <td>{{ ++$key }}</td>
                                <td>
                                    {{ $live_class->class_topic }}
                                </td>
                                <td>{{ date('d M Y - h:i A', strtotime($live_class->class_date_and_time)) }}</td>
                                <td>
                                    <a href="{{ route('live.class.join', ['id' => $live_class->id]) }}" class="btn py-0 ps-1 pe-1 text-dark" data-bs-toggle="tooltip" data-bs-title="{{ get_phrase('Join Now') }}"><i class="fi-rr-video-camera"></i></a>
                                </td>
                            </tr>
                        @endforeach

                        <tr>
                            <td>1</td>
                            <td>Hello</td>
                            <td>{{ date('d M Y - h:i A', strtotime('now')) }}</td>
                            <td>
                                <a href="{{ route('live.class.join', ['id' => 1]) }}" class="btn py-0 ps-1 pe-1 text-dark" data-bs-toggle="tooltip" data-bs-title="{{ get_phrase('Join Now') }}"><i class="fi-rr-video-camera"></i></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
