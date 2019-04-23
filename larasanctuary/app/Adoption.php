<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Adoption extends Model
{

  /**
   * Get the animal record associated with the adoption.
   */
  public function animal(){
    return $this->hasOne('App\Animal', 'id');
  }

  /**
   * Get the user record associated with the adoption.
   */
  public function user() {
    return $this->hasOne('App\User', 'id');
  }


}
