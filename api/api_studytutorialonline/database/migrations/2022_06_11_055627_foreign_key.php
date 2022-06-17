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
        });
        Schema::table('ds_sinh_viens', function (Blueprint $table) {
            $table->foreign('id_sinh_vien')->references('id')->on('sinh_viens');
            $table->foreign('id_lop_hoc_phan')->references('id')->on('lop_hoc_phans');
            $table->foreign('id_lop')->references('id')->on('lops');
        });
        Schema::table('ds_giang_viens', function (Blueprint $table) {
            $table->foreign('id_giang_vien')->references('id')->on('giang_viens');
            $table->foreign('id_lop_hoc_phan')->references('id')->on('lop_hoc_phans');
        });
        Schema::table('bai_taps', function (Blueprint $table) {
            $table->foreign('id_file')->references('id')->on('files');
            $table->foreign('id_lop_hoc_phan')->references('id')->on('lop_hoc_phans');
            $table->foreign('id_loai')->references('id')->on('loai_bai_taps');
        });
        Schema::table('ct_bai_taps', function (Blueprint $table) {
            $table->foreign('id_sinh_vien')->references('id')->on('sinh_viens');
            $table->foreign('id_lop_hoc_phan')->references('id')->on('lop_hoc_phans');
            $table->foreign('id_bai_tap')->references('id')->on('bai_taps');
        });
        Schema::table('tra_lois', function (Blueprint $table) {
            $table->foreign('id_sinh_vien')->references('id')->on('sinh_viens');
            $table->foreign('id_cau_hoi')->references('id')->on('cau_hois');
            $table->foreign('id_file')->references('id')->on('files');
        });
        Schema::table('cau_hois', function (Blueprint $table) {
            $table->foreign('id_bai_kiem_tra')->references('id')->on('bai_kiem_tras');
            $table->foreign('id_file')->references('id')->on('files');
        });
        Schema::table('bai_kiem_tras', function (Blueprint $table) {
            $table->foreign('id_lop_hoc_phan')->references('id')->on('lop_hoc_phans');
            $table->foreign('id_giang_vien')->references('id')->on('giang_viens');
            $table->foreign('id_file')->references('id')->on('files');
        });
        Schema::table('ct_bai_kiem_tras', function (Blueprint $table) {
            $table->foreign('id_bai_kiem_tra')->references('id')->on('bai_kiem_tras');
            $table->foreign('id_tra_loi')->references('id')->on('tra_lois');
        });
        Schema::table('files', function (Blueprint $table) {
            $table->foreign('id_bai_viet')->references('id')->on('bai_viets');
        });
        Schema::table('check_files', function (Blueprint $table) {
            $table->foreign('id_bai_viet')->references('id')->on('bai_viets');
            $table->foreign('id_file')->references('id')->on('files');
        });
        Schema::table('bai_viets', function (Blueprint $table) {
            $table->foreign('id_lop_hoc_phan')->references('id')->on('lop_hoc_phans');
            $table->foreign('id_loai_bai_viet')->references('id')->on('loai_bai_viets');
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