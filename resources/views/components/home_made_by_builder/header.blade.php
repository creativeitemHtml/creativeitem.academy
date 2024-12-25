@php
    $parent_categories = DB::table('categories')->where('parent_id', 0)->latest('id')->get();
    $current_route = Route::currentRouteName();
    // dd($current_route);
@endphp

<header>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="d-flex align-items-center justify-content-between gap-3 main-navbar-wrap">
                    <a href="{{ route('home') }}">
                        <img src="{{ asset('assets/frontend/default/images/logo.svg') }}" alt="logo">
                    </a>
                    <div class="d-flex align-items-center navbar-wrap">
                        <!-- offcanvas -->
                        <div class="offcanvas-lg offcanvas-start bn-menu-offcanvas" tabindex="-1" id="offcanvasResponsive" aria-labelledby="offcanvasResponsiveLabel">
                            <div class="offcanvas-header">
                                <a href="#">
                                    <img src="{{ asset('assets/frontend/default/images/logo.svg') }}" alt="logo">
                                </a>
                                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasResponsive" aria-label="Close"></button>
                            </div>
                            <div class="offcanvas-body">
                                <nav>
                                    <ul class="bn-navbar-nav">



                                        <li class="bn-nav-item nav-item-have-sub">
                                            <a href="javascript:void(0)" class="d-flex align-items-center bn-nav-link
                                            @if ($current_route == 'courses') active @endif">
                                                <span> {{ get_phrase('কোর্সসমূহ') }}</span>
                                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M16.6004 7.45825L11.1671 12.8916C10.5254 13.5333 9.47539 13.5333 8.83372 12.8916L3.40039 7.45825" stroke="#1A1C1F" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round" />
                                                </svg>
                                            </a>
                                            <ul class="nav-dropdown-menu">
                                                @foreach ($parent_categories->take(10) as $parent_category)
                                                    @php
                                                        $child_categories = App\Models\Category::where('parent_id', $parent_category->id);
                                                    @endphp
                                                    <li>
                                                        <a href="{{ route('courses', $parent_category->slug) }}" class="nav-dropdown-item ">
                                                            <span class="me-3"><i class="{{ $parent_category->icon }}"></i></span>
                                                            <span class="me-auto">{{ ucfirst($parent_category->title) }}
                                                            </span>
                                                            @if ($child_categories->count() > 0)
                                                                <span><i class="fi fi-sr-angle-small-right"></i></span>
                                                            @endif
                                                        </a>

                                                        @if ($child_categories->count() > 0)
                                                            <ul class="child_category_menu">
                                                                @foreach ($child_categories->get() as $child_category)
                                                                    <li>
                                                                        <a href="{{ route('courses', $child_category->slug) }}">
                                                                            {{ ucfirst($child_category->title) }}
                                                                        </a>
                                                                    </li>
                                                                @endforeach
                                                            </ul>
                                                        @endif
                                                    </li>
                                                @endforeach

                                                <li><a href="{{ route('courses') }}" class="nav-dropdown-item @if ($current_route == 'courses') active @endif">কোর্সসমূহ</a>
                                                </li>

                                            </ul>
                                        </li>


                                        <li class="bn-nav-item nav-item-have-sub">
                                            <a href="javascript:void(0)" class="d-flex align-items-center bn-nav-link">
                                                <span>{{ get_phrase('অন্যান্য') }}</span>
                                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M16.6004 7.45825L11.1671 12.8916C10.5254 13.5333 9.47539 13.5333 8.83372 12.8916L3.40039 7.45825" stroke="#1A1C1F" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round" />
                                                </svg>
                                            </a>
                                            <ul class="nav-dropdown-menu">
                                                <li><a href="#" class="nav-dropdown-item">ফ্রি শিখুন</a>
                                                </li>
                                                <li><a href="#" class="nav-dropdown-item">কোর্সসমূহ</a></li>
                                                <li><a href="#" class="nav-dropdown-item">অন্যান্য</a></li>
                                            </ul>
                                        </li>
                                        <li class="bn-nav-item"><a href="#" class="d-flex align-items-center bn-nav-link">
                                                <span>ফ্রি শিখুন</span>
                                            </a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <!-- offcanvas -->
                        <div class="d-flex align-items-center header-search-wrap">
                            <form action="{{ route('courses') }}" method="get" class="header-search-form">
                                <!-- For Desktop Search -->
                                <div class="header-search d-none d-lg-block">
                                    <label for="header-search" class="form-label">
                                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M9.58366 17.5001C13.9559 17.5001 17.5003 13.9557 17.5003 9.58341C17.5003 5.21116 13.9559 1.66675 9.58366 1.66675C5.2114 1.66675 1.66699 5.21116 1.66699 9.58341C1.66699 13.9557 5.2114 17.5001 9.58366 17.5001Z" stroke="#7C7F84" stroke-width="1.25"
                                                stroke-linecap="round" stroke-linejoin="round" />
                                            <path d="M18.3337 18.3334L16.667 16.6667" stroke="#7C7F84" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                                        </svg>
                                    </label>
                                    <input type="search" class="form-control" id="header-search" name="search" placeholder="{{ get_phrase('আপনি কি শিখতে চান?') }}" @if (request()->has('search')) value="{{ request()->input('search') }}" @endif>
                                    <button type="submit" hidden></button>
                                </div>
                                <!-- For Mobile Search plz check it -->
                                <div class="header-mobile-search d-lg-none d-block">
                                    <label for="header-mobile-search" class="mobile-search-label">
                                        <svg width="19" height="18" viewBox="0 0 19 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M8.69922 16.3125C4.46172 16.3125 1.01172 12.8625 1.01172 8.625C1.01172 4.3875 4.46172 0.9375 8.69922 0.9375C12.9367 0.9375 16.3867 4.3875 16.3867 8.625C16.3867 12.8625 12.9367 16.3125 8.69922 16.3125ZM8.69922 2.0625C5.07672 2.0625 2.13672 5.01 2.13672 8.625C2.13672 12.24 5.07672 15.1875 8.69922 15.1875C12.3217 15.1875 15.2617 12.24 15.2617 8.625C15.2617 5.01 12.3217 2.0625 8.69922 2.0625Z"
                                                fill="#1a1c1f"></path>
                                            <path
                                                d="M16.5743 17.0625C16.4318 17.0625 16.2893 17.01 16.1768 16.8975L13.5743 14.295C13.3568 14.0775 13.3568 13.7175 13.5743 13.5C13.7918 13.2825 14.1518 13.2825 14.3693 13.5L16.9718 16.1025C17.1893 16.32 17.1893 16.68 16.9718 16.8975C16.8593 17.01 16.7168 17.0625 16.5743 17.0625Z"
                                                fill="#1a1c1f"></path>
                                        </svg>
                                    </label>
                                    <div class="mobile-search">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="mobile-search-inner">
                                                        <input type="search" class="form-control" id="header-mobile-search" placeholder="এখানে লিখুন">
                                                        <button type="submit" class="mobile-search-btn">{{ get_phrase('খুঁজুন') }}</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            {{-- new code  --}}
                            <div class="d-flex align-items-center language-and-profile">
                                <select class="bn-nice-select borderless-select">
                                    <option value="English" data-display="ENG">{{ get_phrase('English') }}</option>
                                    <option value="Bangla" data-display="BNG">{{ get_phrase('Bangla') }}</option>
                                </select>
                                @if (isset(auth()->user()->id))
                                    <div class="dropdown">
                                        <button class="dropdown-toggle profile-dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <img src="{{ get_image(Auth()->user()->photo) }}" alt="profile">
                                        </button>
                                        <div class="dropdown-menu profile-dropdown-menu dropdown-menu-end">
                                            <div class="d-flex align-items-start column-gap-10px mb-4">
                                                <div class="image-circle-44px">
                                                    <img src="{{ get_image(Auth()->user()->photo) }}" alt="profile">
                                                </div>
                                                <div>
                                                    <h5 class="dropdown-user-name">{{ ucfirst(Auth()->user()->name) }}
                                                    </h5>
                                                    <p class="dropdown-user-info">{{ ucfirst(Auth()->user()->role) }}
                                                    </p>
                                                </div>
                                            </div>

                                            <ul class="d-flex flex-column gap-2">
                                                @if (in_array(auth()->user()->role, ['admin', 'instructor']))
                                                    <li>
                                                        <a class="profile-dropdown-item active" href="{{ route(auth()->user()->role . '.dashboard') }}">
                                                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <path
                                                                    d="M10.0999 10.65C10.0416 10.6416 9.9666 10.6416 9.89993 10.65C8.43327 10.6 7.2666 9.39998 7.2666 7.92498C7.2666 6.41665 8.48327 5.19165 9.99993 5.19165C11.5083 5.19165 12.7333 6.41665 12.7333 7.92498C12.7249 9.39998 11.5666 10.6 10.0999 10.65Z"
                                                                    stroke="#575757" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                                                                <path
                                                                    d="M15.6181 16.1503C14.1348 17.5086 12.1681 18.3336 10.0014 18.3336C7.83477 18.3336 5.8681 17.5086 4.38477 16.1503C4.4681 15.367 4.9681 14.6003 5.85977 14.0003C8.1431 12.4836 11.8764 12.4836 14.1431 14.0003C15.0348 14.6003 15.5348 15.367 15.6181 16.1503Z"
                                                                    stroke="#575757" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                                                                <path d="M10.0013 18.3337C14.6037 18.3337 18.3346 14.6027 18.3346 10.0003C18.3346 5.39795 14.6037 1.66699 10.0013 1.66699C5.39893 1.66699 1.66797 5.39795 1.66797 10.0003C1.66797 14.6027 5.39893 18.3337 10.0013 18.3337Z"
                                                                    stroke="#575757" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                                                            </svg>
                                                            <span>{{ get_phrase('ড্যাশবোর্ড') }}</span>
                                                        </a>
                                                    </li>
                                                @endif
                                                @if (Auth()->user()->role != 'admin')
                                                    <li>
                                                        <a class="profile-dropdown-item" href="{{ route('my.courses') }}">
                                                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <path
                                                                    d="M18.3337 13.9501V3.89174C18.3337 2.89174 17.517 2.15008 16.5253 2.23341H16.4753C14.7253 2.38341 12.067 3.27508 10.5837 4.20841L10.442 4.30008C10.2003 4.45008 9.80033 4.45008 9.55866 4.30008L9.35033 4.17508C7.86699 3.25008 5.21699 2.36674 3.46699 2.22508C2.47533 2.14174 1.66699 2.89174 1.66699 3.88341V13.9501C1.66699 14.7501 2.31699 15.5001 3.11699 15.6001L3.35866 15.6334C5.16699 15.8751 7.95866 16.7917 9.55866 17.6667L9.59199 17.6834C9.81699 17.8084 10.1753 17.8084 10.392 17.6834C11.992 16.8001 14.792 15.8751 16.6087 15.6334L16.8837 15.6001C17.6837 15.5001 18.3337 14.7501 18.3337 13.9501Z"
                                                                    stroke="#575757" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                                                                <path d="M10 4.57495V17.075" stroke="#575757" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                                                                <path d="M6.45801 7.07495H4.58301" stroke="#575757" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                                                                <path d="M7.08301 9.57495H4.58301" stroke="#575757" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                                                            </svg>
                                                            <span>{{ get_phrase('আমার কোর্স') }}</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a class="profile-dropdown-item" href="{{ route('purchase.history') }}">
                                                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <path
                                                                    d="M7.91699 11.4583C7.91699 12.2666 8.542 12.9166 9.30867 12.9166H10.8753C11.542 12.9166 12.0837 12.3499 12.0837 11.6416C12.0837 10.8833 11.7503 10.6083 11.2587 10.4333L8.75033 9.55828C8.25866 9.38328 7.92533 9.11662 7.92533 8.34995C7.92533 7.64995 8.46699 7.07495 9.13365 7.07495H10.7003C11.467 7.07495 12.092 7.72495 12.092 8.53328"
                                                                    stroke="#575757" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                                                                <path d="M10 6.25V13.75" stroke="#575757" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                                                                <path d="M18.3337 10.0001C18.3337 14.6001 14.6003 18.3334 10.0003 18.3334C5.40033 18.3334 1.66699 14.6001 1.66699 10.0001C1.66699 5.40008 5.40033 1.66675 10.0003 1.66675" stroke="#575757" stroke-width="1.25" stroke-linecap="round"
                                                                    stroke-linejoin="round" />
                                                                <path d="M18.3333 5.00008V1.66675H15" stroke="#575757" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                                                                <path d="M14.167 5.83341L18.3337 1.66675" stroke="#575757" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                                                            </svg>
                                                            <span>{{ get_phrase('ক্রয় ইতিহাস') }}</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a class="profile-dropdown-item" href="#">
                                                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <path
                                                                    d="M16.4912 12.4416C14.7746 14.1499 12.3162 14.6749 10.1579 13.9999L6.23289 17.9166C5.94955 18.2083 5.39122 18.3833 4.99122 18.3249L3.17455 18.0749C2.57455 17.9916 2.01622 17.4249 1.92455 16.8249L1.67455 15.0083C1.61622 14.6083 1.80789 14.0499 2.08289 13.7666L5.99955 9.84994C5.33289 7.68327 5.84955 5.22494 7.56622 3.5166C10.0246 1.05827 14.0162 1.05827 16.4829 3.5166C18.9496 5.97494 18.9496 9.98327 16.4912 12.4416Z"
                                                                    stroke="#575757" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round" />
                                                                <path d="M5.74121 14.575L7.65788 16.4916" stroke="#575757" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round" />
                                                                <path d="M12.083 9.16675C12.7734 9.16675 13.333 8.6071 13.333 7.91675C13.333 7.22639 12.7734 6.66675 12.083 6.66675C11.3927 6.66675 10.833 7.22639 10.833 7.91675C10.833 8.6071 11.3927 9.16675 12.083 9.16675Z" stroke="#575757"
                                                                    stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                                                            </svg>
                                                            <span>{{ get_phrase('পাসওয়ার্ড পরিবর্তন') }}</span>
                                                        </a>
                                                    </li>
                                                @endif
                                                <li>
                                                    <a class="profile-dropdown-item" href="{{ route('logout') }}">
                                                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M7.41699 6.29995C7.67533 3.29995 9.21699 2.07495 12.592 2.07495H12.7003C16.4253 2.07495 17.917 3.56662 17.917 7.29162V12.725C17.917 16.45 16.4253 17.9416 12.7003 17.9416H12.592C9.24199 17.9416 7.70033 16.7333 7.42533 13.7833"
                                                                stroke="#575757" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                                                            <path d="M12.4999 10H3.0166" stroke="#575757" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                                                            <path d="M4.87467 7.20825L2.08301 9.99992L4.87467 12.7916" stroke="#575757" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" />
                                                        </svg>
                                                        <span>{{ get_phrase('লগআউট') }}</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                @else
                            </div>
                            {{-- new code  --}}

                            <a href="{{ route('login') }}" class="btn bn-btn-skin py-2 px-2 px-sm-3 px-md-4 text-nowrap">{{ get_phrase('লগ-ইন') }}</a>
                            @endif

                            <button class="btn bn-btn-skin p-2 d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasResponsive" aria-controls="offcanvasResponsive">
                                <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" x="0" y="0" viewBox="0 0 60.123 60.123" style="enable-background:new 0 0 20 20" xml:space="preserve" class="">
                                    <g>
                                        <path d="M57.124 51.893H16.92a3 3 0 1 1 0-6h40.203a3 3 0 0 1 .001 6zM57.124 33.062H16.92a3 3 0 1 1 0-6h40.203a3 3 0 0 1 .001 6zM57.124 14.231H16.92a3 3 0 1 1 0-6h40.203a3 3 0 0 1 .001 6z" fill="#1a1c1f" opacity="1" data-original="#000000"
                                            class="">
                                        </path>
                                        <circle cx="4.029" cy="11.463" r="4.029" fill="#1a1c1f" opacity="1" data-original="#000000" class=""></circle>
                                        <circle cx="4.029" cy="30.062" r="4.029" fill="#1a1c1f" opacity="1" data-original="#000000" class=""></circle>
                                        <circle cx="4.029" cy="48.661" r="4.029" fill="#1a1c1f" opacity="1" data-original="#000000" class=""></circle>
                                    </g>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
