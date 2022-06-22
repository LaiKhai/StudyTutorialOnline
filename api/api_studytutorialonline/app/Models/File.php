<?php

namespace App\Models;

use App\Models\BaiKiemTra;
use App\Models\CauHoi;
use App\Models\CheckFile;
use App\Models\BaiViet;
use App\Models\TraLoi;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Psy\VersionUpdater\Checker;

class File extends Model
{
    use HasFactory;
    protected $table = 'files';
    protected $fillable = [
        'id',
        'id_bai_viet',
        'noi_dung',
        'loai_file',
        'trang_thai'
    ];
    public function baikiemtra()
    {
        return $this->hasMany(BaiKiemTra::class, 'id_file', 'id');
    }
    public function baitap()
    {
        return $this->hasMany(BaiTap::class, 'id_file', 'id');
    }
    public function cauhoi()
    {
        return $this->hasMany(CauHoi::class, 'id_file', 'id');
    }
    public function checkfile()
    {
        return $this->hasMany(CheckFile::class, 'id_file', 'id');
    }
    public function baiviet()
    {
        return $this->belongsTo(BaiViet::class, 'id_bai_viet');
    }
    public function traloi()
    {
        return $this->hasMany(TraLoi::class, 'id_file', 'id');
    }
    public function ctbaitap()
    {
        return $this->hasMany(CTBaiTap::class, 'id_file', 'id');
    }
}