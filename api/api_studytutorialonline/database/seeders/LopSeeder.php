<?php

namespace Database\Seeders;use Illuminate\Support\Facades\DB;

use Illuminate\Database\Seeder;

class LopSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('lops')->insert([
            
            
            'id_giangvien' => '1',
            'ten_lop' => 'CDTH19A',
            'nien_khoa' => '2019',
            'trang_thai' => '1',
            ]);
    }
}
