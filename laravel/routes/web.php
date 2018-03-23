<?php

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

Route::middleware(['Auth'])->group(function(){
    Route::namespace('Admin')->group(function(){
        
    });

    Route::namespace('Customer')->group(function(){

    });
});


Route::get('/', 'HomeController@index')->name('home');
Route::get('/login', 'Auth\LoginController@index')->name('login');
Route::post('/login', 'Auth\LoginController@index')->name('logincheck');
Route::get('/logout', 'Auth\LoginController@logout')->name('logout');
Route::get('/forgotpassword', 'Auth\ForgotPasswordController@index')->name('password.request');
Route::get('/register', 'Auth\RegisterController@index')->name('register');
Route::post('/register', 'Auth\RegisterController@register')->name('registercheck');
