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
    Route::get('findArticle', 'API\Master\ArticleController@search');
    Route::get('findAuthor', 'API\Master\AuthorController@search');
    Route::get('findTopic', 'API\Master\TopicController@search');
    Route::get('findUser', 'API\Master\UserController@search');
    //Article
    Route::get('get_topics', 'API\Master\ArticleController@get_topics');
});
//User
Route::group(['middleware' => 'auth:api'], function() {
    Route::get('user/articles', 'API\User\MainController@loadArticles');
    Route::get('user/topics', 'API\User\MainController@loadTopics');
    Route::get('user/findArticle', 'API\User\MainController@search');
    Route::get('user/TopicSearch', 'API\User\MainController@topicSearch');
});

