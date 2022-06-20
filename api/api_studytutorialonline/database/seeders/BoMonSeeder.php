<?php

namespace Database\Seeders;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

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
            'ten_mon_hoc' => 'Lập Trình Android',
            'loai_mon_hoc' => 1,
            'trang_thai' => 1,
        ]);
        DB::table('bo_mons')->insert([
            'id_khoa' => 1,
            'ten_mon_hoc' => 'Lập Trình WinForm',
            'loai_mon_hoc' => 1,
            'trang_thai' => 1,
        ]);
        DB::table('bo_mons')->insert([
            'id_khoa' => 1,
            'ten_mon_hoc' => 'Lập Trình Android',
            'loai_mon_hoc' => 2,
            'trang_thai' => 1,
        ]);
        DB::table('bo_mons')->insert([
            'id_khoa' => 1,
            'ten_mon_hoc' => 'Lập Trình WinForm',
            'loai_mon_hoc' => 2,
            'trang_thai' => 1,
        ]);
        DB::table('bo_mons')->insert([
            'id_khoa' => 2,
            'ten_mon_hoc' => 'Bộ môn 1',
            'loai_mon_hoc' => 1,
            'trang_thai' => 1,
        ]);
        DB::table('bo_mons')->insert([
            'id_khoa' => 2,
            'ten_mon_hoc' => 'Bộ môn 1',
            'loai_mon_hoc' => 2,
            'trang_thai' => 1,
        ]);
        DB::table('bo_mons')->insert([
            'id_khoa' => 2,
            'ten_mon_hoc' => 'Bộ môn 2',
            'loai_mon_hoc' => 1,
            'trang_thai' => 1,
        ]);
        DB::table('bo_mons')->insert([
            'id_khoa' => 2,
            'ten_mon_hoc' => 'Bộ môn 2',
            'loai_mon_hoc' => 2,
            'trang_thai' => 1,
        ]);
    }
}