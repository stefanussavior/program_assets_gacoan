<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Middleware\RoleMiddleware;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\LoginController;

// Show the login form
// Route::get('/', [LoginController::class, 'IndexLogin']);
// Route::post('/login', [LoginController::class, 'Login'])->name('login');
// Route::get('/logout', [LoginController::class,'logout']);

Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();

Route::get('/home', [HomeController::class, 'index'])->name('home');

Route::group(['middleware' => ['auth']], function(){
    Route::resource('roles', RoleController::class);
    Route::resource('users', UserController::class);
    Route::resource('products', ProductController::class);
});




// Route::group([RoleMiddleware::class => ':admin'], function(){
//     Route::get('/admin/dashboard', [AdminController::class, 'index']);

//     //Asset Route
//     Route::get('/admin/halaman_asset', [AdminController::class, 'HalamanAsset']);
//     Route::get('/admin/GetDataAsset', [AdminController::class, 'GetDataAsset']);
//     Route::get('/admin/get_detail_data_asset/{id}', [AdminController::class, 'GetDetailDataAsset']);
//     Route::post('/admin/add_data_asset', [AdminController::class, 'AddDataAsset']);
    
// });

// Route::group([RoleMiddleware::class => ':user'], function(){
//     Route::get('/user/dashboard', [UserController::class, 'dashboard']);
// });






