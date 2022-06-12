<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\GiangVien;
use App\Models\lopHocPhan;

class DS_GiangVien extends Model
{
    use HasFactory;
    protected $table = 'ds_giang_viens';
    protected $fillable = [
        'id_giang_vien',
        'id_lop_hoc_phan',
        'trang_thai',
    ];

    public function giangVien()
    {
        return $this->belongsTo(GiangVien::class, 'id_giang_vien');
    }
    public function lopHocPhan()
    {
        return $this->beLongsTo(LopHocPhan::class, 'id_lop_hoc_phan');
    }
}