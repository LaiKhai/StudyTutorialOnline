<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSinhViensTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sinh_viens', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_lop')->nullable();
            $table->string('email')->unique();
            $table->string('password')->unique();
            $table->string('ho_ten');
            $table->string('avt')->nullable();
            $table->string('mssv');
            $table->string('sdt');
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
        Schema::dropIfExists('sinh_viens');
    }
}