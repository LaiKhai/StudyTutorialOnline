<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBoMonsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bo_mons', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_khoa');
            $table->string('ten_mon_hoc');
            $table->integer('loai_mon_hoc');
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
        Schema::dropIfExists('bo_mons');
    }
}