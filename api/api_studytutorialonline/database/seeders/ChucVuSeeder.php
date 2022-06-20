<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class ChucVuSeeder extends Seeder
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
            'ten_chuc_vu'=>'Trưởng Khoa',
            'trang_thai'=>1
        ]);
        DB::table('chuc_vus')->insert([
            'ten_chuc_vu'=>'Giảng Viên',
            'trang_thai'=>1
        ]);
        DB::table('chuc_vus')->insert([
            'ten_chuc_vu'=>'Giảng Viên',
            'trang_thai'=>1
        ]);
        DB::table('chuc_vus')->insert([
            'ten_chuc_vu'=>'Phòng Đào Tạo',
            'trang_thai'=>1
        ]);
    }
}
