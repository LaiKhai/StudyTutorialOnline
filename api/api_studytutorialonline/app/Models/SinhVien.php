<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Lop;
use Laravel\Sanctum\HasApiTokens;

class SinhVien extends Model
{
    use HasFactory;
    use HasApiTokens;
    protected $table='sinh_viens';
    protected $fillable=[
        'id',
        'id_lop',
        'username',
        'email',
        'password',
        'ho_ten',
        'avt',
        'mssv',
        'sdt',
        'ngay_sinh',
        'nam_bat_dau',
        'nam_ket_thuc',
        'trang_thai'
    ];
    public function lop(){
        return $this->beLongsTo(Lop::class,'id_lop');
    }
}