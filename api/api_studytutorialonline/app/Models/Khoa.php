<?php

namespace App\Models;

use App\Models\BoMon;
use App\Models\GiangVien;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Khoa extends Model
{
    use HasFactory;
    protected $table = 'khoas';
    protected $fillable = [
        'id',
        'ten_khoa',
        'trang_thai'
    ];
    public function bomon()
    {
        return $this->hasMany(BoMon::class, 'id_khoa', 'id');
    }
    public function giangvien()
    {
        return $this->hasMany(GiangVien::class, 'id_khoa', 'id');
    }
}