<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BaiViet extends Model
{
    use HasFactory;
    protected $table = 'bai_viets';
    protected $fillable = [
        'id',
        'id_lop_hoc_phan',
        'id_loai_bai_viet',
        'noi_dung',
        'trang_thai',
    ];
}
