@extends('layouts.app')
  @section('content')
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8 ">
        <div class="card">
          <div class="card-header">Animals available for adoption</div>
          <div class="card-body">
            <table class="table table-striped" border="1" >
              <tr>
                <td>
                  <b>Name
                    </th>
                <td> {{$animal['name']}}</td>
              </tr>

              <tr>
                <th>Birth year</th>
                <td>{{$animal->birth_year}}</td>
              </tr>

              <tr>
                <td>Type of pet</td>
              </th>
              <td>{{$animal->type_of_pet}}</td>
              </tr>

            <tr>
              <th>Description</th>
              <td style="max-width:150px;" >{{$animal->description}}</td>
            </tr>

            <tr>
              <td colspan='2' >
                <img style="width:100%;height:100%" src="{{ asset('storage/images/'.$animal->image)}}">
              </td>
            </tr>
            </table>
          <table>
            <tr>

              <td>
                <a href="/animals" class="btn btn-primary" role="button">Make an adoption request</a>
              </td>

              <td>
                <a href="{{ URL::previous() }}" class="btn btn-secondary" role="button">Back to the list</a>
              </td>

              <td>
                <a href="{{action('AnimalController@edit', $animal['id'])}}" class="btn btn-warning">Edit</a>
              </td>

              <td>
                <form action="{{action('AnimalController@destroy', $animal['id'])}}" method="post">
                  @csrf
                  <input name="_method" type="hidden" value="DELETE" />
                  <button class="btn btn-danger" type="submit">Delete</button>
                </form>
              </td>
            </tr>
          </table>
          </div>
      </div>
    </div>
  </div>
  </div>
@endsection
