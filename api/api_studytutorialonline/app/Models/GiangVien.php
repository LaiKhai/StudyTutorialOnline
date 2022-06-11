<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Khoa;
use App\Models\ChucVu;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Model;

class GiangVien extends Model
{
    use HasFactory;
    use HasApiTokens;
    protected $table = 'giang_viens';
    protected $fillable = [
        'id',
        'id_khoa',
        'id_chuc_vu',
        'email',
        'password',
        'avt',
        'msgv',
        'sdt',
        'ho_ten',
        'ngay_sinh',
        'trang_thai'
    ];
    public function Khoas()
    {
        return $this->beLongsTo(Khoa::class, 'id_khoa');
    }
    public function chucVu()
    {
        return $this->beLongsTo(ChucVu::class, 'id_chuc_vu');
    }
}