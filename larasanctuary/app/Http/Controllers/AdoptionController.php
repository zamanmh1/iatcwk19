<?php

namespace App\Http\Controllers;
use App\Animal;
use App\Adoption;
use App\User;
use Gate;
use Illuminate\Support\Facades\Auth;

use Illuminate\Http\Request;

class AdoptionController extends Controller
{
  /**
   * Create a new controller instance.
   *
   * @return void
   */
  public function __construct()
  {
      $this->middleware('auth'); // protects functions from being access w/o login
  }
  /**
  * Display a listing of the resource.
  *
  * @return \Illuminate\Http\Response
  */
  public function index() {
    // bringing all models together
    $animals = Animal::all()->toArray();
    $adoptions = Adoption::all()->toArray();
    $users = User::all()->toArray();

    return view('adoptions.index', compact('animals', 'adoptions', 'users'));


  }

  public function submit($animalid) {
    $adoptions = Adoption::all()->toArray();
    foreach ($adoptions as $adoption) {
      if ($adoption["userid"] == Auth::user()->id) {
        if ($adoption["animalid"] == $animalid) {
          return back()->withErrors("Request already made");
        }
      }
    }

    // create adoption object and set values
    $adoption = new Adoption;
    $adoption->userid = Auth::user()->id;
    $adoption->animalid = $animalid;
    $adoption->created_at = now();
    $adoption->status = 'pending';
    $adoption->save();

    return back()->with('success', 'Request received');
  }

  public function approve($id) {
    // admin approves Request
    if (Gate::allows('user')) {
      $adoption = Adoption::find($id);
      $animal = Animal::find($adoption->animalid);
      $adoption->updated_at = now();
      $adoption->status = 'approved';
      $animal->userid = $adoption->userid;
      $animal->is_available = 0;
      $animal->save();
      $adoption->save();
      return back()->with('success', 'Approved');
    }
    return "Unauthorised attempt at approving a request";


  }

  public function deny($id) {
    // admin denies request

    if (Gate::allows('user')) {
      $adoption = Adoption::find($id);
      $adoption->updated_at = now();
      $adoption->status = 'denied';
      $adoption->save();
      return back()->with('success', 'Denied');
    }
    return "Unauthorised attempt at denying a request";

  }
}
