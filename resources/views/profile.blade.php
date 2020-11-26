@extends('layouts.app')
    @auth('web')
        @section('content')
            <!-- Set progressbar -->
            <vue-progress-bar></vue-progress-bar>
            <!-- Router view -->
            <div class="container">
                <div class="row justify-content-center">
                    <profile></profile>
                </div>
            </div>
        @endsection
    @endauth