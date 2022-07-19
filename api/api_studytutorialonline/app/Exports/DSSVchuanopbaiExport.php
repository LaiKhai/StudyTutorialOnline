<?php

namespace App\Exports;

use App\Models\CTBaiKiemTra;
use Maatwebsite\Excel\Concerns\FromCollection;

class DSSVchuanopbaiExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return CTBaiKiemTra::all();
    }
}
