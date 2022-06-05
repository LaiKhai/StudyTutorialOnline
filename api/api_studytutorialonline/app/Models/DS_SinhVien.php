<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\SinhVien;
use App\Models\LopHocPhan;

class DS_SinhVien extends Model
{
    use HasFactory;
    protected $table='ds_sinh_viens';
    protected $fillable=[
        'id_sinh_vien',         
        'id_lop_hoc_phan',         
        'trang_thai',
    ];

    public function sinhVien(){
        return $this->hasMany(SinhVien::class,'id_sinh_vien');
    }
    public function lopHocPhan(){
        return $this->beLongsTo(LopHocPhan::class,'id_lop_hoc_phan');
    }
}