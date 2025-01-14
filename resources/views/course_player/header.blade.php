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
