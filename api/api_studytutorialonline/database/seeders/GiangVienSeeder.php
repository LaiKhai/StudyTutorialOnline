<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;

class GiangVienSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('giang_viens')->insert([

            'id_khoa' => '1',
            'id_chuc_vu' => '1',
            'email' => 'giangvien1@caothang.edu.vn',
            'password' => Hash::make('123456'),

            'ma_so' => '21012000',
            'sdt' => '210120000',
            'ho_ten' => 'Giảng viên 1',
            'ngay_sinh' => Carbon::now(),
            'trang_thai' => '1',
        ]);
    }
}