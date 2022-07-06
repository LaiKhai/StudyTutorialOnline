<?php

namespace App\Http\Controllers;

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
}