@extends('layouts.app')
    @auth('web')
        @section('content')
            <!-- Set progressbar -->
            <vue-progress-bar></vue-progress-bar>
            <!-- Router view -->
            <div class="container">
                <div class="row mt-2">
                    <router-view></router-view>
                    <search-ui></search-ui>
                </div>
            </div>
        @endsection
    @endauth
