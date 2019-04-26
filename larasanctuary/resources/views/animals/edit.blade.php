@extends('layouts.app')
@section('content')
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8 ">
        <div class="card">
          <div class="card-header">Edit and update the animal</div>
          @if ($errors->any())
            <div class="alert alert-danger">
              <ul>
                @foreach ($errors->all() as $error)
                  <li>{{ $error }}</li>
                @endforeach
              </ul>
            </div><br />
          @endif
          @if (\Session::has('success'))
            <div class="alert alert-success">
              <p>{{ \Session::get('success') }}</p>
            </div><br />
          @endif


          <div class="card-body">
            <form class="form-horizontal" method="POST" action="{{ action('AnimalController@update', $animal['id']) }}"
            enctype="multipart/form-data">
            @method('PATCH')
            @csrf
            <div class="col-md-8">
              <label>Name</label>
              <input type="text" name="name" placeholder="{{$animal->name}}" />
            </div>

            <div class="col-md-8">
              <label>Birth year</label>
              <input type="number" name="birth_year" placeholder="{{$animal->birth_year}}" />
            </div>

            <div class="col-md-8">
              <label>Description</label>
              <textarea rows="4" cols="50" name="description"> {{$animal->description}}</textarea>
            </div>

            <div class="col-md-8">
              <label>Type of pet</label>
              <select name="type_of_pet">
                <option value="" disabled selected>{{$animal->type_of_pet}}</option>
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
              <input type="file" name="image" />
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
