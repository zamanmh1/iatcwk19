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
                    @if (Auth::user()->role == 1)
                      <div>
                        <a href ="/animals" class="btn btn-primary">View and approve adoption requests</a>
                      </div>
                    @endif

                    @if (Auth::user()->role == 0)
                      <div class="container">
                        <div class="row">
                          <div class="btn-group" role="group" aria-label="user options" >
                            <a href="/animals" class="btn btn-primary">Animals available for adoption</a>
                            <a href="/animals" class="btn btn-secondary">View adoption requests and check status</a>
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
