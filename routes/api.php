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
        'author' => 'API\AuthorController',
        'topic' => 'API\TopicController',
        'article' => 'API\ArticleController'
    ]);
    Route::get('profile', 'API\ProfileController@profile');
    Route::put('profile', 'API\ProfileController@updateProfile');
    Route::get('display_users', 'API\ProfileController@displayUsers');

    //Search
    Route::get('findArticle', 'API\ArticleController@search');
    Route::get('findAuthor', 'API\AuthorController@search');
    Route::get('findTopic', 'API\TopicController@search');
    Route::get('findUser', 'API\ProfileController@search');
    //Article
    Route::get('get_topics', 'API\ArticleController@get_topics');
});

