@php
    $width = get_player_settings('watermark_width');
    $height = get_player_settings('watermark_height');
    $top = get_player_settings('watermark_top');
    $left = get_player_settings('watermark_left');
    $logo = get_player_settings('watermark_logo');
    $opacity = get_player_settings('watermark_opacity');
@endphp

<div id="watermarkLabelLogo" class="watermark-container" style="position: absolute; width:{{ $width }}px; height:{{ $height }}px; top:{{ $top }}px; left:{{ $left }}px; opacity:.{{ $opacity / 10 }}">
    <img src="{{ get_image($logo) }}" style="width:{{ $width }}px; height:{{ $height }}px;">
</div>
<div id="watermarkStudentInfo" class="watermark-container d-none" style="position: absolute; width:{{ $width }}px; height:{{ $height }}px; top:{{ $top }}px; left:{{ $left }}px; opacity:.{{ $opacity / 10 }}">
    <div class="d-flex">
        <img class="image-30" src="{{ get_image(Auth()->user()->photo) }}" style="width:{{ $width }}px; height:{{ $height }}px;">
        <div class="ps-1">
            <p class="p-0 m-0 text-10px">{{ Auth()->user()->name }}</p>
            <p class="p-0 m-0 text-10px" style="margin-top: -5px !important;">{{ Auth()->user()->email }}</p>
        </div>
    </div>
</div>

<script>
    setInterval(() => {
        $('#watermarkLabelLogo').toggleClass('d-none');
        $('#watermarkStudentInfo').toggleClass('d-none');
    }, 20000);
</script>
