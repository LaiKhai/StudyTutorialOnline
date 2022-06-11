<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CTBaiTap extends Model
{
    use HasFactory;
    protected $table = 'ct_bai_taps';
    protected $fillable = [
        'id_sinh_vien',
        'id_bai_tap',
        'id_lop_hoc_phan',
        'tg_nop_bai',
        'trang_thai'
    ];
}