<form action="{{ route('forum.question.update', $comment->id) }}" method="POST" class="review-form my-3">
    @csrf
    <textarea class="form-control bn-form-control comment-textarea" name="description" id="textarea" placeholder="{{ get_phrase('Write here...') }}">{{ $comment->description }}</textarea>

    <div class="d-flex justify-content-end">
        <button type="submit" class="btn bn-btn-skin py-2 mt-3">{{ get_phrase('Update') }}</button>
    </div>
</form>
