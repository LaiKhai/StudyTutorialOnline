<?php

namespace App\Models;

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
}