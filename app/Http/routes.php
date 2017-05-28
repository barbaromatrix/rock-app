<?php

$app->get('/', function() use($app){
    return $app->version();
});

$app->get('doacao[/]', 'DoacaoController@index');
$app->put('doacao/{id_doacao}', 'DoacaoController@update');