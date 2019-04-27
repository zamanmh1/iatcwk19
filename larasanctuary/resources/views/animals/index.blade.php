@extends('layouts.app')
@section('content')
  @section('title', 'Animals available')
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card">
          <div class="card-header">Animals</div>

          <div class="card-body">
            <table class = "table table-striped">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Birth year</th>
                  <th>Description</th>
                  <th>Image</th>
                  <th>Type</th>
                  @if (Gate::allows('user'))
                    <th>Owner ID</th>

                  @endif


                  <th colspan="5">Action</th>
                </tr>
              </thead>
              <tbody>
                @foreach($animals as $animal)
                  <tr>
                    <td>{{$animal['name']}}</td>
                    <td>{{$animal['birth_year']}}</td>
                    <td>{{$animal['description']}}</td>
                    <td>{{$animal['image']}}</td>
                    <td>{{$animal['type_of_pet']}}</td>
                    @if (Gate::allows('user'))
                      <td>{{$animal['userid']}}</td>

                    @endif



                    <td><a href="{{action('AnimalController@show',$animal['id'])}}" class="btn
                      btn-primary">Details</a></td>

                      @if (Gate::allows('user'))
                        <td><a href="{{action('AnimalController@edit', $animal['id'])}}" class="btn
                          btn-warning">Edit</a>
                        </td>

                        <td>
                          <form action="{{action('AnimalController@destroy', $animal['id'])}}"
                          method="post"> @csrf
                          <input name="_method" type="hidden" value="DELETE">
                          <button class="btn btn-danger" type="submit">Delete</button>
                        </form>
                      </td>

                    @endif
                  </tr>
                @endforeach
              </tbody>
            </table>
            <!-- Did have pagination here but removed for now -->
          </div>
        </div>
      </div>
    </div>
  </div>
@endsection
