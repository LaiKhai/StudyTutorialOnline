<?php

namespace App\Models;

use App\Models\LopHocPhan;
use App\Models\LoaiBaiViet;
use App\Models\CheckFile;
use App\Models\File;

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
    public function lophocphan()
    {
        return $this->belongsTo(LopHocPhan::class, 'id_lop_hoc_phan');
    }
    public function loaibaiviet()
    {
        return $this->belongsTo(LoaiBaiViet::class, 'id_loai_bai_viet');
    }
    public function checkfile()
    {
        return $this->hasMany(CheckFile::class, 'id_bai_viet', 'id');
    }
}