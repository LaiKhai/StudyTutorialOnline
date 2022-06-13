<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\SinhVienController;
use App\Http\Controllers\GiangVienController;
use App\Http\Controllers\LopController;
use App\Http\Controllers\ChucVuController;
use App\Http\Controllers\LoaiBaiTapController;
use App\Http\Controllers\KhoaController;
use App\Http\Controllers\LopHocPhanController;
use App\Http\Controllers\BoMonController;


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

Route::post('dksv', [AuthController::class, 'dangKySinhVien']);
Route::post('dkgv', [AuthController::class, 'dangKyGiangVien']);
Route::post('dnsv', [AuthController::class, 'dangNhapSinhVien']);
Route::post('dngv', [AuthController::class, 'dangNhapGiangVien']);
Route::post('/sinhvien/import', [SinhVienController::class, 'import']);
Route::middleware(['auth:sanctum'])->group(function () {
    Route::apiResource('sinhvien', SinhVienController::class);
    Route::apiResource('giangvien', GiangVienController::class);
    Route::apiResource('chucvu', ChucVuController::class);
    Route::apiResource('lop', LopController::class);
    Route::apiResource('loaibaitap', LoaiBaiTapController::class);
    Route::apiResource('khoa', KhoaController::class);
    Route::apiResource('lophocphan', LopHocPhanController::class);
    Route::apiResource('bomon', BoMonController::class);
});