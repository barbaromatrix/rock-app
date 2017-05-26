<?php

namespace App\Model;
use Illuminate\Database\Eloquent\Model;

class Estado extends Model
{
    protected $table        = 'tb_estado';
    protected $primaryKey   = 'id_estado';
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id_estado', 'nm_estado',
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    public $dates = [
        'created_at', 'updated_at'
    ];
}
