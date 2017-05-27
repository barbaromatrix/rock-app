<?php
use Illuminate\Http\Request;


$app->group(['prefix' => '/api'], function() use ($app) {
    $app->group(['prefix'   =>  '/usuario'], function() use ($app){
        
    });
    
    $app->group(['prefix'   =>  '/produto'], function() use ($app){
        
    });
    
    $app->group(['prefix'   =>  '/doacao'], function() use ($app){
        
    });
    
});
