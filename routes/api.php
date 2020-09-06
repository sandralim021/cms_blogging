<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResources([
    'topic' => 'API\TopicController',
    'article' => 'API\ArticleController'
]);
//Topic
Route::get('findTopic', 'API\TopicController@search');
//Article
Route::get('get_topics', 'API\ArticleController@get_topics');