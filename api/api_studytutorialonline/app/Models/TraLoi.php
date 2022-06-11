<?php

namespace App\Models;

use App\Models\CTBaiKiemTra;
use App\Models\SinhVien;
use App\Models\CauHoi;
use App\Models\File;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TraLoi extends Model
{
    use HasFactory;
    protected $table = 'tra_lois';
    protected $fillable = [
        'id',
        'id_sinh_vien',
        'id_cau_hoi',
        'id_file',
        'dap_an',
        'diem',
        'trang_thai'
    ];
    public function ctbaikiemtra()
    {
        return $this->hasMany(CTBaiKiemTra::class, 'id_tra_loi', 'id');
    }
    public function sinhvien()
    {
        return $this->belongsTo(SinhVien::class, 'id_sinh_vien');
    }
    public function cauhoi()
    {
        return $this->belongsTo(CauHoi::class, 'id_cau_hoi');
    }
    public function file()
    {
        return $this->belongsTo(File::class, 'id_file');
    }
}