<div class="d-flex align-items-center column-gap-3 row-gap-2 justify-content-between mb-3 comment-item">

    <div class="d-flex align-items-center gap-2">
        <div class="image-circle-40px">
            <img src="{{ get_image($comment->user_photo) }}" alt="user">
        </div>
        <div class="d-flex align-items-start column-gap-2 row-gap-1 flex-wrap flex-column flex-sm-row">
            <h5 class="hs-subtitle-14px fw-semibold user-name">{{ $comment->user_name }}</h5>
            <p class="comment-time">{{ timeAgo($comment->created_at) }}</p>
        </div>
    </div>

    <div class="dropdown">
        <button class="btn dropdown-toggle icon-dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M11.6667 4.16667C11.6667 3.25 10.9167 2.5 10.0001 2.5C9.08341 2.5 8.33341 3.25 8.33341 4.16667C8.33341 5.08333 9.08341 5.83333 10.0001 5.83333C10.9167 5.83333 11.6667 5.08333 11.6667 4.16667Z" stroke="#1A1C1F" stroke-width="1.25"></path>
                <path d="M11.6667 15.8334C11.6667 14.9167 10.9167 14.1667 10.0001 14.1667C9.08341 14.1667 8.33341 14.9167 8.33341 15.8334C8.33341 16.7501 9.08341 17.5001 10.0001 17.5001C10.9167 17.5001 11.6667 16.7501 11.6667 15.8334Z" stroke="#1A1C1F" stroke-width="1.25">
                </path>
                <path d="M11.6667 9.99992C11.6667 9.08325 10.9167 8.33325 10.0001 8.33325C9.08341 8.33325 8.33341 9.08325 8.33341 9.99992C8.33341 10.9166 9.08341 11.6666 10.0001 11.6666C10.9167 11.6666 11.6667 10.9166 11.6667 9.99992Z" stroke="#1A1C1F" stroke-width="1.25">
                </path>
            </svg>
        </button>


        <ul class="dropdown-menu dropdown-menu-end bn-dropdown-menu">
            <li>
                <button type="button" class="dropdown-item bn-dropdown-item edit-comment" data-item-id="{{ $comment->id }}">
                    <i class="fi fi-rr-edit"></i>
                    <span>{{ get_phrase('Edit') }}</span>
                </button>
            </li>
            <li>
                <a href="#" onclick="confirmModal('{{ route('forum.question.delete', $comment->id) }}')" class="dropdown-item bn-dropdown-item">
                    <i class="fi fi-rr-trash"></i>
                    <span>{{ get_phrase('Delete') }}</span>
                </a>
            </li>
        </ul>

    </div>
</div>

<p class="hs-subtitle-16px bn-text-body @if ($type == 'reply') mb-3 @endif">{{ $comment->description }}</p>

@if ($type == 'comment')
    <div class="d-flex align-items-start column-gap-2 row-gap-1 flex-wrap mt-3 review-actions">
        <div class="d-flex align-items-center column-gap-3 row-gap-1 flex-wrap">

            @php
                $likes = $question->likes ? json_decode($question->likes, true) : [];
                $dislikes = $question->dislikes ? json_decode($question->dislikes, true) : [];
            @endphp

            <button type="button" class="hs-subtitle-14px bn-text-body bn2-link d-flex align-items-center gap-1 bn2-stroke-transparent-hover like-btn @if (in_array(auth()->user()->id, $likes)) active @endif" data-url="{{ route('forum.question.likes', $comment->id) }}">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M6.2334 15.2917L8.81673 17.2917C9.15006 17.625 9.90006 17.7917 10.4001 17.7917H13.5667C14.5667 17.7917 15.6501 17.0417 15.9001 16.0417L17.9001 9.95835C18.3167 8.79168 17.5667 7.79168 16.3167 7.79168H12.9834C12.4834 7.79168 12.0667 7.37501 12.1501 6.79168L12.5667 4.12501C12.7334 3.37501 12.2334 2.54168 11.4834 2.29168C10.8167 2.04168 9.9834 2.37501 9.65006 2.87501L6.2334 7.95835"
                        stroke="#575757" stroke-width="1.25" stroke-miterlimit="10" />
                    <path d="M1.9834 15.2916V7.12496C1.9834 5.95829 2.4834 5.54163 3.65007 5.54163H4.4834C5.65006 5.54163 6.15007 5.95829 6.15007 7.12496V15.2916C6.15007 16.4583 5.65006 16.875 4.4834 16.875H3.65007C2.4834 16.875 1.9834 16.4583 1.9834 15.2916Z" stroke="#575757" stroke-width="1.25"
                        stroke-linecap="round" stroke-linejoin="round" />
                </svg>
                <span>{{ count($likes) > 0 ? format_count(count($likes)) : '' }}</span>
                <span>{{ get_phrase('Like') }}</span>
            </button>


            <button type="button" class="hs-subtitle-14px bn-text-body bn2-link d-flex align-items-center gap-1 reply-btn">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M5.87435 10.1253L7.91602 12.167C8.06879 12.3198 8.14518 12.4969 8.14518 12.6982C8.14518 12.8996 8.06879 13.08 7.91602 13.2395C7.76324 13.3856 7.58615 13.4587 7.38477 13.4587C7.18338 13.4587 7.00629 13.3823 6.85352 13.2295L3.52018 9.89616C3.3674 9.74844 3.29102 9.57609 3.29102 9.37912C3.29102 9.18215 3.3674 9.00727 3.52018 8.85449L6.85352 5.52116C7.00629 5.36838 7.18454 5.29199 7.38824 5.29199C7.59194 5.29199 7.76786 5.36838 7.91602 5.52116C8.06879 5.66931 8.14518 5.84524 8.14518 6.04893C8.14518 6.25264 8.06879 6.43088 7.91602 6.58366L5.87435 8.62533H12.9993C14.106 8.62533 15.0493 9.01533 15.8293 9.79533C16.6094 10.5753 16.9993 11.5187 16.9993 12.6253V14.8753C16.9993 15.0878 16.9279 15.266 16.785 15.4097C16.6421 15.5535 16.465 15.6253 16.2537 15.6253C16.0425 15.6253 15.8639 15.5535 15.7181 15.4097C15.5723 15.266 15.4993 15.0878 15.4993 14.8753V12.6253C15.4993 11.9309 15.2563 11.3406 14.7702 10.8545C14.2841 10.3684 13.6938 10.1253 12.9993 10.1253H5.87435Z"
                        fill="#575757" />
                </svg>
                <span>{{ get_phrase('Reply') }}</span>
            </button>

        </div>

        @if ($count_replies > 2)
            <button type="button" class="hs-subtitle-14px bn-text-body bn2-link more-reply-after show-more-btn">{{ get_phrase('Show more replies') }}</button>
        @endif
    </div>
@endif

<div class="edit-area"></div>
