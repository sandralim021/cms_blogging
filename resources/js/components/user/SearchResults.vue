<template>          
        <div class="col-md-8">
            <span v-if="this.$parent.search_article == true" span class="recent-articles">Results For: {{ this.$route.query.article }}</span>
            <span v-if="this.$parent.search_topic == true" span class="recent-articles">Results For Topic: {{ this.$route.query.topic_name }}</span>

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
                <pagination v-if="this.$parent.search_article == true" :data="articles" @pagination-change-page="searchResults">
                    <span slot="prev-nav">&lt; Previous</span>
                    <span slot="next-nav">Next &gt;</span>
                </pagination>
                <pagination v-if="this.$parent.search_topic == true" :data="articles" @pagination-change-page="topicResults">
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
                articles: {}
            }
        },
        methods: {
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
            topicResults(page = 1){
                this.$Progress.start();
                let query = this.$route.query.topic_id;
                axios.get('/api/user/TopicSearch/'+query+'?page='+page)
                .then((response) => {
                    this.articles = response.data
                    this.$Progress.finish();
                })
                .catch(() => {
                    this.$Progress.fail();
                })
            }
        },
        created(){
            Fire.$on('search_article',() => {
                this.searchResults();
            })
            Fire.$on('search_topic',() => {
                this.topicResults();
            })
            // Changing Condition
            if(this.$parent.search_article == true){
                this.searchResults();
            }
            if(this.$parent.search_topic == true){
                this.topicResults();
            }
            
        }
    }
</script>