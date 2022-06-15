<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBaiTapsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bai_taps', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_lop_hoc_phan');
            $table->foreignId('id_file')->nullable();
            $table->foreignId('id_loai');
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
        Schema::dropIfExists('bai_taps');
    }
}