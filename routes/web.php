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


Route::prefix('master')->group(function() {
    Route::get('/','MasterController@index')->name('master.dashboard');
    Route::get('/login','Auth\MasterLoginController@showLogInForm')->name('master.login');
    Route::post('/login','Auth\MasterLoginController@login')->name('master.login.submit');
});
Route::get('{path}', 'HomeController@index')->where('path','([A-z\/_.\d-]+)?');
