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

        $procedure = "DROP PROCEDURE IF EXISTS `Bat_dau_KT`;
            DELIMITER $$
            CREATE PROCEDURE `Bat_dau_KT`(IN `id_bai_ktra` INT, IN `id_lop_hphan` INT)
            INSERT INTO tra_lois(id_sinh_vien,id_cau_hoi) select id_sinh_vien,cau_hois.id from ds_sinh_viens, cau_hois where id_bai_kiem_tra = id_bai_ktra and ds_sinh_viens.id_lop_hoc_phan=1$$
            DELIMITER ;";
        DB::unprepared($procedure);
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