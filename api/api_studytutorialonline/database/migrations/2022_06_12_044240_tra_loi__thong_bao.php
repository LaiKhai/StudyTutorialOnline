<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class TraLoiThongBao extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('traloi_thongbao', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_sinh_vien');
            $table->foreignId('id_bai_viet');
            $table->foreignId('id_file')->nullable();
            $table->string('cau_tra_loi');
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
        Schema::dropIfExists('traloi_thongbao');
    }
}