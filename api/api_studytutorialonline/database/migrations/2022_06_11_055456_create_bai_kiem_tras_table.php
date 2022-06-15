<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBaiKiemTrasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bai_kiem_tras', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_lop_hoc_phan');
            $table->foreignId('id_giang_vien');
            $table->foreignId('id_file')->nullable();
            $table->integer('sl_cau_hoi');
            $table->string('tieu_de');
            $table->string('noi_dung');
            $table->dateTime('tg_bat_dau');
            $table->dateTime('tg_ket_thuc');
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
        Schema::dropIfExists('bai_kiem_tras');
    }
}