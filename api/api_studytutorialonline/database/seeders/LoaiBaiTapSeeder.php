<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LoaiBaiTapSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('chuc_vus')->insert([
            'ten_loai' => 'Trắc nghiệm',
            'trang_thai' => 1
        ]);
        DB::table('chuc_vus')->insert([
            'ten_loai' => 'Tự luận',
            'trang_thai' => 1
        ]);
    }
}