<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Khoa;

class BoMon extends Model
{
    use HasFactory;
    protected $table='bo_mons';
    protected $fillable=[
        'id',
        'id_khoa',
        'ten_mon_hoc',
        'trang_thai'
    ];

    public function khoa(){
        return $this->beLongsTo(Khoa::class,'id_khoa');
    }
}