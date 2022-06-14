<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\BoMon;
use App\Models\Lop;
use App\Models\BaiKiemTra;
use App\Models\BaiTap;
use App\Models\BaiViet;
use App\Models\DS_GiangVien;
use App\Models\DS_SinhVien;

class LopHocPhan extends Model
{
    use HasFactory;
    protected $table = 'lop_hoc_phans';
    protected $fillable = [
        'id',
        'id_bo_mon',
        'id_lop',
        'avt',
        'trang_thai'
    ];

    public function bomon()
    {
        return $this->beLongsTo(BoMon::class, 'id_bo_mon');
    }
    public function lop()
    {
        return $this->beLongsTo(Lop::class, 'id_lop');
    }
    public function baikiemtra()
    {
        return $this->hasMany(BaiKiemTra::class, 'id_lop_hoc_phan', 'id');
    }
    public function baitap()
    {
        return $this->hasMany(BaiTap::class, 'id_lop_hoc_phan', 'id');
    }
    public function baiviet()
    {
        return $this->hasMany(BaiViet::class, 'id_lop_hoc_phan', 'id');
    }
    public function ctbaitap()
    {
        return $this->hasMany(CTBaiTap::class, 'id_lop_hoc_phan', 'id');
    }
    public function dsgiangvien()
    {
        return $this->hasMany(DS_GiangVien::class, 'id_lop_hoc_phan', 'id');
    }
    public function dssinhvien()
    {
        return $this->hasMany(DS_SinhVien::class, 'id_lop_hoc_phan', 'id');
    }
}