<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTraLoisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tra_lois', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_sinh_vien');
            $table->foreignId('id_cau_hoi');
            $table->foreignId('id_file')->nullable();
            $table->string('dap_an');
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
        Schema::dropIfExists('tra_lois');
    }
}