<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\BoMon;
use App\Models\Lop;

class LopHocPhan extends Model
{
    use HasFactory;
    protected $table='lop_hoc_phans';
    protected $fillable=[
        'id',
        'id_bo_mon',
        'id_lop',
        'avt',
        'trang_thai'
    ];

    public function boMon(){
        return $this->beLongsTo(BoMon::class,'id_bo_mon');
    }
    public function lop(){
        return $this->beLongsTo(Lop::class,'id_lop');
    }
}