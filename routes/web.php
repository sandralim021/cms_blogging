<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::post('users/logout','Auth\LoginController@user_logout')->name('user.logout');

Route::prefix('master')->group(function() {
    Route::get('/','MasterController@index')->name('master.dashboard');
    Route::get('/login','Auth\MasterLoginController@showLogInForm')->name('master.login');
    Route::post('/login','Auth\MasterLoginController@login')->name('master.login.submit');
    Route::post('/logout','Auth\MasterLoginController@logout')->name('master.logout');
});
//Route::get('{path}', 'MasterController@index')->where('path','([A-z\/_.\d-]+)?');
Route::get('/master/{path?}', function () {
    return redirect()->action('MasterController@index');
})->where('path','([A-z\/_.\d-]+)?');

Route::get('/home/{path?}', function () {
    return redirect()->action('HomeController@index');
})->where('path', '([A-z\/_.\d-]+)?');