<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTbProduto extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tb_produto', function (Blueprint $table) {
            $table->increments('id_produto');
            $table->string('nm_produto');
            $table->integer('qt_produto');
            
            $table->integer('id_tipo_produto')->unsigned();
            $table->foreign('id_tipo_produto')->references('id_tipo_produto')->on('tb_tipo_produto');
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
        Schema::drop('tb_produto');
    }
}
