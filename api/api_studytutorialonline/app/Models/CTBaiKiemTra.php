<?php

namespace App\Models;

use App\Models\BaiKiemTra;
use App\Models\TraLoi;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CTBaiKiemTra extends Model
{
    use HasFactory;
    protected $table = 'ct_bai_kiem_tras';
    protected $fillable = [
        'id_bai_kiem_tra',
        'id_sinh_vien',
        'tg_nop_bai',
        'tong_diem',
        'trang_thai',
    ];
    public function baikiemtra()
    {
        return $this->belongsTo(BaiKiemTra::class, 'id_bai_kiem_tra');
    }
    public function sinhvien()
    {
        return $this->belongsTo(SinhVien::class, 'id_sinh_vien');
    }
}