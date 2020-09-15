@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row mt-3 mb-3">
        <div class="col-md-8">
            <img class="img-responsive" width="100%" src="http://via.placeholder.com/800x500">
        </div>
        <div class="col-md-4 mt-3">
            <br>
            <span class="main-article-category">Article Category</span>
            <br>
            <span class="main-article-title">This is the article title...</span>
            <br>
            <span>By <span class="author-name">Kassandra Lim</span></span>
        </div>
    </div>
    <span class="recent-articles">Recent Articles</span>
    <hr>
    <div class="row mt-3">
        <div class="col-md-8">
            <div class="row">
                <div class="col-md-4">
                    <img class="img-responsive" width="100%" src="http://via.placeholder.com/800x500">
                </div>
                <div class="col-md-8">
                    <br>
                    <span class="sub-article-date">April 21, 2020</span>
                    <br>
                    <span class="sub-article-title">Title of the first sub article</span>
                    <br>
                    <span class="sub-article-author">By <span class="author-name">Kassandra Lim</span></span>
                    <span class="sub-article-category">Article Category</span>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-4">
                    <img class="img-responsive" width="100%" src="http://via.placeholder.com/800x500">
                </div>
                <div class="col-md-8">
                    <br>
                    <span class="sub-article-date">April 21, 2020</span>
                    <br>
                    <span class="sub-article-title">Title of the first sub article</span>
                    <br>
                    <span class="sub-article-author">By <span class="author-name">Kassandra Lim</span></span>
                    <span class="sub-article-category">Article Category</span>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-4">
                    <img class="img-responsive" width="100%" src="http://via.placeholder.com/800x500">
                </div>
                <div class="col-md-8">
                    <br>
                    <span class="sub-article-date">April 21, 2020</span>
                    <br>
                    <span class="sub-article-title">Title of the first sub article</span>
                    <br>
                    <span class="sub-article-author">By <span class="author-name">Kassandra Lim</span></span>
                    <span class="sub-article-category">Article Category</span>
                </div>
            </div>
            <hr>
            <div class="text-right"><span class="demo-link">More...</span></div>
        </div>
        <div class="col-md-4">
            <span class="sponsors">SPONSORS</span>
            <br><br>
            <img class="img-responsive" width="100%" src="http://via.placeholder.com/600x800">
        </div>
    </div>
</div>
@endsection
