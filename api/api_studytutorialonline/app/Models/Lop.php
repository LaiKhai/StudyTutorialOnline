<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\GiangVien;
use App\Models\SinhVien;

class Lop extends Model
{
    use HasFactory;
    protected $table='lops';
    protected $fillable=[
        'id',
        'id_giangvien',
        'ten_lop',
        'trang_thai'
    ];

    public function giangVien(){
        return $this->hasOne(GiangVien::class,'id_giang_vien');
    }

    public function sinhVien(){
        return $this->hasMany(SinhVien::class,'id_lop');
    }
    public function lopHocPhan(){
        return $this->hasMany(LopHocPhan::class,'id_lop');
    }
}