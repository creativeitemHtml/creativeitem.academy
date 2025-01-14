<div class="tab-pane fade @if ($tab == 'forum') show active @endif" id="pills-forum" role="tabpanel" aria-labelledby="pills-forum-tab" tabindex="0">
    <div>
        <div class="mb-20px d-flex align-items-center column-gap-3 row-gap-2 justify-content-between flex-wrap">
            <h4 class="hs-title-20px">{{ get_phrase('There are ____ questions for this objective', count($questions)) }}</h4>
            <a href="#" class="btn bn-btn-skin py-2">
                <img src="{{ asset('assets/frontend/default/images/icon/plus-black-20.svg') }}" alt="plus">
                <span>{{ get_phrase('Ask a question') }}</span>
            </a>
        </div>

        <div>
            @foreach ($questions as $question)
                <div class="single-outer-comment" id="{{ $question->id }}">
                    @php
                        $replies = App\Models\Forum::join('users', 'forums.user_id', 'users.id')
                            ->select('forums.*', 'users.name as user_name', 'users.photo as user_photo')
                            ->latest('forums.id')
                            ->where('forums.parent_id', $question->id)
                            ->get();
                    @endphp

                    @include('course_player.forum.comments', ['comment' => $question, 'type' => 'comment', 'count_replies' => count($replies)])

                    <div class="reply-container"><!-- this using js --></div>

                    <div class="user-replies">
                        @foreach ($replies as $reply)
                            <div class="single-comment-reply">
                                @include('course_player.forum.comments', ['comment' => $reply, 'type' => 'reply'])
                            </div>
                        @endforeach
                    </div>

                </div>
            @endforeach
        </div>


        <h4 class="hs-title-20px mt-3">{{ get_phrase('Share your opinion') }}</h4>

        <form action="{{ route('forum.question.store') }}" method="POST" class="review-form mt-4">
            @csrf
            <input type="hidden" name="course_id" value="{{ $course_details->id }}">
            <textarea class="form-control bn-form-control comment-textarea" name="description" id="textarea" placeholder="{{ get_phrase('Write here...') }}"></textarea>

            <div class="d-flex justify-content-end">
                <button type="submit" class="btn bn-btn-skin py-2 mt-3">{{ get_phrase('Publish') }}</button>
            </div>
        </form>

    </div>
</div>

@push('js')
    <script>
        $(document).ready(function() {

            $('.user-replies').each(function() {
                let $userReplies = $(this);
                let $listItems = $userReplies.find('.single-comment-reply');

                $listItems.each(function(index) {
                    if (index >= 2) {
                        $(this).hide();
                    }
                });
            });

            $('.show-more-btn').on('click', function() {
                $(this).addClass('active');
                $(this).parent().siblings('.user-replies').find('.single-comment-reply').show();
            });


            $('.reply-btn').on('click', function() {
                const comment = $('.single-outer-comment');
                let reviewForm = $('.review-form');
                const parentBox = $(this).closest('.single-outer-comment');
                const replyContainer = parentBox.find('.reply-container');

                comment.find('.reply-container input[name="parent_id"]').remove();
                comment.find('.reply-container').empty();

                replyContainer.empty();
                if (replyContainer.children().length == 0) {
                    replyContainer.append(reviewForm.prop('outerHTML'));
                    replyContainer.find("form").append("<input type='hidden' name='parent_id' value='" + parentBox.attr('id') + "'>");
                    replyContainer.find("form button[type='submit']").text("Reply");
                }
            });

            $('.edit-comment').on('click', function() {
                const editArea = $('.edit-area');
                editArea.empty();

                const currentEditArea = $(this).closest('.comment-item').siblings('.edit-area');

                $.ajax({
                    type: "get",
                    url: "{{ route('forum.question.edit') }}",
                    data: {
                        comment_id: $(this).data('item-id')
                    },
                    success: function(response) {
                        currentEditArea.html(response);
                    }
                });
            });


            $('.like-btn').on('click', function() {
                let button = $(this);
                let url = button.data('url');
                let countSpan = button.find('span:first');

                $.ajax({
                    type: "GET",
                    url: url,
                    success: function(response) {
                        if (response.status === 'success') {
                            button.toggleClass('active', response.active);

                            let currentCount = parseInt(countSpan.text()) || 0;
                            let updatedCount = response.active ? currentCount + 1 : currentCount - 1;

                            countSpan.text(updatedCount > 0 ? updatedCount : '');
                        }
                    }
                });
            });
        });
    </script>
@endpush
