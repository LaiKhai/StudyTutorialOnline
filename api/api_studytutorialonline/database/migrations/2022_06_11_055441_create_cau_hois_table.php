<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCauHoisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cau_hois', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_bai_kiem_tra');
            $table->foreignId('id_file');
            $table->string('de_bai');
            $table->string('dap_an_1');
            $table->string('dap_an_2');
            $table->string('dap_an_3');
            $table->string('dap_an_4');
            $table->string('dap_an_dung');
            $table->float('diem');
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
        Schema::dropIfExists('cau_hois');
    }
}