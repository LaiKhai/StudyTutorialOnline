<?php

namespace App\Imports;

use App\Models\SinhVien;
use App\Models\Lop;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;

class SinhVienImport implements ToModel, WithStartRow
{
    /**
     * @return int
     */
    public function startRow(): int
    {
        return 5;
    }
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        $import= new SinhVien([
        'mssv'=>$row['mssv'],
        'ho_ten'=>$row['ho_ten'],
        'ngay_sinh'=>$row['ngay_sinh'],
        'trang_thai'=>1
        ]);
        return $import;
    }
}