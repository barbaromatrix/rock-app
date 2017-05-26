<?php

namespace App\Model;
use Illuminate\Database\Eloquent\Model;

class TipoProduto extends Model
{
    protected $table        = 'tb_tipo_produto';
    protected $primaryKey   = 'id_tipo_produto';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id_tipo_produto', 'nm_tipo_produto'
    ];
    
    public $dates = [
        'created_at', 'updated_at'
    ];
}
