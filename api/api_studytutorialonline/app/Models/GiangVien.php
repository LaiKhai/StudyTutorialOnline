<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Khoa;
use App\Models\ChucVu;
use App\Models\BaiKiemTra;
use App\Models\DS_GiangVien;
use App\Models\Lop;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Model;

class GiangVien extends Model
{
    use HasFactory;
    use HasApiTokens;
    protected $table = 'giang_viens';
    protected $fillable = [
        'id',
        'id_khoa',
        'id_chuc_vu',
        'email',
        'password',
        'avt',
        'ma_so',
        'sdt',
        'ho_ten',
        'ngay_sinh',
        'trang_thai'
    ];
    public function Khoa()
    {
        return $this->beLongsTo(Khoa::class, 'id_khoa');
    }
    public function chucVu()
    {
        return $this->beLongsTo(ChucVu::class, 'id_chuc_vu');
    }
    public function baikiemtra()
    {
        return $this->hasMany(BaiKiemTra::class, 'id_giang_vien', 'id');
    }
    public function dsgiangvien()
    {
        return $this->hasMany(DS_GiangVien::class, 'id_giang_vien', 'id');
    }
    public function lop()
    {
        return $this->hasMany(Lop::class, 'id_giangvien', 'id');
    }
}