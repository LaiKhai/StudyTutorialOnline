<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();
        $this->call(ChucVuSeeder::class);
        $this->call(KhoaSeeder::class);
        $this->call(BoMonSeeder::class);
        $this->call(LoaiBaiVietSeeder::class);
        $this->call(GiangVienSeeder::class);
        $this->call(LopSeeder::class);
        $this->call(LoaiBaiTapSeeder::class);
    }
}
