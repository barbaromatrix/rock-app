<?php

namespace App\Model;
use Illuminate\Database\Eloquent\Model;

class Cidade extends Model
{
    protected $table        = 'tb_cidade';
    protected $primaryKey   = 'id_cidade';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id_cidade', 'nm_cidade', 'id_estado'
    ];
    
    public $dates = [
        'created_at', 'updated_at'
    ];
    
    public function estado()
    {
        return $this->belongsTo('App\Model\Estado', 'id_estado', 'id_estado');
    }
}
