<?php

namespace App\Http\Controllers\API\User;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Article;

class MainController extends Controller
{
    public function loadArticles(){
        return  DB::table('articles')
                    ->join('topics','articles.topic_id','=','topics.topic_id')
                    ->join('masters','articles.user_id','=','masters.id')
                    ->select('articles.*','topics.topic_name','masters.name')
                    ->latest()
                    ->paginate(10);
    }
}
