@extends('layouts.app')
    @auth('web')
        @section('content')
            <router-view></router-view>
            <!-- set progressbar -->
            <vue-progress-bar></vue-progress-bar>
        @endsection
    @endauth
