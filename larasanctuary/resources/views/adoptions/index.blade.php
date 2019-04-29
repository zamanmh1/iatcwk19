@extends('layouts.app')
@section('content')
  @section('title', 'Adoptions')

  <!-- display the errors -->
  @if ($errors->any())
    <div class="alert alert-danger">
      <ul>
        @foreach ($errors->all() as $error)
          <li>{{ $error }}</li>
        @endforeach
      </ul>
    </div><br />
  @endif
  <!-- display the success status -->
  @if (\Session::has('success'))
    <div class="alert alert-success">
      <p>{{ \Session::get('success') }}</p>
    </div><br />
  @endif

  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8 ">


        @if(Gate::allows('user'))
          <div class="card">
            <div class="card-header">Display all requests</div>
            <div class="card-body">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>Adoption ID</th>
                    <th>User ID</th>
                    <th>Adopter's Name</th>
                    <th>Animal ID</th>
                    <th>Animal Name</th>
                    <th>Status</th>
                    <th>Date</th>

                    <th colspan="3">Action</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach($adoptions as $adoption)
                    @foreach($users as $user)
                      @foreach($animals as $animal)
                        @if($user["id"]==$adoption["userid"])
                          @if($adoption["animalid"]==$animal["id"])


                            <tr>

                              <td>{{$adoption['id']}}</td>
                              <td>{{$adoption['userid']}}</td>
                              <td>{{$user['name']}}</td>
                              <td>{{$adoption['animalid']}}</td>
                              <td>{{$animal['name']}}</td>
                              <td>{{$adoption['status']}}</td>
                              <td>{{$adoption['updated_at']}}</td>

                              <td><a href="{{action('AnimalController@show', $animal['id'])}}" class="btn
                                btn- primary">Details</a></td>

                                @if (Gate::allows('user'))
                                  @if ($adoption['status'] == 'pending')
                                    <td><a href="{{action('AdoptionController@approve', $adoption['id'])}}" class="btn
                                      btn-primary">Approve</a>
                                    </td>
                                    <td><a href="{{action('AdoptionController@deny', $adoption['id'])}}" class="btn
                                      btn-warning">Deny</a>
                                    </td>
                                  @endif
                                @endif
                              </tr>
                            @endif
                          @endif
                        @endforeach
                      @endforeach
                    @endforeach
                  </tbody>
                </table>
              </div>
            </div>
          @else


            <div class="card">
              <div class="card-header">Display My Requests</div>
              <div class="card-body">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th>Adoption ID</th>
                      <th>User ID</th>
                      <th>User Name</th>
                      <th>Animal ID</th>
                      <th>Animal Name</th>
                      <th>Status</th>
                      <th>Date</th>
                    </tr>
                  </thead>
                  <tbody>

                    @foreach($adoptions as $adoption)
                      @if($adoption["userid"] == Auth::user()->id)
                        @foreach($animals as $animal)
                          @if($adoption["animalid"]==$animal["id"])
                            <tr>
                              <td>{{$adoption['id']}}</td>
                              <td>{{$adoption['userid']}}</td>
                              <td>{{Auth::user()->name}}</td>
                              <td>{{$adoption['animalid']}}</td>
                              <td>{{$animal['name']}}</td>
                              <td>{{$adoption['status']}}</td>
                              <td>{{$adoption['updated_at']}}</td>
                            @endif
                          @endforeach
                        @endif
                      @endforeach
                    @endif
                  </table>
                  <table>
                    <tr>
                      <td>
                        <a href="{{ URL::previous() }}" class="btn btn-primary" role="button">Back to the list</a>
                      </td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>
          @endsection
