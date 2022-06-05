<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ForeignKey extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       Schema::table('sinh_viens', function (Blueprint $table) {
            $table->foreign('id_lop')->references('id')->on('lops');
        });
        Schema::table('bo_mons', function (Blueprint $table) {
            $table->foreign('id_khoa')->references('id')->on('khoas');
        });
        Schema::table('giang_viens', function (Blueprint $table) {
            $table->foreign('id_khoa')->references('id')->on('khoas');
            $table->foreign('id_chuc_vu')->references('id')->on('chuc_vus');
        });
        Schema::table('lops', function (Blueprint $table) {
            $table->foreign('id_giangvien')->references('id')->on('giang_viens');
        });
        Schema::table('lop_hoc_phans', function (Blueprint $table) {
            $table->foreign('id_bo_mon')->references('id')->on('bo_mons');
            $table->foreign('id_lop')->references('id')->on('lops');
        });
        Schema::table('ds_sinh_viens', function (Blueprint $table) {
            $table->foreign('id_sinh_vien')->references('id')->on('sinh_viens');
            $table->foreign('id_lop_hoc_phan')->references('id')->on('lop_hoc_phans');
        });
        Schema::table('ds_giang_viens', function (Blueprint $table) {
            $table->foreign('id_giang_vien')->references('id')->on('giang_viens');
            $table->foreign('id_lop_hoc_phan')->references('id')->on('lop_hoc_phans');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('foreign_keys');
    }
}