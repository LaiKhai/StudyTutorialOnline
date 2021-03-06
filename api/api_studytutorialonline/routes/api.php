<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BaiKiemTraController;
use App\Http\Controllers\BaiTapController;
use App\Http\Controllers\BaiVietController;
use App\Http\Controllers\BinhLuanController;
use App\Http\Controllers\SinhVienController;
use App\Http\Controllers\GiangVienController;
use App\Http\Controllers\LopController;
use App\Http\Controllers\ChucVuController;
use App\Http\Controllers\LoaiBaiTapController;
use App\Http\Controllers\KhoaController;
use App\Http\Controllers\LopHocPhanController;
use App\Http\Controllers\BoMonController;
use App\Http\Controllers\CauHoiController;
use App\Http\Controllers\CTBaiKiemTraController;
use App\Http\Controllers\LoaiBaiVietController;
use App\Http\Controllers\DSSinhVienController;
use App\Http\Controllers\DSGiangVienController;
use App\Http\Controllers\FileController;
use App\Http\Controllers\ThongKeController;
use App\Http\Controllers\TraLoi_ThongBaoController;
use App\Http\Controllers\TraLoiController;
use App\Models\CTBaiKiemTra;
use App\Models\DS_GiangVien;
use App\Models\DS_SinhVien;
use Database\Factories\BoMonFactory;

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

Route::get('/traloi/exportDiemSV', [TraLoiController::class, 'exportDiemSV']);
Route::post('/traloi/danhsachDiemSV', [TraLoiController::class, 'danhsachDiemSV']);
Route::post('/traloi/lichsuTraLoi', [TraLoiController::class, 'lichsuTraLoi']);
Route::get('/cttraloi/exportDSSVlamKiemTra', [CTBaiKiemTraController::class, 'exportDSSVlamKiemTra']);



Route::get('/sinhvien/exportDiemDanh/{idlop}', [SinhVienController::class, 'exportDiemDanh']);
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
//l???y danh s??ch b??i vi???t theo l???p h???c ph???n
Route::get('/listbaiviet/{id}', [LopHocPhanController::class, 'ListBaiViet']);
//l???y danh s??ch b??i vi???t theo l???p h???c ph???n
Route::post('/listbaikiemtra/{id}', [LopHocPhanController::class, 'ListBaiKiemTra']);

//Dowload file
Route::get('/dowloadfile/{id}', [FileController::class, 'dowloadFile']);

//Th???ng k?? sinh vi??n, gi???ng vi??n, l???p
Route::get('/thongke', [ThongKeController::class, 'ThongKe']);

//Th???ng k?? b??i ki???m tra
Route::post('/thongkeCTBKT', [ThongKeController::class, 'thongkeCTBKT']);

//l???y l???p h???c ph???n theo khoa
Route::post('/lophocphanwithkhoa', [LopHocPhanController::class, 'lstLopHocPhanwithKhoa']);
//l???y l???p theo khoa
Route::post('/lopwithkhoa', [LopController::class, 'lopwithKhoa']);
//l???y b??? m??n theo khoa
Route::get('/bomonwithkhoa/{id}', [BoMonController::class, 'bomonwithkhoa']);
//l???y sinh vi??n theo khoa
Route::post('/lstSinhVienwithKhoa', [SinhVienController::class, 'lstSinhVienwithKhoa']);

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
Route::apiResource('dssv', DS_SinhVien::class);
Route::apiResource('loaibaiviet', LoaiBaiVietController::class);
Route::apiResource('baiviet', BaiVietController::class);
Route::apiResource('file', FileController::class);
Route::apiResource('dsgv', DS_GiangVien::class);
Route::apiResource('traloi', TraLoiController::class);
Route::apiResource('ctbaikiemtra', CTBaiKiemTraController::class);
Route::apiResource('binhluan', BinhLuanController::class);
Route::apiResource('traloithongbao', TraLoi_ThongBaoController::class);

//l???y danh s??ch sinh vi??n
Route::post('getSinhVien', [TraLoi_ThongBaoController::class, 'getSinhVien']);
//l???y danh s??ch file
Route::post('getfile', [TraLoi_ThongBaoController::class, 'getfile']);


//T???o B??i Ki???m Tra
Route::post('taobaiKT', [BaiKiemTraController::class, 'taoBaiKT']);

//T???o C??u H???i
Route::post('taoCauHoi', [BaiKiemTraController::class, 'taoCauHoi']);

//T???o tr??? l???i
Route::post('taoCauTraLoi', [BaiKiemTraController::class, 'taoCauTraloi']);

//B???t ?????u ki???m tra
Route::post('batdauKT', [BaiKiemTraController::class, 'batdauKT']);

//nop bai
Route::post('nopBai', [BaiKiemTraController::class, 'nopBai']);

//chi tiet bai kiem tra da lam
Route::post('traloiwithbaikiemtra', [TraLoiController::class, 'traloiwithbaikiemtra']);
//binh luan theo bai viet
Route::post('binhluanwithidbaiviet', [BinhLuanController::class, 'binhluanwithidbaiviet']);

//T??m ki???m
//T??m ki???m Khoa
Route::post('/searchKhoa', [KhoaController::class, 'search']);
Route::post('/searchLop', [LopController::class, 'search']);
Route::post('/searchLopHocPhan', [LopHocPhanController::class, 'search']);
Route::post('/searchBoMon', [BoMonController::class, 'search']);
Route::post('/searchSinhVien', [SinhVienController::class, 'search']);
Route::post('/searchGiangVien', [GiangVienController::class, 'search']);
Route::post('/searchLopwithKhoa', [LopController::class, 'searchLopwithKhoa']);
Route::post('/searchGiangVienwithKhoa', [GiangVienController::class, 'searchGiangVienwithKhoa']);
Route::post('/searchSinhVienwithKhoa', [SinhVienController::class, 'searchSinhVienwithKhoa']);

Route::post('/baikiemtrawithsinhvien', [CTBaiKiemTraController::class, 'baikiemtrawithsinhvien']);
Route::post('/baikiemtrawithlophocphan', [CTBaiKiemTraController::class, 'baikiemtrawithlophocphan']);

//danh s??ch sinh vi??n ????? ho??n th??nh b??i ki???m
Route::post('/svHoanThanhBKT', [CTBaiKiemTraController::class, 'svHoanThanhBKT']);
//danh s??ch sinh vi??n ch??a ho??n th??nh b??i ki???m
Route::post('/svChuaHoanThanhBKT', [CTBaiKiemTraController::class, 'svChuaHoanThanhBKT']);
//danh s??ch sinh vi??n tham gia ki???m tra
Route::post('/svwithBKT', [CTBaiKiemTraController::class, 'svwithBKT']);
Route::post('ThongkeBangDiem', [ThongKeController::class, 'thongkeBangDiem']);

//l???y danh s??ch sinh vi??n theo bai ki???m tra
Route::post('/getSinhVienBaiKiemTra', [BaiKiemTraController::class, 'getSinhVienBaiKiemTra']);

//l???y danh s??ch c??u tr??? l???i b??i t???p
Route::post('/getdstraloi', [TraLoi_ThongBaoController::class, 'getdstraloi']);

//chi ti???t c??u tr??? l???i
Route::post('/getchitiettraloi', [TraLoi_ThongBaoController::class, 'getchitiettraloi']);


//x??a sinh vi??n trong ds sinh vi??n
Route::post('/deletesinhvien', [DSSinhVienController::class, 'deletesinhvien']);

//l???y idfile
Route::post('/getidFile', [CauHoiController::class, 'getidFile']);
Route::middleware(['auth:sanctum'])->group(function () {
});