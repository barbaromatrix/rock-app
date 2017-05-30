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
    
    public function produto()
    {
        return $this->hasOne('App\Model\Produto', 'id_produto', 'id_produto');
    }
    
    public function doacao()
    {
        return $this->hasOne('App\Model\Doacao', 'id_doacao', 'id_doacao');
    }
}
