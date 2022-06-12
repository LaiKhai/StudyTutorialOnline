<?php

namespace App\Models;

use App\Models\BaiViet;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LoaiBaiViet extends Model
{
    use HasFactory;
    protected $table = 'loai_bai_viets';
    protected $fillable = [
        'id',
        'ten_loai',
        'trang_thai'
    ];
    public function baiviet()
    {
        return $this->hasMany(BaiViet::class, 'id_loai_bai_viet', 'id');
    }
}