<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class File extends Model
{
    use HasFactory;
    protected $table = 'files';
    protected $fillable = [
        'id',
        'id_bai_viet',
        'noi_dung',
        'loai_file',
        'trang_thai'
    ];
}