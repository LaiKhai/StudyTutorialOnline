<?php

namespace App\Models;

use App\Models\BaiViet;
use App\Models\File;

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
    public function baiviet()
    {
        return $this->belongsTo(BaiViet::class, 'id_bai_viet');
    }
    public function file()
    {
        return $this->belongsTo(File::class, 'id_file');
    }
}