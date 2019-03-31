<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Animal extends Model
{

    public function user() {
      return $this->belongsTo('App\User','id');
    }
}
