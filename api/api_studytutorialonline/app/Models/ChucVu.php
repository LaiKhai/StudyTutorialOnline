<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\GiangVien;

class ChucVu extends Model
{
    use HasFactory;
    protected $table='chuc_vus';
    protected $fillable=[
        'id',
        'ten_chuc_vu',
        'trang_thai'
    ];

    public function giangVien(){
        return $this->hasMany(GiangVien::class,'id_chuc_vu');
    }
}