<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGiangViensTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('giang_viens', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_khoa')->nullable();
            $table->foreignId('id_chuc_vu');
            $table->foreignId('id_lop')->nullable();
            $table->string('email')->unique();
            $table->string('password')->unique();
            $table->string('avt')->nullable();
            $table->string('ma_so');
            $table->string('sdt');
            $table->string('ho_ten');
            $table->date('ngay_sinh');
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
        Schema::dropIfExists('giang_viens');
    }
}