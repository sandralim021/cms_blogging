<template>
    <div class="container">
        <div class="justify-content-center">
            <div class="col-md-8">
                    <img class="img-responsive" width="800" height="400" style="background-image:url('./img/alone.jpg');">
            </div>
            <div class="col-md-4 mt-3">
                <span class="main-article-category">Card Category</span>
                <br>
                <span class="main-article-title">This is the title...</span>
                <br>
                <span class="author-name">By Kaycee</span>
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
