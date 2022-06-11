<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Lop;
use App\Models\CTBaiTap;
use App\Models\DS_SinhVien;
use App\Models\TraLoi;
use Laravel\Sanctum\HasApiTokens;

class SinhVien extends Model
{
    use HasFactory;
    use HasApiTokens;
    protected $table = 'sinh_viens';
    protected $fillable = [
        'id',
        'id_lop',
        'email',
        'password',
        'ho_ten',
        'avt',
        'mssv',
        'sdt',
        'ngay_sinh',
        'trang_thai'
    ];
    public function lop()
    {
        return $this->beLongsTo(Lop::class, 'id_lop');
    }
    public function ctbaitap()
    {
        return $this->hasMany(CTBaiTap::class, 'id_sinh_vien', 'id');
    }
    public function dssinhvien()
    {
        return $this->hasMany(DS_SinhVien::class, 'id_sinh_vien', 'id');
    }
    public function traloi()
    {
        return $this->hasMany(TraLoi::class, 'id_sinh_vien', 'id');
    }
}