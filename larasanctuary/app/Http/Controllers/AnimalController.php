<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Animal;
use Gate;


class AnimalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {   $animals = Animal::orderBy('name','asc')->paginate(10);
        return view('animals.index', compact('animals'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
      if (Gate::allows('user')) {
        return view('animals.create');
      } else {
        return "Unauthorised action";
      }

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
      // form validation
    $animal = $this->validate(request(), [
      'name' => 'required',
      'birth_year' => 'required|numeric',
      'image' => 'sometimes|image|mimes:jpeg,png,jpg,gif,svg|max:500',
      'type_of_pet' => 'required'

  ]);

  // handles image uploading
  if ($request->hasFile('image')){
    // get the file name with the get_loaded_extensions
    $fileNameWithExtension = $request->file('image')->getClientOriginalName();
    // get the file name only
    $fileName = pathinfo($fileNameWithExtension, PATHINFO_FILENAME);
    // get the extension
    $extension = $request->file('image')->getClientOriginalExtension();
    // get the filename to store
    $fileNameToStore = $fileName . '_' . time() . '.' . $extension;

    // upload the image
    $path = $request->file('image')->storeAs('public/images', $fileNameToStore);
  } else {
    $fileNameToStore = 'noImage.jpg';
  }

  // create a animal object and set its values from the input
  $animal = new Animal;
  $animal->name = $request->input('name');
  $animal->description = $request->input('description');
  $animal->birth_year = $request->input('birth_year');
  $animal->type_of_pet = $request->input('type_of_pet');
  $animal->created_at = now();
  $animal -> image = $fileNameToStore;

  // save the animal object
  $animal->save();

  // generate a redirect HTTP response with a success message
  return back()->with('success', 'animal has been added');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $animal = Animal::find($id);
        return view('animals.show',compact('animal'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $animal = Animal::find($id);
        return view('animals.edit', compact('animal'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $animal = Animal::find($id);
        $this->validate(request(), [
          'reg_no' => 'required',
          'daily_rate' => 'required|numeric'
        ]);

        $animal->name = $request->input('name');
        $animal->description = $request->input('description');
        $animal->birth_year = $request->input('birth_year');
        $animal->type_of_pet = $request->input('type_of_pet');
        $animal->created_at = now();
        $animal -> image = $fileNameToStore;

        // save the animal object
        $animal->save();

        // generate a redirect HTTP response with a success message
        return back()->with('success', 'animal has been updated');
      }



    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
      $animal = Animal::find($id);
      $animal->delete();
      return redirect('animals')->with('success', 'Animal has been deleted');
    }
}
