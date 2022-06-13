<?php

namespace App\Imports;

use App\Models\SinhVien;
use Illuminate\Support\Facades\Hash;
use App\Models\Lop;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class SinhVienImport implements ToModel, WithHeadingRow
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {
        $lop = Lop::max('id');
        $import = new SinhVien([
            'id_lop' => $lop,
            'email' => $row['mssv'] . '@caothang.edu.vn',
            'password' => Hash::make($row['mssv']),
            'mssv' => $row['mssv'],
            'ho_ten' => $row['ho_ten'],
            'ngay_sinh' => date('Y-m-d', $row['ngay_sinh']),
            'sdt' => $row['sdt'],
            'trang_thai' => 1
        ]);
        return $import;
    }
}