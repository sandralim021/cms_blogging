<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Topic;

class TopicController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Topic::where('topic_status',1)
                        ->latest()
                        ->paginate(10);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'topic_name' => 'required|string'
        ]);
        return Topic::create([
            'topic_name' => $request['topic_name']
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
        $this->validate($request,[
            'topic_name' => 'required|string'
        ]);

        return Topic::where('topic_id', $id)->update($request->all());
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return Topic::where('topic_id', $id)
                    ->update(['topic_status' => 0]);
    }
    public function search(){
        if ($search = \Request::get('q')) {
            $topics = Topic::where(function($query) use ($search){
                $query->where([['topic_name','LIKE',"%$search%"],['topic_status','=','1']]);
            })->latest()->paginate(10);
        }else{
            $topics = Topic::where('topic_status',1)
                                ->latest()
                                ->paginate(10);
        }

        return $topics;
    }
}
