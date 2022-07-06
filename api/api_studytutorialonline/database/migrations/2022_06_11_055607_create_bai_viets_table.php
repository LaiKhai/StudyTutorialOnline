<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBaiVietsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bai_viets', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_lop_hoc_phan');
            $table->foreignId('id_loai_bai_viet');
            $table->foreignId('id_sinh_vien')->nullable()->default('1');
            $table->foreignId('id_giang_vien')->nullable()->default('1');
            $table->string('noi_dung')->nullable()->default('');
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
        Schema::dropIfExists('bai_viets');
    }
}