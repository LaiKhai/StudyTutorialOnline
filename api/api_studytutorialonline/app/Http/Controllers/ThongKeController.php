<?php

namespace App\Http\Controllers;

use App\Models\CTBaiKiemTra;
use App\Models\BaiKiemTra;
use App\Models\GiangVien;
use App\Models\SinhVien;
use App\Models\Lop;
use Illuminate\Http\Request;

class ThongKeController extends Controller
{
    public function ThongKe()
    {
        $sinhVien = SinhVien::count();
        $giangvien = GiangVien::count();
        $lop = Lop::count();
        $response = [
            'sinhvien' => "$sinhVien",
            'giangvien' => "$giangvien",
            'lop' => "$lop"
        ];
        return response()->json($response, 200);
    }

    public function thongkeCTBKT(Request $request)
    {
        $idBKT = $request->input('id_bai_kiem_tra');
        $dagiao = CTBaiKiemTra::where([['id_bai_kiem_tra', $idBKT], ['trang_thai', '>', '0']])->count();
        $hoanthanh = CTBaiKiemTra::where([['id_bai_kiem_tra', $idBKT], ['trang_thai', '1']])->count();
        $noptre = CTBaiKiemTra::where([['id_bai_kiem_tra', $idBKT], ['trang_thai', '2']])->count();
        $chuanop = CTBaiKiemTra::where([['id_bai_kiem_tra', $idBKT], ['trang_thai', '3']])->count();
        $response = [
            'status' => true,
            'dagiao' => $dagiao,
            'hoanthanh' => $hoanthanh,
            'noptre' => $noptre,
            'chuanop' => $chuanop
        ];
        return response()->json($response, 200);
    }


    public function thongkeBangDiem(Request $request)
    {
        $idBKT = $request->input('id_bai_kiem_tra');
        $cTietBaiktra = 
        CTBaiKiemTra::where([['id_bai_kiem_tra', $idBKT], ['ct_bai_kiem_tras.trang_thai', '>', '0']])
       ->get();
        $baiktra=BaiKiemTra::join('giang_viens','bai_kiem_tras.id_giang_vien','=','giang_viens.id')
        ->where([['bai_kiem_tras.id', $idBKT],['bai_kiem_tras.trang_thai', '>', '0']])->get();
       foreach ($cTietBaiktra as $item) {
        $item->sinhvien;
    }
        $response = [
            'status' => true,
            'data' => $cTietBaiktra,
            'databaiktra'=>$baiktra
        ];
        return response()->json($response, 200);
    }

}