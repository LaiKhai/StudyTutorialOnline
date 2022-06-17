<?php

namespace App\Models;

use App\Models\SinhVien;
use App\Models\BaiTap;
use App\Models\LopHocPhan;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CTBaiTap extends Model
{
    use HasFactory;
    protected $table = 'ct_bai_taps';
    protected $fillable = [
        'id_sinh_vien',
        'id_bai_tap',
        'id_file',
        'id_lop_hoc_phan',
        'noi_dung',
        'tg_nop_bai',
        'trang_thai'
    ];
    public function sinhvien()
    {
        return $this->belongsTo(SinhVien::class, 'id_sinh_vien');
    }
    public function baitap()
    {
        return $this->belongsTo(BaiTap::class, 'id_bai_tap');
    }
    public function lophocphan()
    {
        return $this->belongsTo(LopHocPhan::class, 'id_lop_hoc_phan');
    }
}