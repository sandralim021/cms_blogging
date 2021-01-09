<?php

namespace App\Http\Controllers\API\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Like;

class LikeComController extends Controller
{
    public function like_status(){
        $user_id = auth('api')->user()->id;
        return DB::table('likes')
            ->where('article_id', '=', $article_id)
            ->where('user_id', '=', $user_id)
            ->get();
    }
    public function add_like($article_id){
        $user_id = auth('api')->user()->id;
        $data = Like::create([
            'article_id' => $article_id,
            'user_id' => $user_id
        ]);

        return response()->json($data);
        
    }

    public function remove_like($article_id){
        $user_id = auth('api')->user()->id;
        return DB::table('likes')
                    ->where('article_id', '=', $article_id)
                    ->where('user_id', '=', $user_id)
                    ->delete();
        
    }
}
