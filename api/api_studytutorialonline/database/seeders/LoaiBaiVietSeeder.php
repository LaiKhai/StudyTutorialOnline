<?php

namespace Database\Seeders;use Illuminate\Support\Facades\DB;

use Illuminate\Database\Seeder;

class LoaiBaiVietSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('loai_bai_viets')->insert([
            
            
            'ten_loai' => 'Thông báo',
            'trang_thai' => '1',
            ]);
            DB::table('loai_bai_viets')->insert([
            
            
                'ten_loai' => 'Câu hỏi',
                'trang_thai' => '1',
                ]);
    }
}
