<template>          
        <div class="col-md-8">
            <span class="recent-articles">Results For: {{ this.$route.query.article }}</span>
            <hr>
            <div class="row mb-3" v-for="article in articles.data" :key="article.article_id">
                <div class="col-md-4">
                    <img class="img-responsive" width="100%" :src="'/img/article_photos/'+article.photo">
                </div>
                <div class="col-md-8">
                    <br>
                    <span class="sub-article-date">{{article.created_at | articleDate}}</span>
                    <br>
                    <router-link :to="{name: 'view_article', params: { article_id: article.article_id }}" class="sub-article-title">{{article.title}}</router-link>
                    <br>
                    <span class="sub-article-author">By <span class="author-name">{{article.name}}</span></span>
                    <span class="sub-article-category">{{article.topic_name}}</span>
                </div>
                <hr>
            </div>
            <div class="d-flex justify-content-center">
                <pagination :data="articles" @pagination-change-page="searchResults">
                    <span slot="prev-nav">&lt; Previous</span>
                    <span slot="next-nav">Next &gt;</span>
                </pagination>
            </div>
        </div>
</template>

<script>
    export default {
        data(){
            return{
                articles: {},
                topics: ''   
            }
        },
        methods: {
            loadTopics(){
                axios.get('/api/user/topics')
                    .then((response) => {
                       this.topics = response.data;
                })
            },
            searchResults(page = 1){
                this.$Progress.start();
                let query = this.$route.query.article;
                axios.get('/api/user/findArticle/'+query+'?page=' + page)
                .then((data) => {
                    this.articles = data.data
                    this.$Progress.finish();
                })
                .catch(() => {
                    this.$Progress.fail();
                })
                
                
            },
        },
        created(){
            this.loadTopics();
            Fire.$on('searching',() => {
                this.$Progress.start();
                let query = this.$route.query.article;
                axios.get('/api/user/findArticle/'+query)
                .then((data) => {
                    this.articles = data.data
                    this.$Progress.finish();
                })
                .catch(() => {
                    this.$Progress.fail();
                })
            })
            this.searchResults();
            
        }
    }
</script>