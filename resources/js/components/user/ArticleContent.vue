<template>
    <div class="container">
        <div class="article-content">
            <div class="col-md-8">
                <img class="img-fluid" :src="'./img/alone.jpg'">
            </div>
            <div class="col-md-4 mt-3">
                <span class="main-article-category">Card Category</span>
                <br>
                <span class="main-article-title">This is the title...</span>
                <br>
                <span class="author-name">By Kaycee</span>
            </div>
            <div class="col-md-8">
                <hr>
                 <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Perspiciatis eius commodi vel corporis qui laudantium repudiandae ut cum recusandae illo quaerat, nulla inventore adipisci, magnam eaque libero corrupti? Illo, id.</p>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
