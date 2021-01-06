<template>          
        <div class="col-md-8">
            <span class="recent-articles">Articles</span>
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
                    <div class="mt-3">
                        <i class="far fa-thumbs-up"></i>0 Likes
                        <i class="far fa-comment ml-2"></i>0 Comments
                    </div>
                    
                </div>
                <hr>
            </div>
            <div class="d-flex justify-content-center">
                <pagination :data="articles" @pagination-change-page="getResults">
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
            getResults(page = 1){
                this.$Progress.start();
                axios.get('/api/user/articles?page=' + page)
				.then(response => {
                    this.articles = response.data;
                    this.$Progress.finish();
                })
                .catch(()=>{
                    //Failed
                    this.$Progress.fail();
                })
            }
        },
        created(){
            this.loadTopics();
            this.getResults();
        }
    }
</script>