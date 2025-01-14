<div class="tab-pane fade @if ($tab == 'certificate') show active @endif" id="pills-certificate" role="tabpanel" aria-labelledby="pills-certificate-tab" tabindex="0">
    <div>
        <h4 class="hs-title-20px mb-12px text-center">{{ get_phrase('Earn Your Completion Certificate!') }}</h4>

        @php
            $certificate = App\Models\Certificate::where('course_id', $course_details->id);
        @endphp

        <div class="d-flex justify-content-center align-items-center flex-column">
            <div class="progress w-sm-75" role="progressbar" aria-label="Warning example" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
                <div class="progress-bar text-bg-warning" style="width: {{ $course_progress_out_of_100 }}%">
                    {{ round($course_progress_out_of_100) }}%
                </div>
            </div>

            @if ($certificate->count() > 0 && $course_progress_out_of_100 >= 100)
                <p class="hs-subtitle-16px mb-32px text-center w-sm-75 mt-3">
                    {{ get_phrase('Your dedication has truly paid off. Here\'s to fresh starts and the endless possibilities that lie ahead! 🌱🚀') }}
                </p>

                <div class="d-flex justify-content-center align-items-center gap-3 flex-wrap">
                    <a href="{{ route('certificate', ['identifier' => $certificate->value('identifier')]) }}" class="btn bn-btn-skin py-2">
                        <img src="{{ asset('assets/frontend/default/images/icon/download-black-20.svg') }}" alt="icon">
                        <span>{{ get_phrase('Claim Certificate') }}</span>
                    </a>
                </div>
            @else
                <p class="hs-subtitle-16px mb-32px text-center w-sm-75 mt-3">
                    {{ get_phrase('Your dedication is inspiring. Every step brings you closer to finishing the course and earning your certificate. 🎯🎓 Stay focused, keep pushing forward, and success is yours! 💡🔥') }}
                </p>
            @endif
        </div>
    </div>
</div>
