<?php

use App\Http\Controllers\NomineeController;
use App\Http\Controllers\VoteController;
use App\Http\Controllers\NomineeVoteController;
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

Route::get('/nominee', [NomineeController::class, 'index']);
Route::post('/nominee', [NomineeController::class, 'store']);

Route::get('/voters', [VoteController::class, 'index']);
Route::post('/voters', [VoteController::class, 'store']);

Route::get('/nominee-vote', [NomineeVoteController::class, 'index']);
Route::post('/nominee-vote', [NomineeVoteController::class, 'store']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
