<?php

namespace App\Http\Controllers\API\User;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Topic;

class MainController extends Controller
{
    public function loadArticles(){
        return  DB::table('articles')
                    ->join('topics','articles.topic_id','=','topics.topic_id')
                    ->join('masters','articles.user_id','=','masters.id')
                    ->select('articles.*','topics.topic_name','masters.name')
                    ->where('articles.article_status','=','1')
                    ->latest()
                    ->paginate(10);
    }
    
    public function loadTopics(){
        return Topic::where('topic_status',1)
                    ->orderBy('topic_name','ASC')
                    ->get(['topic_id','topic_name']);
    }
    public function search(){
        if($search = \Request::get('q')){
            $articles = DB::table('articles')
                            ->join('topics','articles.topic_id', '=', 'topics.topic_id')
                            ->join('masters','articles.user_id','=','masters.id')
                            ->select('articles.*','topics.topic_name','masters.name')
                            ->where(function($query) use ($search){
                                $query->where([['articles.title','LIKE',"%$search%"],['articles.article_status','=','1']])
                                    ->orWhere([['topics.topic_name','LIKE',"%$search%"],['articles.article_status','=','1']])
                                    ->orWhere([['articles.content','LIKE',"%$search%"],['articles.article_status','=','1']])
                                    ->orWhere([['masters.name','LIKE',"%$search%"],['articles.article_status','=','1']]);
                            })->latest()->paginate(10);
            
        }else{
            $articles = DB::table('articles')
                            ->join('topics','articles.topic_id', '=', 'topics.topic_id')
                            ->join('masters','articles.user_id','=','masters.id')
                            ->select('articles.*','topics.topic_name','masters.name')
                            ->where('articles.article_status','=','1')
                            ->latest()
                            ->paginate(10);
            
        }

        return $articles;
    }
    public function topicSearch(){
        if($search = \Request::get('topic')){
            $articles = DB::table('articles')
                            ->join('topics','articles.topic_id', '=', 'topics.topic_id')
                            ->join('masters','articles.user_id','=','masters.id')
                            ->select('articles.*','topics.topic_name','masters.name')
                            ->where(function($query) use ($search){
                                $query->where('articles.topic_id','=',$search);
                            })->latest()->paginate(10);
        }
        return $articles;
    }
}
