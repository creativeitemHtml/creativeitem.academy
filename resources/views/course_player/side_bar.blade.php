@php
    $sections = App\Models\Section::where('course_id', $course_details->id)
        ->orderBy('sort')
        ->get();

    $completed_lesson =
        json_decode(
            App\Models\Watch_history::where('course_id', $course_details->id)
                ->where('student_id', Auth()->user()->id)
                ->value('completed_lesson'),
            true,
        ) ?? [];
    $active_section = App\Models\Lesson::where('id', $history->watching_lesson_id ?? '')->value('section_id');

    $lesson_history = App\Models\Watch_history::where('course_id', $course_details->id)
        ->where('student_id', auth()->user()->id)
        ->firstOrNew();
    $completed_lesson_arr = json_decode($lesson_history->completed_lesson, true);
    $complated_lesson = is_array($completed_lesson_arr) ? count($completed_lesson_arr) : 0;
    $course_progress_out_of_100 = progress_bar($course_details->id);
@endphp

<div class="curriculum-header mb-12px">
    <h4 class="hs-title-20px fw-bold text-white">{{ get_phrase('Course curriculum') }}</h4>
    <p class="course-completion-percentage">
        {{ $course_progress_out_of_100 }}% {{ get_phrase('Completed') }}
        ({{ $complated_lesson }}/{{ lesson_count($course_details->id) }})
    </p>
</div>

<div class="accordion bn2-accordion" id="accordion4">

    @foreach ($sections as $section)
        @php
            $lessons = App\Models\Lesson::where('section_id', $section->id)
                ->orderBy('sort')
                ->get();
        @endphp

        <div class="accordion-item bn2-accordion-item">
            <h2 class="accordion-header bn2-accordion-header">
                <button class="accordion-button bn2-accordion-button @if ($active_section != $section->id) collapsed @endif" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_{{ $section->id }}" aria-expanded="@if ($section->id != $active_section) false @else true @endif"
                    aria-controls="collapse_{{ $section->id }}">
                    {{ $section->title }}
                </button>
            </h2>
            <div id="collapse_{{ $section->id }}" class="accordion-collapse collapse @if ($section->id == $active_section) show @endif" data-bs-parent="#coursePlay">
                <div class="accordion-body bn2-accordion-body">
                    <ul>
                        @foreach ($lessons as $key => $lesson)
                            <li class="tutorial-list-single">
                                <a href="{{ route('course.player', ['slug' => $course_details->slug, 'id' => $lesson->id]) }}" class="tutorial-list-item @if (isset($history->watching_lesson_id) && $lesson->id == $history->watching_lesson_id) active @else lock @endif">
                                    <div class="d-flex align-items-center gap-2">
                                        <input class="form-check-input checkbox-radio-check-input flexCheckChecked" type="checkbox" @if (in_array($lesson->id, $completed_lesson)) checked @endif type="checkbox" id="{{ $lesson->id }}">
                                        <div class="play-lock-number">
                                            <span>
                                                @if (in_array($lesson->lesson_type, ['text', 'document_type', 'iframe']))
                                                    <i class="fi fi-rr-document"></i>
                                                @elseif (in_array($lesson->lesson_type, ['video-url', 'system-video', 'vimeo-url', 'google_drive']))
                                                    <i class="fi fi-rr-film"></i>
                                                @elseif ($lesson->lesson_type == 'image')
                                                    <i class="fi fi-rr-picture"></i>
                                                @else
                                                    <i class="fa-solid fa-file"></i>
                                                @endif
                                            </span>
                                        </div>
                                        <p class="tutorial-list-title">{{ $lesson->title }}</p>
                                    </div>

                                    @if (lesson_durations($lesson->id) != '00:00:00')
                                        <p class="tutorial-list-duration">{{ lesson_durations($lesson->id) }}</p>
                                    @endif
                                </a>
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
    @endforeach
</div>

<form class="ajaxForm" action="{{ route('set.watch.history') }}" method="post" id="watch_history_form">
    @csrf
    <input type="hidden" class="course_id" name="course_id" value="{{ $course_details->id }}">
    <input type="hidden" class="lesson_id" name="lesson_id">
</form>
