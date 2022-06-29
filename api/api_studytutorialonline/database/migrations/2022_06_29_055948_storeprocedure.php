<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class Storeprocedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        $dropbatdauKT = "DROP PROCEDURE IF EXISTS `Bat_dau_KT`;";
        $droptaobaiKT = "DROP PROCEDURE IF EXISTS `tao_Bai_Ktra`;";
        $droptaoCauTraLoi = "DROP PROCEDURE IF EXISTS `Tao_cau_TrL`;";

        DB::unprepared($dropbatdauKT);
        DB::unprepared($droptaobaiKT);
        DB::unprepared($droptaoCauTraLoi);

        $batdauKT = 'CREATE PROCEDURE `Bat_dau_KT`(IN `id_bai_ktra` INT, IN `id_lop_hphan` INT) 
        BEGIN
        INSERT INTO tra_lois(id_sinh_vien,id_cau_hoi) 
        select id_sinh_vien,cau_hois.id from ds_sinh_viens, cau_hois 
        where id_bai_kiem_tra = id_bai_ktra and ds_sinh_viens.id_lop_hoc_phan=id_lop_hphan; 
        END';

        $taoBaiKT = 'CREATE PROCEDURE `tao_Bai_Ktra`(IN `tg_ket_thuc` DATETIME, IN `id_lop_hoc_phan` INT,IN `sl_cau_hoi` INT, IN `id_giang_vien` INT, IN `tieu_de` VARCHAR(255), IN `noi_dung` VARCHAR(255)) 
        BEGIN
        INSERT INTO `bai_kiem_tras`(`id_lop_hoc_phan`, `id_giang_vien`, `sl_cau_hoi`, `tieu_de`, `noi_dung`, `tg_bat_dau`, `trang_thai`, `created_at`)
        VALUES (id_lop_hoc_phan,id_giang_vien,sl_cau_hoi,tieu_de,noi_dung,NOW(),1,NOW()); 
        END';

        $taoCauHoi = "CREATE PROCEDURE `tao_cau_hoi`(IN `id_bai_kiem_tra` INT, IN `de_bai` VARCHAR(255), IN `dap_an_1` VARCHAR(255), IN `dap_an_2` VARCHAR(255), IN `dap_an_3` VARCHAR(255), IN `dap_an_4` VARCHAR(255), IN `dap_an_dung` VARCHAR(255),INT `diem` INT) 
        INSERT INTO `cau_hois`( `id_bai_kiem_tra`, `de_bai`, `dap_an_1`, `dap_an_2`, `dap_an_3`, `dap_an_4`, `dap_an_dung`, `diem`, `trang_thai`, `created_at`, `updated_at`) 
        VALUES (id_bai_kiem_tra,de_bai,dap_an_1,dap_an_2,dap_an_3,dap_an_4,dap_an_dung,diem,1,NOW(),NOW());";

        $taoCauTraLoi = "CREATE PROCEDURE `Tao_cau_TrL`(IN `dapan` VARCHAR(15), IN `id_cauhoi` INT, IN `id_baikt` INT, IN `id_cautrl` INT) 
            UPDATE `tra_lois` SET `dap_an`=dapan,`diem`= Case 
            WHEN `dap_an`=(SELECT `dap_an_dung`FROM `cau_hois` WHERE cau_hois.id=id_cauhoi AND cau_hois.id_bai_kiem_tra=id_baikt)
            THEN (SELECT `diem`FROM `cau_hois` WHERE cau_hois.id=3 AND  cau_hois.id_bai_kiem_tra=1)
            WHEN `dap_an`!=(SELECT `dap_an_dung`FROM `cau_hois` WHERE cau_hois.id=id_cauhoi AND cau_hois.id_bai_kiem_tra=id_baikt) THEN 0 END,
            `trang_thai`=1,`created_at`=Now(),`updated_at`=Now() WHERE id=id_cautrl and id_cau_hoi=id_cauhoi;";

        DB::unprepared($taoBaiKT);
        DB::unprepared($batdauKT);
        DB::unprepared($taoCauHoi);
        DB::unprepared($taoCauTraLoi);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
    }
}