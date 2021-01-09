<?php

namespace App\Http\Controllers\API\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Like;

class LikeComController extends Controller
{
    public function add_like(Request $request){
        $user_id = auth('api')->user()->id;
        $data = Like::create([
            'article_id' => $request['article_id'],
            'user_id' => $user_id
        ]);

        return response()->json($data);
        
    }
}
