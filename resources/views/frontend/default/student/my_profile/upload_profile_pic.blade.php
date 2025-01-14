@php
    $user = App\Models\User::where('id', $id)->first();
@endphp
@if ($user)
    <div class="d-flex flex-column align-items-center justify-content-center h-100 py-4 gap-5">
        <div class="preview-image w-50 rounded-circle overflow-hidden">
            <img src="{{ get_image($user->photo) }}" alt="user-photo">
        </div>

        <form action="{{ route('update.profile.picture') }}" method="post" enctype="multipart/form-data">@csrf
            <div class="row align-items-center">
                <div class="col-9">
                    <input type="file" class="form-control" name="photo" id="profile-photo">
                </div>

                <div class="col-3">
                    <button type="submit" class="btn bn-btn-skin">{{ get_phrase('Upload') }}</button>
                </div>
            </div>
        </form>
    </div>
@else
    <p class="py-4">{{ get_phrase('Data not found.') }}</p>
@endif

<script src="{{ asset('assets/frontend/default/js/jquery-3.7.1.min.js') }}"></script>
<script>
    "use strict";
    $(document).ready(function() {
        $('#profile-photo').change(function(e) {
            e.preventDefault();

            var path = URL.createObjectURL(event.target.files[0]);
            $('.preview-image img').attr('src', path);
        });
    });
</script>
