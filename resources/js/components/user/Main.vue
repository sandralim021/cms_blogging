<template>
    <div class="container">
        <span class="recent-articles">Recent Articles</span>
        <hr>
        <div class="row mt-3">
            <div class="col-md-8">
                <div class="row mb-3" v-for="article in articles.data" :key="article.article_id">
                    <div class="col-md-4">
                        <img class="img-responsive" width="100%" :src="'/img/article_photos/'+article.photo">
                    </div>
                    <div class="col-md-8">
                        <br>
                        <span class="sub-article-date">April 21, 2020</span>
                        <br>
                        <a href="#" class="sub-article-title">{{article.title}}</a>
                        <br>
                        <span class="sub-article-author">By <span class="author-name">{{article.name}}</span></span>
                        <span class="sub-article-category">{{article.topic_name}}</span>
                    </div>
                    <hr>
                </div>
                <div class="text-right"><span class="demo-link">More...</span></div>
            </div>
            <div class="col-md-4">
                <span class="sponsors">SPONSORS</span>
                <br><br>
                <img class="img-responsive" width="100%" src="http://via.placeholder.com/600x800">
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                editmode: false,
                articles: {},
                search: ''
            }
        },
        methods: {
            loadArticles(){
                this.$Progress.start();
                axios.get('api/loadArticles').then(({ data }) => (this.articles = data))
                .then(()=>{
                    toast.fire({
                        icon: 'success',
                        title: 'Data Loaded Successfully'
                    });
                    this.$Progress.finish();
                })
                .catch(()=>{
                    //Failed
                    this.$Progress.fail();
                })
            },
            getResults(page = 1){
                axios.get('user/api/articles?page=' + page)
				.then(response => {
					this.topics = response.data;
				});
            },
            searchit:_.debounce(() => {
                Fire.$emit('searching');
            },1000)
        },
        created() {
            this.loadArticles();
        }
    }
</script>