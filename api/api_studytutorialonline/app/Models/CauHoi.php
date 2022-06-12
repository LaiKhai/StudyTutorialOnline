<?php

namespace App\Models;

use App\Models\BaiKiemTra;
use App\Models\File;
use App\Models\TraLoi;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CauHoi extends Model
{
    use HasFactory;
    protected $table = 'cau_hois';
    protected $fillable = [
        'id',
        'id_bai_kiem_tra',
        'id_file',
        'de_bai',
        'dap_an_1',
        'dap_an_2',
        'dap_an_3',
        'dap_an_4',
        'dap_an_dung',
        'diem',
        'trang_thai'
    ];
    public function baikiemtra()
    {
        return $this->belongsTo(BaiKiemTra::class, 'id_bai_kiem_tra');
    }
    public function file()
    {
        return $this->belongsTo(File::class, 'id_file');
    }
    public function traloi()
    {
        return $this->hasMany(TraLoi::class, 'id_cau_hoi', 'id');
    }
}