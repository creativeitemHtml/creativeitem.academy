{{-- <div class="my-container">
    <div class="row">
        <div class="col-md-12">
            <div class="course-playing-header d-flex align-items-center justify-content-between py-1">
                <div class="course-play-logo">
                    <a href="{{ route('home') }}">
                        <img class="d-none d-lg-block" src="{{ asset(get_frontend_settings('light_logo')) }}" alt="" height="40px">
                    </a>
                </div>
                <div class="playing-video-title py-2">
                    <p class="title text-16px mb-0">{{ ucfirst($course_details->title) }}</p>
                </div>
                <div class="playing-header-btns d-flex align-items-center">
                    <a href="javascript:void(0);" class="video-zoom-btn p-2" id="fullscreen">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_3_915)">
                                <path
                                    d="M8.08917 11.9108C8.415 12.2367 8.415 12.7633 8.08917 13.0892L2.845 18.3333H6.66667C7.1275 18.3333 7.5 18.7067 7.5 19.1667C7.5 19.6267 7.1275 20 6.66667 20H2.5C1.12167 20 0 18.8783 0 17.5V13.3333C0 12.8733 0.3725 12.5 0.833333 12.5C1.29417 12.5 1.66667 12.8733 1.66667 13.3333V17.155L6.91083 11.9108C7.23667 11.585 7.76333 11.585 8.08917 11.9108ZM17.5 0H13.3333C12.8725 0 12.5 0.373333 12.5 0.833333C12.5 1.29333 12.8725 1.66667 13.3333 1.66667H17.155L11.9108 6.91083C11.585 7.23667 11.585 7.76333 11.9108 8.08917C12.0733 8.25167 12.2867 8.33333 12.5 8.33333C12.7133 8.33333 12.9267 8.25167 13.0892 8.08917L18.3333 2.845V6.66667C18.3333 7.12667 18.7058 7.5 19.1667 7.5C19.6275 7.5 20 7.12667 20 6.66667V2.5C20 1.12167 18.8783 0 17.5 0Z"
                                    fill="#C7C7C7" />
                            </g>
                            <defs>
                                <clipPath id="clip0_3_915">
                                    <rect width="20" height="20" fill="white" />
                                </clipPath>
                            </defs>
                        </svg>
                    </a>

                    @if (is_course_instructor($course_details->id) || auth()->user()->role == 'admin')
                        <a href="{{ route(auth()->user()->role . '.course.edit', ['id' => $course_details->id, 'tab' => 'curriculum']) }}" class="my-courses-btn d-none d-lg-block py-1 px-2">{{ get_phrase('Manage Course') }}</a>
                    @else
                        <a href="{{ route('my.courses') }}" class="my-courses-btn d-none d-lg-block py-1 px-2">{{ get_phrase('My Courses') }}</a>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div> --}}


<header class="header-dark">
    <div class="container-fluid">
        <div class="row g-4 align-items-center justify-content-between flex-nowrap">
            <div class="col-auto col-lg">
                <a href="{{ route('home') }}">
                    <img class="d-none d-sm-block" src="{{ asset('assets/frontend/default/images/logo-white.svg') }}" alt="logo">
                </a>
            </div>

            <div class="col col-lg-6 col-xl-7 d-none d-md-block">
                <p class="dark-menu-title text-white text-center">{{ ucfirst($course_details->title) }}</p>
            </div>

            <div class="col-auto col-lg">
                <div class="d-flex align-items-center gap-12px justify-content-end">
                    <button type="button" class="btn bn-btn-outline-light bn2-icon-btn btn-svg-stroke" id="fullscreen">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M14.1667 2.5H17.5001V5.83333" stroke="white" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"></path>
                            <path d="M12.5 7.5L17.5 2.5" stroke="white" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"></path>
                            <path d="M5.83333 17.5001H2.5V14.1667" stroke="white" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"></path>
                            <path d="M7.5 12.5L2.5 17.5" stroke="white" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"></path>
                            <path d="M11.6834 1.83342C11.1418 1.72509 10.5751 1.66675 10.0001 1.66675C5.40008 1.66675 1.66675 5.40008 1.66675 10.0001C1.66675 10.5751 1.72509 11.1334 1.83342 11.6667" stroke="white" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"></path>
                            <path d="M8.31665 18.1666C8.85832 18.2749 9.425 18.3333 10 18.3333C14.6 18.3333 18.3333 14.5999 18.3333 9.99992C18.3333 9.43325 18.275 8.87492 18.1667 8.33325" stroke="white" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"></path>
                        </svg>
                    </button>

                    @if (is_course_instructor($course_details->id) || auth()->user()->role == 'admin')
                        <a href="{{ route(auth()->user()->role . '.course.edit', ['id' => $course_details->id, 'tab' => 'curriculum']) }}" class="btn bn-btn-outline-light py-2 px-3 px-md-4 btn-svg-stroke text-nowrap">
                            <span>{{ get_phrase('Manage Course') }}</span>
                        </a>
                    @else
                        <a href="{{ route('my.courses') }}" class="btn bn-btn-outline-light py-2 px-3 px-md-4 btn-svg-stroke text-nowrap">
                            <span>{{ get_phrase('My Courses') }}</span>
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M7.45825 3.39985L12.8916 8.83319C13.5333 9.47485 13.5333 10.5249 12.8916 11.1665L7.45825 16.5999" stroke="white" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                            </svg>
                        </a>
                    @endif
                </div>
            </div>
        </div>
    </div>
</header>
