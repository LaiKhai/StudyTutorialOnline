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
        $droptaoCauHoi = "DROP PROCEDURE IF EXISTS `tao_cau_hoi`;";
        $droptaoDSSV = "DROP PROCEDURE IF EXISTS `tao_dssv`;";
        $droptaoDSGV = "DROP PROCEDURE IF EXISTS `tao_dsgv`;";
        $droptaoTongDiem = "DROP PROCEDURE IF EXISTS `TongDiem`;";
        $droptaoCTBaiKiemTra = "DROP PROCEDURE IF EXISTS `update_ct_bai_kiem_tra`;";
        $droptaocapnhatBKT = "DROP PROCEDURE IF EXISTS `cap_nhat_trang_thai_CTBKT`;";
        $droptaoCauTraLoi2 = "DROP PROCEDURE IF EXISTS `tao_chi_tiet_bai_ktra_2`;";
        $dropTinhDiem = "DROP FUNCTION IF EXISTS `TinhDiem`;";
        $dropTaoTraLoiThongBao = "DROP PROCEDURE IF EXISTS `tao_traloi_thongbao`;";
        $dropCapNhatTraLoiThongBao = "DROP PROCEDURE IF EXISTS `capnhat_traloi_thongbao`;";

        DB::unprepared($dropbatdauKT);
        DB::unprepared($droptaobaiKT);
        DB::unprepared($droptaoCauTraLoi);
        DB::unprepared($droptaoCauHoi);
        DB::unprepared($droptaoDSSV);
        DB::unprepared($droptaoDSGV);
        DB::unprepared($droptaoTongDiem);
        DB::unprepared($droptaoCTBaiKiemTra);
        DB::unprepared($droptaocapnhatBKT);
        DB::unprepared($droptaoCauTraLoi2);
        DB::unprepared($dropTinhDiem);
        DB::unprepared($dropTaoTraLoiThongBao);
        DB::unprepared($dropCapNhatTraLoiThongBao);

        $batdauKT = 'CREATE PROCEDURE `Bat_dau_KT`(IN `id_bai_ktra` INT, IN `id_lop_hphan` INT) 
        BEGIN
        INSERT INTO tra_lois(id_sinh_vien,id_cau_hoi)
        select id_sinh_vien,cau_hois.id from ds_sinh_viens, cau_hois 
        where id_bai_kiem_tra = id_bai_ktra and ds_sinh_viens.id_lop_hoc_phan=id_lop_hphan; 
        END';

        $taoBaiKT = 'CREATE PROCEDURE `tao_Bai_Ktra`(IN `tg_ket_thuc` DATETIME, IN `id_lop_hoc_phan` INT,IN `sl_cau_hoi` INT, IN `id_giang_vien` INT, IN `tieu_de` VARCHAR(255), IN `noi_dung` VARCHAR(255), IN `trang_thai` INT) 
        BEGIN
        INSERT INTO `bai_kiem_tras`(`id_lop_hoc_phan`, `id_giang_vien`, `sl_cau_hoi`, `tieu_de`, `noi_dung`, `tg_bat_dau`, `trang_thai`, `created_at`)
        VALUES (id_lop_hoc_phan,id_giang_vien,sl_cau_hoi,tieu_de,noi_dung,NOW(),trang_thai,NOW()); 
        END';

        $taoCauHoi = "CREATE PROCEDURE `tao_cau_hoi`(IN `id_bai_kiem_tra` INT, IN `de_bai` VARCHAR(255), IN `dap_an_1` VARCHAR(255), IN `dap_an_2` VARCHAR(255), IN `dap_an_3` VARCHAR(255), IN `dap_an_4` VARCHAR(255), IN `dap_an_dung` VARCHAR(255), IN `diem` INT)
        INSERT INTO `cau_hois`( `id_bai_kiem_tra`, `de_bai`, `dap_an_1`,`dap_an_2`, `dap_an_3`, `dap_an_4`, `dap_an_dung`, `diem`, `trang_thai`, `created_at`, `updated_at`) 
        VALUES (id_bai_kiem_tra,de_bai,dap_an_1,dap_an_2,dap_an_3,dap_an_4,dap_an_dung,diem,1,NOW(),NOW());";

        $taoCauTraLoi = "CREATE PROCEDURE `Tao_cau_TrL`(IN `dapan` VARCHAR(15), IN `id_cauhoi` INT, IN `id_cautrl` INT) 
            UPDATE `tra_lois` SET `dap_an`=dapan,`diem`= Case 
            WHEN dapan =(SELECT `dap_an_dung`FROM `cau_hois` WHERE cau_hois.id=id_cauhoi)
            THEN (SELECT `diem`FROM `cau_hois` WHERE cau_hois.id=id_cauhoi)
            ELSE 0 END,
            `trang_thai`=1,`created_at`=Now(),`updated_at`=Now() WHERE id=id_cautrl";

        $taoDSSV = "CREATE PROCEDURE `tao_dssv`(IN `id_sinh_vien` VARCHAR(255),IN `id_lop_hoc_phan` INT)
        INSERT INTO `ds_sinh_viens`(`id_sinh_vien`,`id_lop_hoc_phan`,`trang_thai`,`created_at`,`updated_at`)
        VALUES(id_sinh_vien,id_lop_hoc_phan,1,NOW(),NOW());";

        $taoDSGV = "CREATE PROCEDURE `tao_dsgv`(IN `id_giang_vien` VARCHAR(255),IN `id_lop_hoc_phan` INT)
        INSERT INTO `ds_giang_viens`(`id_giang_vien`,`id_lop_hoc_phan`,`trang_thai`,`created_at`,`updated_at`)
        VALUES(id_giang_vien,id_lop_hoc_phan,1,NOW(),NOW());";

        $tongDiem = "CREATE PROCEDURE `TongDiem`(IN `idbaikiem_tra` INT, IN `idsinhvien` INT, OUT `diem` FLOAT)
        SELECT sum(tra_lois.diem) FROM `tra_lois`,cau_hois 
        where tra_lois.id_cau_hoi=cau_hois.id AND tra_lois.id_sinh_vien=idsinhvien 
        AND cau_hois.id_bai_kiem_tra=idbaikiem_tra;";

        $tao_ct_bai_kiem_tra = "CREATE PROCEDURE `update_ct_bai_kiem_tra`(IN `id_bai_kiem_tra` INT, IN `id_sinh_vien` INT, IN `trang_thai` INT)
        UPDATE `ct_bai_kiem_tras` SET `tg_nop_bai`=NOW(),`tong_diem`=TinhDiem(id_bai_kiem_tra,id_sinh_vien),`trang_thai`=trang_thai where `id_bai_kiem_tra`=id_bai_kiem_tra And `id_sinh_vien`=id_sinh_vien;";

        $tinhdiem = "CREATE FUNCTION `TinhDiem`(`id_bai_kiem_tra` DOUBLE, `id_sinh_vien` DOUBLE) RETURNS double
                        BEGIN
                        DECLARE tong double;  
                        SELECT sum(tra_lois.diem) INTO tong FROM `tra_lois`,cau_hois 
                                where tra_lois.id_cau_hoi=cau_hois.id AND tra_lois.id_sinh_vien=id_sinh_vien 
                                AND cau_hois.id_bai_kiem_tra=id_bai_kiem_tra;
                        RETURN tong;
                        END;";


        $capnhatCTBKT = "CREATE PROCEDURE `cap_nhat_trang_thai_CTBKT`(IN `id_bai_kiem_tra` INT, IN `id_sinh_vien` INT, IN `trang_thai` INT)
        UPDATE `ct_bai_kiem_tras` SET `trang_thai`=trang_thai WHERE `ct_bai_kiem_tras`.`id_bai_kiem_tra`=id_bai_kiem_tra AND `ct_bai_kiem_tras`.`id_sinh_vien`=id_sinh_vien;";

        $taoCauTraLoi2 = "CREATE PROCEDURE `tao_chi_tiet_bai_ktra_2`(IN `idbaikiemtra` INT, IN `trangthai` INT)
        INSERT INTO `ct_bai_kiem_tras`(`id_bai_kiem_tra`, `id_sinh_vien`, `tg_nop_bai`, `tong_diem`, `trang_thai`, `created_at`, `updated_at`) 
        SELECT cau_hois.id_bai_kiem_tra, tra_lois.id_sinh_vien,NOW(),0,trangthai,NOW(),NOW() FROM cau_hois,tra_lois WHERE cau_hois.id=tra_lois.id_cau_hoi AND cau_hois.id_bai_kiem_tra=idbaikiemtra GROUP BY cau_hois.id_bai_kiem_tra,tra_lois.id_sinh_vien;";

        $taotraloithongbao = "CREATE PROCEDURE `tao_traloi_thongbao`(IN `id_sinh_vien` INT, IN `id_bai_viet` INT, IN `id_file` INT, IN `cau_tra_loi` VARCHAR(255), IN `trang_thai` INT)
        INSERT INTO `traloi_thongbao`(`id_sinh_vien`, `id_bai_viet`, `cau_tra_loi`, `id_file`, `trang_thai`, `created_at`, `updated_at`) VALUES (id_sinh_vien,id_bai_viet,cau_tra_loi,id_file,trang_thai,NOW(),NOW());";

        $capnhattraloithongbao = "CREATE PROCEDURE `capnhat_traloi_thongbao`(IN `id_sinh_vien` INT, IN `id_bai_viet` INT, IN `id_file` INT, IN `cau_tra_loi` VARCHAR(255), IN `trang_thai` INT)
        UPDATE `traloi_thongbao` SET `id_sinh_vien`=id_sinh_vien,`id_bai_viet`=id_bai_viet,`cau_tra_loi`=cau_tra_loi,`id_file`=id_file,`trang_thai`=trang_thai,`created_at`=NOW(),`updated_at`=NOW()
        WHERE `id_sinh_vien`=id_sinh_vien AND `id_bai_viet`=id_bai_viet;";

        DB::unprepared($taoBaiKT);
        DB::unprepared($batdauKT);
        DB::unprepared($taoCauHoi);
        DB::unprepared($taoCauTraLoi);

        DB::unprepared($taoDSSV);
        DB::unprepared($taoDSGV);
        DB::unprepared($tongDiem);
        DB::unprepared($tinhdiem);
        DB::unprepared($tao_ct_bai_kiem_tra);
        DB::unprepared($capnhatCTBKT);
        DB::unprepared($taoCauTraLoi2);
        DB::unprepared($taotraloithongbao);
        DB::unprepared($capnhattraloithongbao);
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