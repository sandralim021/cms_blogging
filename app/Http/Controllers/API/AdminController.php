<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\User;
class AdminController extends Controller
{
    public function profile(){
        return auth('api')->user();
    }
}
