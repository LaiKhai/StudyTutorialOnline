<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Seeder;

class BoMonSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('bo_mons')->insert([
            'id_khoa' => 1,
        'ten_mon_hoc'=>'Lập Trình Android',
        'loai_mon_hoc'=>'Lý Thuyết',
            'trang_thai' => 1,
        ]);
        DB::table('bo_mons')->insert([
            'id_khoa' => 1,
        'ten_mon_hoc'=>'Lập Trình WinForm',
        'loai_mon_hoc'=>'Lý Thuyết',
            'trang_thai' => 1,
        ]);
        DB::table('bo_mons')->insert([
            'id_khoa' => 1,
        'ten_mon_hoc'=>'Lập Trình Android',
        'loai_mon_hoc'=>'Thực hành',
            'trang_thai' => 1,
        ]);
        DB::table('bo_mons')->insert([
            'id_khoa' => 1,
        'ten_mon_hoc'=>'Lập Trình WinForm',
        'loai_mon_hoc'=>'Thực hành',
            'trang_thai' => 1,
        ]);
        DB::table('bo_mons')->insert([
            'id_khoa' => 2,
        'ten_mon_hoc'=>'Bộ môn 1',
        'loai_mon_hoc'=>'Lý Thuyết',
            'trang_thai' => 1,
        ]);
        DB::table('bo_mons')->insert([
            'id_khoa' => 2,
        'ten_mon_hoc'=>'Bộ môn 1',
        'loai_mon_hoc'=>'Thực Hành',
            'trang_thai' => 1,
        ]);
        DB::table('bo_mons')->insert([
            'id_khoa' => 2,
        'ten_mon_hoc'=>'Bộ môn 2',
        'loai_mon_hoc'=>'Lý Thuyết',
            'trang_thai' => 1,
        ]);
        DB::table('bo_mons')->insert([
            'id_khoa' => 2,
        'ten_mon_hoc'=>'Bộ môn 2',
        'loai_mon_hoc'=>'Thực hành',
            'trang_thai' => 1,
        ]);
    }
}
