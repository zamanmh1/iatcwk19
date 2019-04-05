<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Animal extends Model
{

    protected $fillable = ['name', 'birth_year', 'description'];




    public function user() {
      return $this->belongsTo('App\User','id');
    }




}
