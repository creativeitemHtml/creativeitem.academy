<script>
    "use strict";

    $(document).ready(function() {
        $('.flexCheckChecked').on('click', function(e) {
            const id = $(this).attr('id');
            $('#watch_history_form .lesson_id').val(id);
            $('#watch_history_form').trigger('submit');
        });

        $('#fullscreen').on('click', function(e) {
            e.preventDefault();
            $('#player_content').toggleClass('col-xl-8 col-lg-7 col-12');
            $('#player_side_bar').toggleClass('col-xl-4 col-lg-5 col-12');
        });

        function initializeSummernote() {
            $('textarea#summernote').summernote({
                height: 180,
                minHeight: null,
                maxHeight: null,
                focus: true,
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
    });

    var formElement;
    if ($('.ajaxForm:not(.initialized)').length > 0) {
        $('.ajaxForm:not(.initialized)').ajaxForm({
            beforeSend: function(data, form) {
                var formElement = $(form);
            },
            uploadProgress: function(event, position, total, percentComplete) {},
            complete: function(xhr) {

            },
        });
        $('.ajaxForm:not(.initialized)').addClass('initialized');
    }

    $('.tagify:not(.inited)').each(function(index, element) {
        var tagify = new Tagify(element, {
            placeholder: '{{ get_phrase('Enter your keywords') }}'
        });
        $(element).addClass('inited');
    });

    $(document).ready(function() {
        var iframeWidth = $('.embed-responsive-item').width();
        var iframeHeight = (iframeWidth / 100) * 56;
        $('.embed-responsive-item').height(iframeHeight + 'px');
    });
</script>

@if (get_player_settings('watermark_type') == 'js')
    <script>
        // append watermark in player
        function prependWatermark() {
            $.ajax({
                type: "get",
                url: "{{ route('player.prepend.watermark') }}",
                success: function(response) {
                    if (response) {
                        $('.plyr__video-wrapper').prepend(response);
                    }
                }
            });
        }

        setInterval(() => {
            if ($('.plyr__video-wrapper .watermark-container').length == 0) {
                prependWatermark();
            }
        }, 5000);
    </script>
@endif
