<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BinhLuan extends Model
{
    use HasFactory;
    protected $table = 'binh_luans';
    protected $fillable = [
        'id',
        'id_bai_viet',
        'id_bai_tap',
        'id_sinh_vien',
        'noi_dung',
        'trang_thai'
    ];
    public function baitap()
    {
        return $this->belongsTo(BaiTap::class, 'id_bai_tap');
    }
    public function baiviet()
    {
        return $this->belongsTo(BaiViet::class, 'id_bai_viet');
    }
    public function sinhvien()
    {
        return $this->belongsTo(SinhVien::class, 'id_sinh_vien');
    }
}