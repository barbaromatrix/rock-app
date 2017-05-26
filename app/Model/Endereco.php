<?php

namespace App\Model;
use Illuminate\Database\Eloquent\Model;

class Endereco extends Model
{
    protected $table        = 'tb_endereco';
    protected $primaryKey   = 'id_endereco';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id_endereco', 'nm_logradouro', 'cd_logradouro', 'ds_complemento', 'nm_bairro', 'id_cidade'
    ];
    
    public $dates = [
        'created_at', 'updated_at'
    ];
    
}
