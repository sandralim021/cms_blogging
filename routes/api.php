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

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::group(['middleware' => ['auth.master','auth:master-api']], function() {
    Route::apiResources([
        'author' => 'API\Master\AuthorController',
        'topic' => 'API\Master\TopicController',
        'article' => 'API\Master\ArticleController'
    ]);
    Route::get('profile', 'API\Master\UserController@profile');
    Route::put('profile', 'API\Master\UserController@updateProfile');
    Route::get('display_users', 'API\Master\UserController@displayUsers');

    //Search
    Route::get('findArticle/{search}', 'API\Master\ArticleController@search');
    Route::get('findAuthor/{search}', 'API\Master\AuthorController@search');
    Route::get('findTopic/{search}', 'API\Master\TopicController@search');
    Route::get('findUser/{search}', 'API\Master\UserController@search');
    //Article
    Route::get('get_topics', 'API\Master\ArticleController@get_topics');
});
//User
Route::group(['middleware' => 'auth:api'], function() {
    Route::get('user/articles', 'API\User\MainController@loadArticles');
    Route::get('user/topics', 'API\User\MainController@loadTopics');
    Route::get('user/findArticle/{search}', 'API\User\MainController@search');
    Route::get('user/TopicSearch/{search}', 'API\User\MainController@topicSearch');
    Route::get('user/view_article/{article_id}', 'API\User\MainController@view_article');
    Route::get('user/profile', 'API\User\MainController@profile');
    Route::put('user/profile', 'API\User\MainController@updateProfile');
    //Like
    Route::post('user/like/like_status/{article_id}','API\User\LikeComController@like_status');
    Route::post('user/like/add_like/{article_id}','API\User\LikeComController@add_like');
    Route::delete('user/like/remove_like/{article_id}','API\User\LikeComController@remove_like');
});

