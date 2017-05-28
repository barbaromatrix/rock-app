<?php

$app->get('/', function() use($app){
    return \App\Model\Doacao::all();
});

$app->get('doacao[/]', 'DoacaoController@index');
$app->put('doacao/{id_doacao}', 'DoacaoController@update');