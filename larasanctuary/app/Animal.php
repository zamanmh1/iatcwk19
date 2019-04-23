<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Animal extends Model
{

    protected $fillable = ['name', 'birth_year', 'description'];




    public function user() {
      return $this->belongsTo('App\User','id');
    }

    /**
    * Get the animal associated to the adoption
    */
    public function adoption(){
      return $this->belongsTo('App\Adoption', 'id');
    }

}
