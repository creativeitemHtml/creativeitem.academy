<?php

namespace App\Http\Controllers;

use App\Models\Forum;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class ForumController extends Controller
{
    public function index(Request $request)
    {
        $page_data['questions'] = Forum::join('users', 'forums.user_id', 'users.id')
            ->select('forums.*', 'users.name as user_name', 'users.photo as user_photo')
            ->latest('forums.id')
            ->where('forums.parent_id', 0)
            ->where('forums.course_id', $request->course_id)
            ->get();
        return view('course_player.forum.question_body', $page_data);
    }
    public function create(Request $request)
    {
        $page_data['course_id']          = $request->course_id;
        $page_data['parent_question_id'] = $request->parent_question_id;
        return view('course_player.forum.create_question', $page_data);
    }

    public function store(Request $request)
    {
        $request->validate([
            'description' => 'required|string',
            'parent_id'   => 'nullable|numeric',
        ]);

        $data['description'] = strip_tags($request->description);
        $data['user_id']     = auth()->user()->id;
        $data['course_id']   = $request->course_id;
        $data['parent_id']   = $request->parent_id ?? 0;

        Forum::insert($data);
        Session::flash('success', get_phrase($request->has('parent_id') ? 'Reply added successfully.' : 'Question added successfully.'));
        return redirect()->back();
    }

    public function edit(Request $request)
    {
        $page_data['comment'] = Forum::where('id', $request->comment_id)->first();
        return view('course_player.forum.edit_comment', $page_data);
    }

    public function delete($id)
    {
        $query = Forum::where('user_id', auth()->user()->id)->where('id', $id);

        if ($query->doesntExist()) {
            Session::flash('error', get_phrase('Data not found.'));
        } else {
            $query->delete();
            Session::flash('success', get_phrase('Question deleted successfully.'));
        }

        return redirect()->back();
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'description' => 'required|string',
            'parent_id'   => 'nullable|numeric',
        ]);

        $data['description'] = strip_tags($request->description);

        Forum::where('id', $id)->update($data);
        Session::flash('success', get_phrase($request->has('parent_id') ? 'Reply updated successfully.' : 'Question updated successfully.'));
        return redirect()->back();
    }

    public function likes($id)
    {
        $question = Forum::where('id', $id)->first();
        $user_id  = auth()->user()->id;
        $likes    = $question->likes ? json_decode($question->likes, true) : [];

        if (in_array($user_id, $likes)) {
            $active = false;
            $likes  = self::rmv_item($likes, $user_id);
            Session::flash('success', get_phrase('Your like has been removed.'));
        } else {
            $active = true;
            array_push($likes, $user_id);
            Session::flash('success', get_phrase('Your like has been added.'));
        }
        $data['likes'] = count($likes) > 0 ? json_encode($likes) : null;

        // remove dislike is there is any dislike
        $dislikes = $question->dislikes ? json_decode($question->dislikes, true) : [];
        if (in_array($user_id, $dislikes)) {
            $dislikes         = self::rmv_item($dislikes, $user_id);
            $data['dislikes'] = count($dislikes) > 0 ? json_encode($dislikes) : null;
        }

        Forum::where('id', $id)->update($data);
        return response()->json(['status' => 'success', 'active' => $active]);
    }

    public function dislikes($id)
    {
        $question = Forum::where('id', $id)->first();
        $user_id  = auth()->user()->id;
        $dislikes = $question->dislikes ? json_decode($question->dislikes, true) : [];

        if (in_array($user_id, $dislikes)) {
            $dislikes = self::rmv_item($dislikes, $user_id);
            Session::flash('success', get_phrase('Your changes has been saved.'));
        } else {
            array_push($dislikes, $user_id);
            Session::flash('success', get_phrase('Your changes has been saved.'));
        }
        $data['dislikes'] = count($dislikes) > 0 ? json_encode($dislikes) : null;

        // remove like is there is any like
        $likes = $question->likes ? json_decode($question->likes, true) : [];
        if (in_array($user_id, $likes)) {
            $likes         = self::rmv_item($likes, $user_id);
            $data['likes'] = count($likes) > 0 ? json_encode($likes) : null;
        }

        Forum::where('id', $id)->update($data);
        return redirect()->back();
    }

    public static function rmv_item($arr = [], $user_id)
    {
        $pos = array_search($user_id, $arr);
        array_splice($arr, $pos, 1);
        return $arr;
    }

    public function tab_active(Request $request)
    {
        $tab = explode('#pills-', $request->tab)[1];
        Session::put('forum_tab', $tab);
    }
}
