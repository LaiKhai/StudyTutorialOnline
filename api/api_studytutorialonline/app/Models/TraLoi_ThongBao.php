<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;

class TraLoi_ThongBao extends Model
{
    use HasFactory;
    use HasApiTokens;
    protected $table = 'traloi_thongbao';
    protected $fillable = [
        'id',
        'id_sinh_vien',
        'id_bai_viet',
        'id_file',
        'cau_tra_loi',
        'trang_thai',
    ];
    public function sinhvien()
    {
        return $this->beLongsTo(SinhVien::class, 'id_sinh_vien');
    }
    public function baiviet()
    {
        return $this->beLongsTo(BaiViet::class, 'id_bai_viet');
    }
    public function file()
    {
        return $this->beLongsTo(File::class, 'id_file');
    }
}