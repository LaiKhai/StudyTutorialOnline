<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CheckFile extends Model
{
    use HasFactory;
    protected $table = 'check_files';
    protected $fillable = [
        'id_bai_viet',
        'id_file',
        'trang_thai',
    ];
}