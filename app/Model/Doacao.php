<?php

namespace App\Model;
use Illuminate\Database\Eloquent\Model;

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
    
    
}
