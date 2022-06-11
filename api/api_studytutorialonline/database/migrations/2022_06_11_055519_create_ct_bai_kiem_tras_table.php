<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

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
            $table->foreignId('id_tra_loi');
            $table->dateTime('tg_nop_bai');
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