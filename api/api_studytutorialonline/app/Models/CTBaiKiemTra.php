<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CTBaiKiemTra extends Model
{
    use HasFactory;
    protected $table = 'ct_bai_kiem_tras';
    protected $fillable = [
        'id_bai_kiem_tra',
        'id_tra_loi',
        'tg_nop_bai',
        'tong_diem',
        'trang_thai',
    ];
}