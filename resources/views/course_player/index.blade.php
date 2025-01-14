<!DOCTYPE html>
<html lang="en">

<head>
    <title>{{ get_phrase('Course Playing Page') }} | {{ config('app.name') }}</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta content="" name="description" />
    <meta content="" name="author" />

    <link rel="shortcut icon" href="{{ asset(get_frontend_settings('favicon')) }}" />
    <link rel="stylesheet" href="{{ asset('assets/frontend/default/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/global/course_player/vendors/fontawesome/fontawesome.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/global/plyr/plyr.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/global/course_player/css/style.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/global/course_player/css/custom.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/global/icons/uicons-bold-rounded/css/uicons-bold-rounded.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/global/icons/uicons-bold-straight/css/uicons-bold-straight.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/global/icons/uicons-regular-rounded/css/uicons-regular-rounded.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/global/icons/uicons-solid-rounded/css/uicons-solid-rounded.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/global/icons/uicons-solid-rounded/css/uicons-solid-rounded.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/global/summernote/summernote.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/global/tagify-master/dist/tagify.css') }}" />


    <link rel="shortcut icon" href="{{ asset('assets/frontend/default/images/favicon.svg') }}" type="image/x-icon">
    <link rel="stylesheet" href="{{ asset('assets/frontend/default/vendors/bootstrap/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/frontend/default/icons/uicons-regular-rounded/css/uicons-regular-rounded.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/frontend/default/vendors/plyr/plyr.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/frontend/default/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/frontend/default/css/responsive.css') }}">

</head>

<body>

    @include('course_player.header')

    <section class="mb-80px mt-20px">
        <div class="container-fluid">
            <div class="row g-4">

                <div class="col-xl-8 col-lg-7" id="player_content">
                    <div class="bn-video-player-wrap mb-20px overflow-hidden">
                        <div class="plyr__video-embed video-player">
                            @include('course_player.player_page')
                        </div>
                    </div>
                    @include('course_player.tab_bar')
                </div>


                <div class="col-xl-4 col-lg-5" id="player_side_bar">
                    @include('course_player.side_bar')
                </div>
            </div>
        </div>
    </section>

    <script src="{{ asset('assets/frontend/default/js/jquery-3.7.1.min.js') }}"></script>
    <script src="{{ asset('assets/frontend/default/vendors/bootstrap/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/frontend/default/vendors/plyr/plyr.js') }}"></script>
    <script src="{{ asset('assets/frontend/default/js/script.js') }}"></script>

    @include('frontend.default.modal')
    @include('frontend.default.toaster')

    @include('course_player.init')
    @stack('js')
</body>

</html>
