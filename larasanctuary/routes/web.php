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

Route::get('/', 'PageController@index');

Route::get('/about', 'PageController@about');

Route::resource('animals', 'AnimalController');

// helper class, generates all routes for user authentication
Auth::routes();

// assigns the /dashboard URIs to DashboardController with index function. This route is also named as Dashboard
Route::get('/dashboard', 'DashboardController@index')->name('dashboard');
