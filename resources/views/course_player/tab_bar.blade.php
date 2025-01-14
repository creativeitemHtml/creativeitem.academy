@php
    $course_progress_out_of_100 = progress_bar($course_details->id);
    if (isset($_GET['tab'])) {
        $tab = $_GET['tab'];
    } elseif (Session::has('forum_tab')) {
        $tab = Session::get('forum_tab');
    } else {
        $tab = 'summary';
    }
@endphp

<div class="light-content-card">
    <ul class="nav nav-pills flex-wrap mb-32px gap-3" id="pills-tab" role="tablist">

        <li class="nav-item" role="presentation">
            <button class="nav-link tab2-nav-link @if ($tab == 'summary') active @endif" id="pills-summary-tab" data-bs-toggle="pill" data-bs-target="#pills-summary" type="button" role="tab" aria-controls="pills-one" aria-selected="true">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M17.5 5.83341V14.1667C17.5 16.6667 16.25 18.3334 13.3333 18.3334H6.66667C3.75 18.3334 2.5 16.6667 2.5 14.1667V5.83341C2.5 3.33341 3.75 1.66675 6.66667 1.66675H13.3333C16.25 1.66675 17.5 3.33341 17.5 5.83341Z" stroke="#1A1C1F" stroke-width="1.25" stroke-miterlimit="10"
                        stroke-linecap="round" stroke-linejoin="round" />
                    <path d="M12.0835 3.75V5.41667C12.0835 6.33333 12.8335 7.08333 13.7502 7.08333H15.4168" stroke="#1A1C1F" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round" />
                    <path d="M6.6665 10.8334H9.99984" stroke="#1A1C1F" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round" />
                    <path d="M6.6665 14.1667H13.3332" stroke="#1A1C1F" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round" />
                </svg>

                <span>{{ get_phrase('Summary') }}</span>
            </button>
        </li>


        <li class="nav-item" role="presentation">
            <button class="nav-link tab2-nav-link @if ($tab == 'live-class') active @endif" id="pills-live-class-tab" data-bs-toggle="pill" data-bs-target="#pills-live-class" type="button" role="tab" aria-controls="pills-two" aria-selected="false">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M1.66699 7.49988V6.66654C1.66699 4.16654 3.33366 2.49988 5.83366 2.49988H14.167C16.667 2.49988 18.3337 4.16654 18.3337 6.66654V13.3332C18.3337 15.8332 16.667 17.4999 14.167 17.4999H13.3337" stroke="#1A1C1F" stroke-width="1.25" stroke-linecap="round"
                        stroke-linejoin="round" />
                    <path d="M3.0752 9.7583C6.9252 10.25 9.7502 13.0833 10.2502 16.9333" stroke="#1A1C1F" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                    <path d="M2.18359 12.5583C5.00859 12.9167 7.0836 15 7.45027 17.825" stroke="#1A1C1F" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                    <path d="M1.6499 15.7167C3.05824 15.9 4.09991 16.9333 4.28324 18.35" stroke="#1A1C1F" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                </svg>

                <span>{{ get_phrase('Live CLass') }}</span>
            </button>
        </li>


        <li class="nav-item" role="presentation">
            <button class="nav-link tab2-nav-link @if ($tab == 'certificate') active @endif" id="pills-certificate-tab" data-bs-toggle="pill" data-bs-target="#pills-certificate" type="button" role="tab" aria-controls="pills-three" aria-selected="false">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M8.37477 2.10836L3.35811 5.38336C1.74977 6.43336 1.74977 8.78336 3.35811 9.83336L8.37477 13.1084C9.27477 13.7 10.7581 13.7 11.6581 13.1084L16.6498 9.83336C18.2498 8.78336 18.2498 6.4417 16.6498 5.3917L11.6581 2.1167C10.7581 1.5167 9.27477 1.5167 8.37477 2.10836Z"
                        stroke="#1A1C1F" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                    <path d="M4.69193 10.9L4.68359 14.8084C4.68359 15.8667 5.50026 17 6.50026 17.3334L9.15859 18.2167C9.61693 18.3667 10.3753 18.3667 10.8419 18.2167L13.5003 17.3334C14.5003 17 15.3169 15.8667 15.3169 14.8084V10.9417" stroke="#1A1C1F" stroke-width="1.25" stroke-linecap="round"
                        stroke-linejoin="round" />
                    <path d="M17.833 12.5V7.5" stroke="#1A1C1F" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                </svg>

                <span>{{ get_phrase('Certificate') }}</span>
            </button>
        </li>


        <li class="nav-item" role="presentation">
            <button class="nav-link tab2-nav-link @if ($tab == 'forum') active @endif" id="pills-forum-tab" data-bs-toggle="pill" data-bs-target="#pills-forum" type="button" role="tab" aria-controls="pills-four" aria-selected="false">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M18.3337 5.20841V9.45839C18.3337 10.5167 17.9837 11.4084 17.3587 12.0251C16.742 12.6501 15.8503 13.0001 14.792 13.0001V14.5084C14.792 15.0751 14.1587 15.4167 13.692 15.1001L12.8837 14.5667C12.9587 14.3084 12.992 14.0251 12.992 13.7251V10.3334C12.992 8.63344 11.8587 7.50008 10.1587 7.50008H4.50032C4.38365 7.50008 4.27533 7.50843 4.16699 7.51676V5.20841C4.16699 3.08341 5.58366 1.66675 7.70866 1.66675H14.792C16.917 1.66675 18.3337 3.08341 18.3337 5.20841Z"
                        stroke="#1A1C1F" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round" />
                    <path
                        d="M12.992 10.3334V13.725C12.992 14.025 12.9587 14.3083 12.8837 14.5667C12.5753 15.7917 11.5587 16.5583 10.1587 16.5583H7.89199L5.37532 18.2333C5.00032 18.4917 4.50032 18.2167 4.50032 17.7667V16.5583C3.65032 16.5583 2.94199 16.275 2.45033 15.7833C1.95033 15.2833 1.66699 14.575 1.66699 13.725V10.3334C1.66699 8.75002 2.65033 7.65835 4.16699 7.51668C4.27533 7.50835 4.38365 7.5 4.50032 7.5H10.1587C11.8587 7.5 12.992 8.63335 12.992 10.3334Z"
                        stroke="#1A1C1F" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round" />
                </svg>

                <span>{{ get_phrase('Forum') }}</span>
            </button>
        </li>
    </ul>


    <div class="tab-content" id="pills-tabContent">
        @include('course_player.summary.index')
        @include('course_player.live_class.index')
        @include('course_player.certificate.index')
        @include('course_player.forum.index')
    </div>
</div>

@push('js')
    <script>
        "use strict";
        $(document).ready(function() {
            $('button.nav-link').on('click', function(e) {
                e.preventDefault();
                let tab = $(this).data('bs-target');

                $.ajax({
                    type: "get",
                    url: "{{ route('forum.tab.active') }}",
                    data: {
                        tab: tab
                    }
                });
            });
        });
    </script>
@endpush
