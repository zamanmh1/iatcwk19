<!-- inherite master template app.blade.php -->
@extends('layouts.app')

<!-- define the content section -->
@section('content')
  <div class="container">
    <div class="row justify-content center">
      <div class="col-md-10">
        <div class="card">
          <div class="card-header">Add a new animal for adoption</div>
          <!-- display the errors -->
          @if ($errors->any())
            <div class="alert alert-danger">
              <ul> @foreach ($errors->all() as $error)
                <li>{{ error }}</li @endforeach
              </ul>

            </div><br /> @endif

            <!-- display the success status -->
            @if (\Session::has('success'))
              <div class="alert alert-success">
                <p>{{ \Session::get('success') }}</p>
              </div><br /> @endif

           <!-- define the form -->
           <div class="card-body">
             <form class="form-horizontal" method="POST" action="{{url('animals')}}"
             enctype="multipart/form-data">
             @csrf
               <div class="col-md-8">
                 <label>Name</label>
                 <input type="text" name="name" placeholder="enter animal's name here" />
               </div>

               <div class="col-md-8">
                 <label>Birth year</label>
                 <input type="number" name="birth_year" placeholder="enter animal's date of birth here" />
               </div>

               <div class="col-md-8">
                 <label>Description</label>
                 <textarea rows="4" cols="50" name="description"> Notes about the animal</textarea>
               </div>

               <div class="col-md-8">
                 <label>Type of animal</label>
                 <select name="category">
                   <option value="cat">Cat</option>
                   <option value="dog">Dog</option>
                   <option value="bird">Rabbit</option>
                   <option value="horse">Horse</option>
                   <option value="ferret">Ferret</option>
                   <option value="fish">Fish</option>
                   <option value="rat/mice">Rat/Mice</option>
                   <option value="amphibian">Amphibian</option>
                   <option value="reptile">Reptile</option>
                 </select>
               </div>

               <div class="col-md-8">
                 <label>Image</label>
                 <input type="file" name="image" placeholder="Image file" />
               </div>

               <div class="col-md-6 col-md-offset-4">
                 <input type="submit" class="btn btn-primary" />
                 <input type="reset" class="btn btn-primary" />
               </div>
             </form>
           </div>
        </div>
      </div>
    </div>
  </div>
@endsection
