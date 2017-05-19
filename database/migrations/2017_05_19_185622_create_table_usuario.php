<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableUsuario extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tb_usuario', function (Blueprint $table) {
            $table->increments('id_usuario');
            $table->string('nm_usuario');
            $table->string('nm_email_usuario');
            $table->string('nm_senha_usuario');
            $table->tinyInteger('ic_status_usuario');
            
            $table->integer('id_endereco')->unsigned();
            $table->foreign('id_endereco')->references('id_endereco')->on('tb_endereco');
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
            $table->dropForeign(['id_endereco']);
        });
        
        Schema::drop('tb_usuario');
    }
}
