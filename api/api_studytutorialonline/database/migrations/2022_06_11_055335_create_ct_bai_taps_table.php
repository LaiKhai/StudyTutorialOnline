<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCTBaiTapsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ct_bai_taps', function (Blueprint $table) {
            $table->foreignId('id_sinh_vien');
            $table->foreignId('id_bai_tap');
            $table->foreignId('id_file')->nullable();
            $table->foreignId('id_lop_hoc_phan');
            $table->string('noi_dung')->nullable();
            $table->dateTime('tg_nop_bai');
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
        Schema::dropIfExists('c_t_bai_taps');
    }
}