<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BaiKiemTraController;
use App\Http\Controllers\BaiTapController;
use App\Http\Controllers\BaiVietController;
use App\Http\Controllers\SinhVienController;
use App\Http\Controllers\GiangVienController;
use App\Http\Controllers\LopController;
use App\Http\Controllers\ChucVuController;
use App\Http\Controllers\LoaiBaiTapController;
use App\Http\Controllers\KhoaController;
use App\Http\Controllers\LopHocPhanController;
use App\Http\Controllers\BoMonController;
use App\Http\Controllers\LoaiBaiVietController;
use App\Http\Controllers\DSSinhVienController;
use App\Http\Controllers\DSGiangVienController;
use App\Http\Controllers\FileController;
use App\Models\DS_GiangVien;

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
Route::post('login', [AuthController::class, 'loginUser']);
Route::post('dngv', [AuthController::class, 'dangNhapGiangVien']);
Route::post('admin', [AuthController::class, 'dangNhapAdmin']);
Route::post('/sinhvien/import', [SinhVienController::class, 'import']);
Route::get('/sinhvien/export', [SinhVienController::class, 'export']);
//Lay danh sach lop theo id sinh vien
Route::get('/lop/lstWithIdSV', [LopController::class, 'LstLopWithIdSV']);
//Tao Danh sach sinh vien auto
Route::get('/dssv/createDSSV', [DSSinhVienController::class, 'createDSSVWithSinhVien']);
//Tao Danh sach giang vien auto
Route::post('/dsgv/createDSGV', [DSGiangVienController::class, 'createDSSVWithGiangVien']);
//Lay danh sach lop hoc phan theo id sinh vien
Route::get('/lophocphanwithsinhvien/{id}', [SinhVienController::class, 'lophocphanwithsinhvien']);
//Lay danh sach lop hoc phan theo id giang vien
Route::get('/lophocphanwithgiangvien/{id}', [GiangVienController::class, 'lophocphanwithgiangvien']);
//bat dau kiem tra
Route::get('/lophocphanwithgiangvien/{id}', [GiangVienController::class, 'lophocphanwithgiangvien']);
//lấy danh sách bài viết theo lớp học phần
Route::get('/listbaiviet/{id}', [LopHocPhanController::class, 'ListBaiViet']);
//lấy danh sách bài viết theo lớp học phần
Route::get('/listbaikiemtra/{id}', [LopHocPhanController::class, 'ListBaiKiemTra']);

//Dowload file
Route::get('/dowloadfile/{filename}', [FileController::class, 'dowloadFile']);

Route::apiResource('chucvu', ChucVuController::class);
Route::apiResource('sinhvien', SinhVienController::class);
Route::apiResource('giangvien', GiangVienController::class);
Route::apiResource('lop', LopController::class);
Route::apiResource('loaibaitap', LoaiBaiTapController::class);
Route::apiResource('khoa', KhoaController::class);
Route::apiResource('lophocphan', LopHocPhanController::class);
Route::apiResource('bomon', BoMonController::class);
Route::apiResource('baitap', BaiTapController::class);
Route::apiResource('baikiemtra', BaiKiemTraController::class);
Route::apiResource('loaibaitap', LoaiBaiTapController::class);
Route::apiResource('dssv', DSSinhVienController::class);
Route::apiResource('dsgv', DSGiangVienController::class);
Route::apiResource('loaibaiviet', LoaiBaiVietController::class);
Route::apiResource('baiviet', BaiVietController::class);
Route::apiResource('file', FileController::class);
Route::apiResource('dsgv', DS_GiangVien::class);
Route::middleware(['auth:sanctum'])->group(function () {
});

//Tạo Bài Kiểm Tra
Route::post('taobaiKT', [BaiKiemTraController::class, 'taoBaiKT']);

//Tạo Câu Hỏi
Route::post('taoCauHoi', [BaiKiemTraController::class, 'taoCauHoi']);

//Tạo trả lời
Route::post('taoCauTraLoi', [BaiKiemTraController::class, 'taoCauTraloi']);

//Bắt đầu kiểm tra
Route::post('batdauKT', [BaiKiemTraController::class, 'batdauKT']);