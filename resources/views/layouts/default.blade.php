<!DOCTYPE html>
<html lang="en">

<head>
    @include('layouts.seo')
    @stack('meta')

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />

    <link rel="stylesheet" type="text/css" href="{{ asset('assets/global/icons/uicons-solid-rounded/css/uicons-solid-rounded.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/global/icons/uicons-bold-rounded/css/uicons-bold-rounded.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/global/icons/uicons-bold-straight/css/uicons-bold-straight.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/global/icons/uicons-regular-rounded/css/uicons-regular-rounded.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/global/icons/uicons-thin-rounded/css/uicons-thin-rounded.css') }}" />

    <link rel="stylesheet" href="{{ asset('assets/frontend/default/vendors/bootstrap/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/frontend/default/icons/uicons-regular-rounded/css/uicons-regular-rounded.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/frontend/default/vendors/rprogressbar/jquery.rprogessbar.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/frontend/default/vendors/plyr/plyr.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/frontend/default/vendors/swiper/swiper-bundle.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/frontend/default/vendors/nice-select/nice-select.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/global/tagify-master/dist/tagify.css') }}" />

    <link rel="stylesheet" href="{{ asset('assets/frontend/default/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/frontend/default/css/responsive.css') }}">

    <script src="{{ asset('assets/frontend/default/js/jquery-3.7.1.min.js') }}"></script>
    @stack('css')

</head>

<body>
    @php $current_route_name = Route::currentRouteName(); @endphp
    @php
        $demo = '';
        if (session('home')) {
            $home_page = App\Models\Builder_page::where('id', session('home'))->firstOrNew();
        } else {
            $home_page = App\Models\Builder_page::where('status', 1)->firstOrNew();
        }
    @endphp

    @if ($home_page->is_permanent == 1)
        @include('components.home_made_by_developer.top_bar')
        @include('components.home_made_by_developer.header')
        <section>
            @yield('content')
        </section>
        @include('components.home_made_by_developer.footer')
    @else
        @if ($current_route_name == 'home' || $current_route_name == 'admin.page.preview')
            <section>
                @yield('content')
            </section>
        @else
            @php $builder_files = $home_page->html ? json_decode($home_page->html, true) : []; @endphp
            @if (in_array('top_bar', $builder_files))
                @include('components.home_made_by_builder.top_bar')
            @endif

            @if (in_array('header', $builder_files))
                @include('components.home_made_by_builder.header')
            @endif

            <section>
                @yield('content')
            </section>

            @if (in_array('footer', $builder_files))
                @include('components.home_made_by_builder.footer')
            @endif
        @endif
    @endif

    <script src="{{ asset('assets/frontend/default/vendors/bootstrap/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/frontend/default/vendors/plyr/plyr.js') }}"></script>
    <script src="{{ asset('assets/frontend/default/vendors/swiper/swiper-bundle.min.js') }}"></script>
    <script src="{{ asset('assets/frontend/default/vendors/rprogressbar/jquery.waypoints.js') }}"></script>
    <script src="{{ asset('assets/frontend/default/vendors/rprogressbar/jQuery.rProgressbar.min.js') }}"></script>
    <script src="{{ asset('assets/frontend/default/vendors/nice-select/jquery.nice-select.min.js') }}"></script>
    <script src="{{ asset('assets/global/tagify-master/dist/tagify.min.js') }}"></script>


    <script src="{{ asset('assets/frontend/default/js/script.js') }}"></script>

    <!-- End Footer -->
    @include('frontend.default.modal')
    <!-- toster file -->
    @include('frontend.default.toaster')
    <!-- custom scripts -->
    @include('frontend.default.scripts')
    @stack('js')
</body>

</html>
