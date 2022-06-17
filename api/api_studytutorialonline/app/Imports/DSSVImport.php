<?php

namespace App\Imports;

use App\Models\DS_SinhVien;
use Maatwebsite\Excel\Concerns\ToModel;

class DSSVImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new DS_SinhVien([
            //
        ]);
    }
}
