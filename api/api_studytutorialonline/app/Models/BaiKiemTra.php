<?php

namespace App\Models;

use App\Models\LopHocPhan;
use App\Models\GiangVien;
use App\Models\File;
use App\Models\CauHoi;
use App\Models\CTBaiKiemTra;

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
    public function lophocphan()
    {
        return $this->belongsTo(LopHocPhan::class, 'id_lop_hoc_phan');
    }
    public function giangvien()
    {
        return $this->belongsTo(GiangVien::class, 'id_giang_vien');
    }
    public function file()
    {
        return $this->belongsTo(File::class, 'id_file');
    }
    public function cauhoi()
    {
        return $this->hasMany(CauHoi::class, 'id_bai_kiem_tra', 'id');
    }
    public function ctbaikiemtra()
    {
        return $this->hasMany(CTBaiKiemTra::class, 'id_bai_kiem_tra', 'id');
    }
}