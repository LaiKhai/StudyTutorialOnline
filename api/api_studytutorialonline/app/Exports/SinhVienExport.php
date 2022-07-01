<?php

namespace App\Exports;

use App\Models\SinhVien;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class SinhVienExport implements FromCollection, WithHeadings
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return SinhVien::all();
    }

    public function headings(): array
    {
        return [
            'mssv',
            'ho_ten',
            'ngay_sinh',
            'sdt',
        ];
    }
}