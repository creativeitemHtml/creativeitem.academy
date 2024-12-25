$(document).ready(function () {
    var $player1 = $('.video-player'),
        $niceSelect1 = $('.bn-nice-select');

    // Video Player
    if ($player1.length > 0) {
        const player = new Plyr('.video-player');
    }

    // Nice Select
    if ($niceSelect1.length > 0) {
        // add nice select js file then uncomment the bellow code
        $('.bn-nice-select').niceSelect();
    }



    // Mobile Search Toggle
    const searchContainer = $(".header-mobile-search");
    const searchToggle = $(".mobile-search-label");
    const searchWrap = $(".mobile-search");
    if (searchToggle.length) {
        searchToggle.on("click", function (event) {
            event.stopPropagation();
            searchWrap.toggleClass("active");
            searchToggle.toggleClass("active");
            // focus
            setTimeout(function () {
                $('.mobile-search-inner .form-control').focus();
            }, 100);
        });
    }
    $(document).on("click", function (event) {
        const target = $(event.target);
        if (searchContainer.length && !searchContainer.is(target) && !searchContainer.has(target).length) {
            searchWrap.removeClass("active");
            if (searchToggle.length) {
                searchToggle.removeClass("active");
            }
        }
    });




    // Mobile Accordion Menu
    $('.nav-item-have-sub > .bn-nav-link').click(function () {
        if (parseInt($(window).width()) < 992) {
            $(this).parent().toggleClass("active");
            $(this).siblings(".nav-dropdown-menu").slideToggle();
            $(".nav-item-have-sub").not($(this).parent()).removeClass("active");
            $(".nav-dropdown-menu").not($(this).siblings()).slideUp();
        }
    });


    // For Breadcrumb BG Height
    var breadbgheight = $('.breadcrumb-height').height();
    $('.cd-sidebar-margin').css('margin-top', -(breadbgheight - 20) + 'px');


    // Progressbar jquery
    $(".bn-progress").each(function () {
        var datacount = $(this).attr("data-skill");
        $(this).rProgressbar({
            percentage: datacount,
            fillBackgroundColor: '#4977E5'
        });
    });

    // Password Show Hide
    $(".toggle-password").click(function () {
        $(this).toggleClass("lock unlock");
        var input = $($(this).attr("toggle"));
        if (input.attr("type") == "password") {
            input.attr("type", "text");
        } else {
            input.attr("type", "password");
        }
    });


    // For Video List Checkbox
    $(".tutorial-list-item.complete").find('.checkbox-radio-check-input').prop('checked', true);



});

$(document).ready(function () {


    let rating_stars = $('.rating-stars i');

    rating_stars.click(function (e) {
        e.preventDefault();
        let star = $(this).attr('id').substring(3);
        console.log(star);

        $('.write-review input[name="rating"]').val(star);

        rating_stars.removeClass('fa').addClass('fa-regular');
        for (let i = 1; i <= star; i++) {
            $('#id-' + i).removeClass('fa-regular').addClass('fa');
        }
    });

    $('#remove-stars').click(function (e) {
        e.preventDefault();
        rating_stars.removeClass('fa fa-regular').addClass('fa-regular');
        $('.write-review input[name="rating"]').val(0);
    });

    $('#see-more').click(function (e) {
        e.preventDefault();
        $(this).toggleClass('active');

        let items = $('.reviews .E-review').length;

        if ($(this).hasClass('active')) {
            $('.reviews').css('max-height', (items * 189) + 'px');
            $(this).text('Show Less');
        } else {
            $('.reviews').css('max-height', 910 + 'px');
            $(this).html('Show More <i class="fa-solid fa-chevron-right"></i>');
        }
    });
});


// Tooltip
const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

// Testimonial
var swiper1 = new Swiper('.bn-slider', {
    slidesPerView: 1,
    loop: true,
    spaceBetween: 24,
    keyboard: true,
    autoplay: {
        delay: 2000,
        pauseOnMouseEnter: true,
        disableOnInteraction: false,
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
    breakpoints: {
        576: {
            slidesPerView: 1.5,
        },
        768: {
            slidesPerView: 2,
        },
        992: {
            slidesPerView: 2.5,
        },
    },
});
