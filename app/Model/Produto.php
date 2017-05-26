<?php

namespace App\Model;
use Illuminate\Database\Eloquent\Model;

class Produto extends Model
{
    protected $table        = 'tb_produto';
    protected $primaryKey   = 'id_produto';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id_produto', 'nm_produto', 'qt_produto', 'id_tipo_produto'
    ];
    
    public $dates = [
        'created_at', 'updated_at'
    ];
    
    public function estado()
    {
        return $this->belongsTo('App\Model\Estado', 'id_estado', 'id_estado');
    }
}
