<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class CreateCTBaiKiemTrasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ct_bai_kiem_tras', function (Blueprint $table) {
            $table->foreignId('id_bai_kiem_tra');
            $table->foreignId('id_sinh_vien');
            $table->dateTime('tg_nop_bai')->useCurrent();
            $table->float('tong_diem');
            $table->integer('trang_thai');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('c_t_bai_kiem_tras');
    }
}