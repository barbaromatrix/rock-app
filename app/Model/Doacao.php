<?php

namespace App\Model;
use Illuminate\Database\Eloquent\Model;

use \Carbon\Carbon;

class Doacao extends Model
{
    protected $table        = 'tb_doacao';
    protected $primaryKey   = 'id_doacao';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id_doacao', 'dt_doacao', 'id_usuario_doador', 'id_usuario'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    public $dates = [
        'created_at', 'updated_at', 'dt_doacao'
    ];
    
    public function __construct()
    {
        Carbon::setLocale('pt_BR');
    }
    
    public function doacaoProduto()
    {
        return $this->belongsTo('App\Model\DoacaoProduto', 'id_doacao', 'id_doacao');
    }
    
    public function doador()
    {
        return $this->belongsTo('App\Model\Usuario', 'id_usuario', 'id_usuario');
    }
    
    public static function getDoacoes()
    {
        $doacoes = self::where(['ic_disponivel' => '1', 'id_usuario' => null])
                        ->orderby('updated_at', 'desc')
                        ->get();
        
        if ($doacoes->isEmpty()) {
            return null;
        }
        
        return $doacoes->map(function($item){
            $item->data_oferta  =   $item->created_at->diffForHumans();
            $item->produto      =   $item->doacaoProduto->produto;
            $item->doador       =   $item->doador;
            return $item;
        });
    }
}
