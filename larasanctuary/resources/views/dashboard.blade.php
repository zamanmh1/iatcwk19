@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    You are logged in!
                    @if (Gate::allows('user'))
                      <div class="container">
                        <div class="btn-group" role="group" aria-label="admin options">
                          <a href ="/adoptions" class="btn btn-primary">View and approve adoption requests</a>
                          <a href ="/animals" class="btn btn-secondary">See all animals including owners</a>
                        </div>
                      </div>

                      @else
                        <div class="container">
                          <div class="row">
                            <div class="btn-group" role="group" aria-label="user options" >
                              <a href="/animals" class="btn btn-primary">Animals available for adoption</a>
                              <a href="/adoptions" class="btn btn-secondary">View my adoption requests and check status</a>
                            </div>
                          </div>
                        </div>
                    @endif
                </div>
          </div>
      </div>
  </div>
</div>
@endsection
