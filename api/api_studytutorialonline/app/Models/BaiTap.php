<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BaiTap extends Model
{
    use HasFactory;
    protected $table = "bai_taps";
    protected $fillable = [
        'id',
        'id_lop_hoc_phan',
        'id_file',
        'id_loai',
        'tieu_de',
        'noi_dung',
        'tg_bat_dau',
        'tg_ket_thuc',
        'trang_thai'
    ];
}