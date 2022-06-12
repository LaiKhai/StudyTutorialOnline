<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FileExcel extends Model
{
    use HasFactory;
    protected $table = 'file_excels';
    protected $fillable = [
        'id',
        'file'
    ];
}