<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Animal extends Model
{
  protected $fillable = ['name', 'description'];

    public function user() {
      return $this->belongsTo('App\User','id');
    }
}
