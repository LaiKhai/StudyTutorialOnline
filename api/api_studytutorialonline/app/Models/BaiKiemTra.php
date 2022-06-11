<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BaiKiemTra extends Model
{
    use HasFactory;
    protected $table = 'bai_kiem_tras';
    protected $fillable = [
        'id',
        'id_lop_hoc_phan',
        'id_giang_vien',
        'id_file',
        'sl_cau_hoi',
        'noi_dung',
        'tg_bat_dau',
        'tg_ket_thuc',
        'trang_thai',
    ];
}