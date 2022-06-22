<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\GiangVien;
use App\Models\SinhVien;
use App\Models\DS_SinhVien;
use App\Models\LopHocPhan;

class Lop extends Model
{
    use HasFactory;
    protected $table = 'lops';
    protected $fillable = [
        'id',
        'id_giangvien',
        'ten_lop',
        'nien_khoa',
        'trang_thai'
    ];

    public function giangvien()
    {
        return $this->belongsTo(GiangVien::class, 'id_giangvien');
    }

    public function sinhvien()
    {
        return $this->hasMany(SinhVien::class, 'id_lop', 'id');
    }
    public function lophocphan()
    {
        return $this->hasMany(LopHocPhan::class, 'id_lop', 'id');
    }
    public function dssinhvien()
    {
        return $this->hasMany(DS_SinhVien::class, 'id_lop', 'id');
    }
}