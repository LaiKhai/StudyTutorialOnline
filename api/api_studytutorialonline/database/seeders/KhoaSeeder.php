<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
class KhoaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('khoas')->insert([
            'ten_khoa' => 'Khoa Công Nghệ Thông Tin',
            'trang_thai' => 1,
        ]);
        DB::table('khoas')->insert([
            'ten_khoa' => 'Khoa Điện Lạnh',
            'trang_thai' => 1,
        ]);
        DB::table('khoas')->insert([
            'ten_khoa' => 'Khoa Kế Toán',
            'trang_thai' => 1,
        ]);
        DB::table('khoas')->insert([
            'ten_khoa' => 'Khoa Cơ Khí',
            'trang_thai' => 1,
        ]);
    }
}