<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LoaiBaiTap extends Model
{
    use HasFactory;
    protected $table = 'loai_bai_taps';
    protected $fillable = [
        'id',
        'ten_loai',
        'trang_thai'
    ];
}