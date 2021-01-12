<?php

namespace App\Http\Controllers\API\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Like;

class LikeComController extends Controller
{

    public function like_status($article_id){
        $user_id = auth('api')->user()->id;
        $like_query = DB::table('likes')
                            ->where('article_id', '=', $article_id)
                            ->where('user_id', '=', $user_id);
        $like_count = DB::table('likes')
                        ->where('article_id', '=', $article_id)
                        ->count();
        if($like_query->exists()){
            return response()->json(['status' => 1, 'like_count' => $like_count]);
        }else if($like_query->doesntExist()){
            return response()->json(['status' => 0, 'like_count' => $like_count]);
        }
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
