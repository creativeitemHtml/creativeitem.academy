{{-- <div class="tab-pane fade @if ($tab == 'forum') show active @endif" id="pills-forum" role="tabpanel" aria-labelledby="pills-forum-tab" tabindex="0">
    <div class="forum-tab-content">
        <div class="container" id="forum-area">
            @include('course_player.forum.question_body')
        </div>
    </div>
</div>

@push('js')
    <script>
        "use strict";

        $(document).ready(function() {
            function initializeSummernote() {
                $('textarea#summernote').summernote({
                    height: 180, // set editor height
                    minHeight: null, // set minimum height of editor
                    maxHeight: null, // set maximum height of editor
                    focus: true, // set focus to editable area after initializing summernote
                    toolbar: [
                        ['color', ['color']],
                        ['font', ['bold', 'italic', 'underline', 'clear']],
                        ['fontsize', ['fontsize']],
                        ['para', ['ul', 'ol']],
                        ['table', ['table']],
                        ['insert', ['link']]
                    ]
                });
            }

            initializeSummernote();

            $('#forum-area').on('click', '.show-form', function(e) {
                e.preventDefault();

                let btnType = $(this).attr('id');
                let data = {
                    course_id: "{{ $course_details->id }}"
                };
                let url = "{{ route('forum.question.create') }}";

                // if user click on edit button add a question id
                if (btnType == 'edit-question') {
                    data.question_id = $(this).data('question-id');
                    url = "{{ route('forum.question.edit') }}";
                } else if (btnType == 'reply') {
                    data.parent_question_id = $(this).data('parent-question-id');
                    url = "{{ route('forum.question.reply.create') }}";
                } else if (btnType == 'reply-edit') {
                    data.reply_id = $(this).data('reply-id');
                    url = "{{ route('forum.question.reply.edit') }}";
                }

                $.ajax({
                    type: "get",
                    url: url,
                    data: data,
                    success: function(response) {
                        $('#forum-area').empty().append(response);
                        initializeSummernote();
                    }
                });
            });

            $('#forum-area').on('click', '#questions', function(e) {
                e.preventDefault();
                $.ajax({
                    type: "get",
                    url: "{{ route('forum.questions') }}",
                    data: {
                        course_id: "{{ $course_details->id }}"
                    },
                    success: function(response) {
                        $('#forum-area').empty().append(response);
                        initializeSummernote();
                    }
                });
            });
        });
    </script>
@endpush --}}


<div class="tab-pane fade" id="pills-forum" role="tabpanel" aria-labelledby="pills-forum-tab" tabindex="0">
    <div>
        <form action="" class="mb-18px">
            <div>
                <input type="text" class="form-control bn-form-control bn-search-form-control" id="search" placeholder="প্রশ্ন অনুসন্ধান করুন...">
            </div>
        </form>
        <div class="mb-20px d-flex align-items-center column-gap-3 row-gap-2 justify-content-between flex-wrap">
            <h4 class="hs-title-20px">এই কোর্সে 2টি প্রশ্ন আছে</h4>
            <a href="#" class="btn bn-btn-skin py-2">
                <img src="assets/images/icon/plus-black-20.svg" alt="plus">
                <span>প্রশ্ন জিজ্ঞাসা করুন</span>
            </a>
        </div>
        <div>
            <div class="single-outer-comment">
                <div class="d-flex align-items-center column-gap-3 row-gap-2 justify-content-between mb-3">
                    <div class="d-flex align-items-center gap-2">
                        <div class="image-circle-40px">
                            <img src="assets/images/img/user-commentor-1.svg" alt="user">
                        </div>
                        <div class="d-flex align-items-start column-gap-2 row-gap-1 flex-wrap flex-column flex-sm-row">
                            <h5 class="hs-subtitle-14px fw-semibold user-name">মোঃ জয়নুল আবেদীন</h5>
                            <p class="comment-time">০৮:০০ PM. ০৭ সেপ্টেম্বর ২০২৪</p>
                        </div>
                    </div>
                    <div class="dropdown">
                        <button class="btn dropdown-toggle icon-dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M11.6667 4.16667C11.6667 3.25 10.9167 2.5 10.0001 2.5C9.08341 2.5 8.33341 3.25 8.33341 4.16667C8.33341 5.08333 9.08341 5.83333 10.0001 5.83333C10.9167 5.83333 11.6667 5.08333 11.6667 4.16667Z" stroke="#1A1C1F" stroke-width="1.25"></path>
                                <path d="M11.6667 15.8334C11.6667 14.9167 10.9167 14.1667 10.0001 14.1667C9.08341 14.1667 8.33341 14.9167 8.33341 15.8334C8.33341 16.7501 9.08341 17.5001 10.0001 17.5001C10.9167 17.5001 11.6667 16.7501 11.6667 15.8334Z" stroke="#1A1C1F" stroke-width="1.25">
                                </path>
                                <path d="M11.6667 9.99992C11.6667 9.08325 10.9167 8.33325 10.0001 8.33325C9.08341 8.33325 8.33341 9.08325 8.33341 9.99992C8.33341 10.9166 9.08341 11.6666 10.0001 11.6666C10.9167 11.6666 11.6667 10.9166 11.6667 9.99992Z" stroke="#1A1C1F" stroke-width="1.25">
                                </path>
                            </svg>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end bn-dropdown-menu">
                            <li><a class="dropdown-item bn-dropdown-item" href="#">কোর্সসমূহ</a></li>
                            <li><a class="dropdown-item bn-dropdown-item" href="#">
                                    <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <g clip-path="url(#clip0_312_588)">
                                            <path
                                                d="M15.75 3H13.425C13.2509 2.15356 12.7904 1.39301 12.1209 0.846539C11.4515 0.300068 10.6142 0.00109089 9.75 0L8.25 0C7.38585 0.00109089 6.54849 0.300068 5.87906 0.846539C5.20963 1.39301 4.74907 2.15356 4.575 3H2.25C2.05109 3 1.86032 3.07902 1.71967 3.21967C1.57902 3.36032 1.5 3.55109 1.5 3.75C1.5 3.94891 1.57902 4.13968 1.71967 4.28033C1.86032 4.42098 2.05109 4.5 2.25 4.5H3V14.25C3.00119 15.2442 3.39666 16.1973 4.09966 16.9003C4.80267 17.6033 5.7558 17.9988 6.75 18H11.25C12.2442 17.9988 13.1973 17.6033 13.9003 16.9003C14.6033 16.1973 14.9988 15.2442 15 14.25V4.5H15.75C15.9489 4.5 16.1397 4.42098 16.2803 4.28033C16.421 4.13968 16.5 3.94891 16.5 3.75C16.5 3.55109 16.421 3.36032 16.2803 3.21967C16.1397 3.07902 15.9489 3 15.75 3ZM8.25 1.5H9.75C10.2152 1.50057 10.6688 1.64503 11.0487 1.91358C11.4286 2.18213 11.7161 2.56162 11.8717 3H6.12825C6.28394 2.56162 6.57142 2.18213 6.95129 1.91358C7.33115 1.64503 7.78479 1.50057 8.25 1.5ZM13.5 14.25C13.5 14.8467 13.2629 15.419 12.841 15.841C12.419 16.2629 11.8467 16.5 11.25 16.5H6.75C6.15326 16.5 5.58097 16.2629 5.15901 15.841C4.73705 15.419 4.5 14.8467 4.5 14.25V4.5H13.5V14.25Z"
                                                fill="#1A1C1F" />
                                            <path
                                                d="M7.5 13.5C7.69891 13.5 7.88968 13.421 8.03033 13.2803C8.17098 13.1397 8.25 12.9489 8.25 12.75V8.25C8.25 8.05109 8.17098 7.86032 8.03033 7.71967C7.88968 7.57902 7.69891 7.5 7.5 7.5C7.30109 7.5 7.11032 7.57902 6.96967 7.71967C6.82902 7.86032 6.75 8.05109 6.75 8.25V12.75C6.75 12.9489 6.82902 13.1397 6.96967 13.2803C7.11032 13.421 7.30109 13.5 7.5 13.5Z"
                                                fill="#1A1C1F" />
                                            <path
                                                d="M10.5 13.5C10.6989 13.5 10.8897 13.421 11.0303 13.2803C11.171 13.1397 11.25 12.9489 11.25 12.75V8.25C11.25 8.05109 11.171 7.86032 11.0303 7.71967C10.8897 7.57902 10.6989 7.5 10.5 7.5C10.3011 7.5 10.1103 7.57902 9.96967 7.71967C9.82902 7.86032 9.75 8.05109 9.75 8.25V12.75C9.75 12.9489 9.82902 13.1397 9.96967 13.2803C10.1103 13.421 10.3011 13.5 10.5 13.5Z"
                                                fill="#1A1C1F" />
                                        </g>
                                        <defs>
                                            <clipPath id="clip0_312_588">
                                                <rect width="18" height="18" fill="white" />
                                            </clipPath>
                                        </defs>
                                    </svg>
                                    <span>ডিলিট</span>
                                </a></li>
                            <li><a class="dropdown-item bn-dropdown-item" href="#">
                                    <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M9 16.5C13.125 16.5 16.5 13.125 16.5 9C16.5 4.875 13.125 1.5 9 1.5C4.875 1.5 1.5 4.875 1.5 9C1.5 13.125 4.875 16.5 9 16.5Z" stroke="#1A1C1F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                        <path d="M9 6V9.75" stroke="#1A1C1F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                        <path d="M8.99609 12H9.00283" stroke="#1A1C1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                    <span>সমস্যা</span>
                                </a></li>
                        </ul>
                    </div>
                </div>
                <p class="hs-subtitle-16px bn-text-body">একটি ভাল UI ডিজাইন তৈরি করতে সময় লাগে, ত্রুটি, সংশোধন, পুনঃডিজাইন করা এবং প্রতিটি বিশদ পরীক্ষা সহ। UI ডিজাইন কার্যকরী, স্বজ্ঞাত এবং যেকোনো ব্যবহারকারীর কাছে পৌঁছানো উচিত। তাই ওয়েব পেজ, অ্যাপ্লিকেশন, বা অন্যান্য
                    ডিজিটাল পণ্যের ইন্টারফেস তৈরি করার সময় ব্যবহারকারীদের চাহিদা বিবেচনা করা উচিত।</p>
                <div class="d-flex align-items-start column-gap-2 row-gap-1 flex-wrap mt-3">
                    <div class="d-flex align-items-center column-gap-3 row-gap-1 flex-wrap">
                        <a href="#" class="hs-subtitle-14px bn-text-body bn2-link d-flex align-items-center gap-1 bn2-stroke-transparent-hover active">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M6.2334 15.2917L8.81673 17.2917C9.15006 17.625 9.90006 17.7917 10.4001 17.7917H13.5667C14.5667 17.7917 15.6501 17.0417 15.9001 16.0417L17.9001 9.95835C18.3167 8.79168 17.5667 7.79168 16.3167 7.79168H12.9834C12.4834 7.79168 12.0667 7.37501 12.1501 6.79168L12.5667 4.12501C12.7334 3.37501 12.2334 2.54168 11.4834 2.29168C10.8167 2.04168 9.9834 2.37501 9.65006 2.87501L6.2334 7.95835"
                                    stroke="#575757" stroke-width="1.25" stroke-miterlimit="10" />
                                <path d="M1.9834 15.2916V7.12496C1.9834 5.95829 2.4834 5.54163 3.65007 5.54163H4.4834C5.65006 5.54163 6.15007 5.95829 6.15007 7.12496V15.2916C6.15007 16.4583 5.65006 16.875 4.4834 16.875H3.65007C2.4834 16.875 1.9834 16.4583 1.9834 15.2916Z" stroke="#575757"
                                    stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                            </svg>
                            <span>লাইক</span>
                        </a>
                        <a href="#" class="hs-subtitle-14px bn-text-body bn2-link d-flex align-items-center gap-1">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M5.87435 10.1253L7.91602 12.167C8.06879 12.3198 8.14518 12.4969 8.14518 12.6982C8.14518 12.8996 8.06879 13.08 7.91602 13.2395C7.76324 13.3856 7.58615 13.4587 7.38477 13.4587C7.18338 13.4587 7.00629 13.3823 6.85352 13.2295L3.52018 9.89616C3.3674 9.74844 3.29102 9.57609 3.29102 9.37912C3.29102 9.18215 3.3674 9.00727 3.52018 8.85449L6.85352 5.52116C7.00629 5.36838 7.18454 5.29199 7.38824 5.29199C7.59194 5.29199 7.76786 5.36838 7.91602 5.52116C8.06879 5.66931 8.14518 5.84524 8.14518 6.04893C8.14518 6.25264 8.06879 6.43088 7.91602 6.58366L5.87435 8.62533H12.9993C14.106 8.62533 15.0493 9.01533 15.8293 9.79533C16.6094 10.5753 16.9993 11.5187 16.9993 12.6253V14.8753C16.9993 15.0878 16.9279 15.266 16.785 15.4097C16.6421 15.5535 16.465 15.6253 16.2537 15.6253C16.0425 15.6253 15.8639 15.5535 15.7181 15.4097C15.5723 15.266 15.4993 15.0878 15.4993 14.8753V12.6253C15.4993 11.9309 15.2563 11.3406 14.7702 10.8545C14.2841 10.3684 13.6938 10.1253 12.9993 10.1253H5.87435Z"
                                    fill="#575757" />
                            </svg>
                            <span>রিপ্লাই</span>
                        </a>
                    </div>
                    <a href="#" class="hs-subtitle-14px bn-text-body bn2-link more-reply-after">চারটি রিপ্লাই দেখুন</a>
                </div>
                <div class="single-comment-reply">
                    <div class="d-flex align-items-center column-gap-3 row-gap-2 justify-content-between mb-12px">
                        <div class="d-flex align-items-center gap-2">
                            <div class="image-circle-40px">
                                <img src="assets/images/img/user-commentor-1.svg" alt="user">
                            </div>
                            <div class="d-flex align-items-start column-gap-2 row-gap-1 flex-wrap flex-column flex-sm-row">
                                <h5 class="hs-subtitle-14px fw-semibold user-name">মোঃ জয়নুল আবেদীন</h5>
                                <p class="comment-time">০৮:০০ PM. ০৭ সেপ্টেম্বর ২০২৪</p>
                            </div>
                        </div>
                    </div>
                    <p class="hs-subtitle-16px bn-text-body">একটি ভাল UI ডিজাইন তৈরি করতে সময় লাগে, ত্রুটি, সংশোধন, পুনঃডিজাইন করা এবং প্রতিটি বিশদ পরীক্ষা সহ। UI ডিজাইন কার্যকরী, স্বজ্ঞাত এবং যেকোনো ব্যবহারকারীর কাছে পৌঁছানো উচিত। তাই ওয়েব পেজ, অ্যাপ্লিকেশন, বা
                        অন্যান্য ডিজিটাল পণ্যের ইন্টারফেস তৈরি করার সময় ব্যবহারকারীদের চাহিদা বিবেচনা করা উচিত।</p>
                </div>
            </div>
            <div class="single-outer-comment">
                <div class="d-flex align-items-center column-gap-3 row-gap-2 justify-content-between mb-3">
                    <div class="d-flex align-items-center gap-2">
                        <div class="image-circle-40px">
                            <img src="assets/images/img/user-commentor-1.svg" alt="user">
                        </div>
                        <div class="d-flex align-items-start column-gap-2 row-gap-1 flex-wrap flex-column flex-sm-row">
                            <h5 class="hs-subtitle-14px fw-semibold user-name">মোঃ জয়নুল আবেদীন</h5>
                            <p class="comment-time">০৮:০০ PM. ০৭ সেপ্টেম্বর ২০২৪</p>
                        </div>
                    </div>
                    <div class="dropdown">
                        <button class="btn dropdown-toggle icon-dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M11.6667 4.16667C11.6667 3.25 10.9167 2.5 10.0001 2.5C9.08341 2.5 8.33341 3.25 8.33341 4.16667C8.33341 5.08333 9.08341 5.83333 10.0001 5.83333C10.9167 5.83333 11.6667 5.08333 11.6667 4.16667Z" stroke="#1A1C1F" stroke-width="1.25"></path>
                                <path d="M11.6667 15.8334C11.6667 14.9167 10.9167 14.1667 10.0001 14.1667C9.08341 14.1667 8.33341 14.9167 8.33341 15.8334C8.33341 16.7501 9.08341 17.5001 10.0001 17.5001C10.9167 17.5001 11.6667 16.7501 11.6667 15.8334Z" stroke="#1A1C1F" stroke-width="1.25">
                                </path>
                                <path d="M11.6667 9.99992C11.6667 9.08325 10.9167 8.33325 10.0001 8.33325C9.08341 8.33325 8.33341 9.08325 8.33341 9.99992C8.33341 10.9166 9.08341 11.6666 10.0001 11.6666C10.9167 11.6666 11.6667 10.9166 11.6667 9.99992Z" stroke="#1A1C1F" stroke-width="1.25">
                                </path>
                            </svg>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end bn-dropdown-menu">
                            <li><a class="dropdown-item bn-dropdown-item" href="#">কোর্সসমূহ</a></li>
                            <li><a class="dropdown-item bn-dropdown-item" href="#">
                                    <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <g clip-path="url(#clip0_312_588)">
                                            <path
                                                d="M15.75 3H13.425C13.2509 2.15356 12.7904 1.39301 12.1209 0.846539C11.4515 0.300068 10.6142 0.00109089 9.75 0L8.25 0C7.38585 0.00109089 6.54849 0.300068 5.87906 0.846539C5.20963 1.39301 4.74907 2.15356 4.575 3H2.25C2.05109 3 1.86032 3.07902 1.71967 3.21967C1.57902 3.36032 1.5 3.55109 1.5 3.75C1.5 3.94891 1.57902 4.13968 1.71967 4.28033C1.86032 4.42098 2.05109 4.5 2.25 4.5H3V14.25C3.00119 15.2442 3.39666 16.1973 4.09966 16.9003C4.80267 17.6033 5.7558 17.9988 6.75 18H11.25C12.2442 17.9988 13.1973 17.6033 13.9003 16.9003C14.6033 16.1973 14.9988 15.2442 15 14.25V4.5H15.75C15.9489 4.5 16.1397 4.42098 16.2803 4.28033C16.421 4.13968 16.5 3.94891 16.5 3.75C16.5 3.55109 16.421 3.36032 16.2803 3.21967C16.1397 3.07902 15.9489 3 15.75 3ZM8.25 1.5H9.75C10.2152 1.50057 10.6688 1.64503 11.0487 1.91358C11.4286 2.18213 11.7161 2.56162 11.8717 3H6.12825C6.28394 2.56162 6.57142 2.18213 6.95129 1.91358C7.33115 1.64503 7.78479 1.50057 8.25 1.5ZM13.5 14.25C13.5 14.8467 13.2629 15.419 12.841 15.841C12.419 16.2629 11.8467 16.5 11.25 16.5H6.75C6.15326 16.5 5.58097 16.2629 5.15901 15.841C4.73705 15.419 4.5 14.8467 4.5 14.25V4.5H13.5V14.25Z"
                                                fill="#1A1C1F" />
                                            <path
                                                d="M7.5 13.5C7.69891 13.5 7.88968 13.421 8.03033 13.2803C8.17098 13.1397 8.25 12.9489 8.25 12.75V8.25C8.25 8.05109 8.17098 7.86032 8.03033 7.71967C7.88968 7.57902 7.69891 7.5 7.5 7.5C7.30109 7.5 7.11032 7.57902 6.96967 7.71967C6.82902 7.86032 6.75 8.05109 6.75 8.25V12.75C6.75 12.9489 6.82902 13.1397 6.96967 13.2803C7.11032 13.421 7.30109 13.5 7.5 13.5Z"
                                                fill="#1A1C1F" />
                                            <path
                                                d="M10.5 13.5C10.6989 13.5 10.8897 13.421 11.0303 13.2803C11.171 13.1397 11.25 12.9489 11.25 12.75V8.25C11.25 8.05109 11.171 7.86032 11.0303 7.71967C10.8897 7.57902 10.6989 7.5 10.5 7.5C10.3011 7.5 10.1103 7.57902 9.96967 7.71967C9.82902 7.86032 9.75 8.05109 9.75 8.25V12.75C9.75 12.9489 9.82902 13.1397 9.96967 13.2803C10.1103 13.421 10.3011 13.5 10.5 13.5Z"
                                                fill="#1A1C1F" />
                                        </g>
                                        <defs>
                                            <clipPath id="clip0_312_588">
                                                <rect width="18" height="18" fill="white" />
                                            </clipPath>
                                        </defs>
                                    </svg>
                                    <span>ডিলিট</span>
                                </a></li>
                            <li><a class="dropdown-item bn-dropdown-item" href="#">
                                    <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M9 16.5C13.125 16.5 16.5 13.125 16.5 9C16.5 4.875 13.125 1.5 9 1.5C4.875 1.5 1.5 4.875 1.5 9C1.5 13.125 4.875 16.5 9 16.5Z" stroke="#1A1C1F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                        <path d="M9 6V9.75" stroke="#1A1C1F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                        <path d="M8.99609 12H9.00283" stroke="#1A1C1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                    <span>সমস্যা</span>
                                </a></li>
                        </ul>
                    </div>
                </div>
                <p class="hs-subtitle-16px bn-text-body">একটি ভাল UI ডিজাইন তৈরি করতে সময় লাগে, ত্রুটি, সংশোধন, পুনঃডিজাইন করা এবং প্রতিটি বিশদ পরীক্ষা সহ। UI ডিজাইন কার্যকরী, স্বজ্ঞাত এবং যেকোনো ব্যবহারকারীর কাছে পৌঁছানো উচিত। তাই ওয়েব পেজ, অ্যাপ্লিকেশন, বা অন্যান্য
                    ডিজিটাল পণ্যের ইন্টারফেস তৈরি করার সময় ব্যবহারকারীদের চাহিদা বিবেচনা করা উচিত।</p>
                <div class="d-flex align-items-start column-gap-2 row-gap-1 flex-wrap mt-3">
                    <div class="d-flex align-items-center column-gap-3 row-gap-1 flex-wrap">
                        <a href="#" class="hs-subtitle-14px bn-text-body bn2-link d-flex align-items-center gap-1 bn2-stroke-transparent-hover">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M6.2334 15.2917L8.81673 17.2917C9.15006 17.625 9.90006 17.7917 10.4001 17.7917H13.5667C14.5667 17.7917 15.6501 17.0417 15.9001 16.0417L17.9001 9.95835C18.3167 8.79168 17.5667 7.79168 16.3167 7.79168H12.9834C12.4834 7.79168 12.0667 7.37501 12.1501 6.79168L12.5667 4.12501C12.7334 3.37501 12.2334 2.54168 11.4834 2.29168C10.8167 2.04168 9.9834 2.37501 9.65006 2.87501L6.2334 7.95835"
                                    stroke="#575757" stroke-width="1.25" stroke-miterlimit="10" />
                                <path d="M1.9834 15.2916V7.12496C1.9834 5.95829 2.4834 5.54163 3.65007 5.54163H4.4834C5.65006 5.54163 6.15007 5.95829 6.15007 7.12496V15.2916C6.15007 16.4583 5.65006 16.875 4.4834 16.875H3.65007C2.4834 16.875 1.9834 16.4583 1.9834 15.2916Z" stroke="#575757"
                                    stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                            </svg>
                            <span>লাইক</span>
                        </a>
                        <a href="#" class="hs-subtitle-14px bn-text-body bn2-link d-flex align-items-center gap-1 active">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M5.87435 10.1253L7.91602 12.167C8.06879 12.3198 8.14518 12.4969 8.14518 12.6982C8.14518 12.8996 8.06879 13.08 7.91602 13.2395C7.76324 13.3856 7.58615 13.4587 7.38477 13.4587C7.18338 13.4587 7.00629 13.3823 6.85352 13.2295L3.52018 9.89616C3.3674 9.74844 3.29102 9.57609 3.29102 9.37912C3.29102 9.18215 3.3674 9.00727 3.52018 8.85449L6.85352 5.52116C7.00629 5.36838 7.18454 5.29199 7.38824 5.29199C7.59194 5.29199 7.76786 5.36838 7.91602 5.52116C8.06879 5.66931 8.14518 5.84524 8.14518 6.04893C8.14518 6.25264 8.06879 6.43088 7.91602 6.58366L5.87435 8.62533H12.9993C14.106 8.62533 15.0493 9.01533 15.8293 9.79533C16.6094 10.5753 16.9993 11.5187 16.9993 12.6253V14.8753C16.9993 15.0878 16.9279 15.266 16.785 15.4097C16.6421 15.5535 16.465 15.6253 16.2537 15.6253C16.0425 15.6253 15.8639 15.5535 15.7181 15.4097C15.5723 15.266 15.4993 15.0878 15.4993 14.8753V12.6253C15.4993 11.9309 15.2563 11.3406 14.7702 10.8545C14.2841 10.3684 13.6938 10.1253 12.9993 10.1253H5.87435Z"
                                    fill="#575757" />
                            </svg>
                            <span>রিপ্লাই</span>
                        </a>
                    </div>
                    <a href="#" class="hs-subtitle-14px bn-text-body bn2-link more-reply-after">চারটি রিপ্লাই দেখুন</a>
                </div>
                <form action="" class="mt-3">
                    <textarea class="form-control bn-form-control comment-textarea" name="" id="textarea" placeholder="এখানে লিখুন..."></textarea>
                    <button type="submit" hidden></button>
                </form>
            </div>
        </div>
    </div>
</div>
