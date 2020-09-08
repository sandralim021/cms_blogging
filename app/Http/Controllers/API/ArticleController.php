<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Article;
use App\Topic;
use App\User;


class ArticleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }
    public function get_topics(){
        return Topic::where('topic_status',1)
                    ->orderBy('topic_name','ASC')
                    ->get(['topic_id','topic_name']);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $user = auth('api')->user();
        $this->validate($request,[
            'title' => 'required|string',
            'topic' => 'required',
            'content' => 'required',
            'article_status' => 'required'
        ]);
        return Article::create([
            'title' => $request['title'],
            'user_id' => $user->id,
            'topic_id' => $request['topic'],
            'content' => $request['content'],
            'article_status' => $request['article_status'] 

        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
