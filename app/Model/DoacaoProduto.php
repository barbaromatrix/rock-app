<?php

namespace App\Model;
use Illuminate\Database\Eloquent\Model;

class DoacaoProduto extends Model
{
    protected $table        = 'tb_doacao_produto';
    protected $primaryKey   = 'id_doacao_produto';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id_doacao_produto', 'id_doacao', 'id_produto'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $dates = [
        'created_at', 'updated_at'
    ];
}
