<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTbDoacao extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tb_doacao', function (Blueprint $table) {
            $table->increments('id_doacao');
            $table->date('dt_doacao');
            
            $table->integer('id_usuario_doador')->unsigned();
            $table->foreign('id_usuario_doador')->references('id_usuario')->on('tb_usuario');
            
            $table->integer('id_usuario')->unsigned();
            $table->foreign('id_usuario')->references('id_usuario')->on('tb_usuario');
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
        Schema::table('tb_usuario', function (Blueprint $table){
            $table->dropForeign(['id_usuario_doador', 'id_usuario']);
        });
        
        Schema::drop('tb_doacao');
    }
}
