<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTbDoacaoProduto extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tb_doacao_produto', function (Blueprint $table) {
            $table->increments('id_doacao_produto');
            
            $table->integer('id_doacao')->unsigned();
            $table->foreign('id_doacao')->references('id_doacao')->on('tb_doacao');
            
            $table->integer('id_produto')->unsigned();
            $table->foreign('id_produto')->references('id_produto')->on('tb_produto');
            
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
        Schema::table('tb_doacao_produto', function (Blueprint $table){
            $table->dropForeign(['id_produto', 'id_doacao']);
        });
        Schema::drop('tb_doacao_produto');
    }
}
