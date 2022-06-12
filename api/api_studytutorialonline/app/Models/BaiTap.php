<?php

namespace App\Models;

use App\Models\LopHocPhan;
use App\Models\File;
use App\Models\LoaiBaiTap;
use App\Models\CTBaiTap;

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
    public function lophocphan()
    {
        return $this->belongsTo(LopHocPhan::class, 'id_lop_hoc_phan');
    }
    public function file()
    {
        return $this->belongsTo(File::class, 'id_file');
    }
    public function loaibaitap()
    {
        return $this->belongsTo(LoaiBaiTap::class, 'id_loai');
    }
    public function ctbaitap()
    {
        return $this->hasMany(CTBaiTap::class, 'id_bai_tap', 'id');
    }
}