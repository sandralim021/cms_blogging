<template>
    <div class="container">
        <span class="recent-articles">Articles</span>
        <hr>
        <div class="row mt-3">
            <div class="col-md-8">
                <div class="row mb-3" v-for="article in articles.data" :key="article.article_id">
                    <div class="col-md-4">
                        <img class="img-responsive" width="100%" :src="'/img/article_photos/'+article.photo">
                    </div>
                    <div class="col-md-8">
                        <br>
                        <span class="sub-article-date">{{article.created_at | articleDate}}</span>
                        <br>
                        <a href="#" class="sub-article-title">{{article.title}}</a>
                        <br>
                        <span class="sub-article-author">By <span class="author-name">{{article.name}}</span></span>
                        <span class="sub-article-category">{{article.topic_name}}</span>
                    </div>
                    <hr>
                </div>
                <div class="d-flex justify-content-center">
                    <pagination v-if="normalmode == true" :data="articles" @pagination-change-page="getResults">
                        <span slot="prev-nav">&lt; Previous</span>
                        <span slot="next-nav">Next &gt;</span>
                    </pagination>
                    <pagination v-if="searchmode == true" :data="articles" @pagination-change-page="searchResults">
                        <span slot="prev-nav">&lt; Previous</span>
                        <span slot="next-nav">Next &gt;</span>
                    </pagination>
                    <pagination v-if="topicsearch == true" :data="articles" @pagination-change-page="TopicResults">
                        <span slot="prev-nav">&lt; Previous</span>
                        <span slot="next-nav">Next &gt;</span>
                    </pagination>
                    
                </div>
            </div>
            <div class="col-md-4">
                <span class="sponsors">Search Article</span>
                <br>
                <form class="form-inline my-2 my-lg-0" @submit.prevent="searchResults()">
                    <input class="form-control mr-sm-2" v-model="search" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                <br>
                <span class="sponsors">Topics</span>
                <div class="list-group">
                    <a v-for="topic in topics" :key="topic.topic_id" @click.prevent="TopicSearch(topic.topic_id)" href="#" class="list-group-item list-group-item-action select-topic">
                        {{ topic.topic_name }}
                    </a>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                articles: {},
                topics: '',
                search: '',
                topic_search: '',
                normalmode: true,
                searchmode: false,
                topicsearch: false,
            }
        },
        methods: {
            loadTopics(){
                axios.get('api/user/topics')
                    .then((response) => {
                       this.topics = response.data;
                    })
            },
            getResults(page = 1){
                this.$Progress.start();
                axios.get('api/user/articles?page=' + page)
				.then(response => {
                    this.articles = response.data;
                    this.$Progress.finish();
                })
                .catch(()=>{
                    //Failed
                    this.$Progress.fail();
                })
            },
            TopicSearch(topic){
                this.topic_search = topic;
                this.TopicResults();
            },
            TopicResults(page = 1){
                this.$Progress.start();
                axios.get('api/user/TopicSearch/'+this.topic_search+'?page='+page)
                .then((response) => {
                    this.articles = response.data
                    this.normalmode = false;
                    this.searchmode = false;
                    this.topicsearch = true;
                    this.$Progress.finish();
                })
                .catch(() => {
                    this.$Progress.fail();
                })
            },
            searchResults(page = 1){
                this.$Progress.start();
                let query = this.search;
                if(query === ''){
                    this.getResults();
                    this.normalmode = true;
                    this.searchmode = false;
                    this.topicsearch = false;
                    this.$Progress.finish();
                }else{
                    axios.get('api/user/findArticle/'+query+'?page=' + page)
                    .then((data) => {
                        this.articles = data.data
                        this.normalmode = false;
                        this.searchmode = true;
                        this.topicsearch = false;
                        this.$Progress.finish();
                    })
                    .catch(() => {
                        
                    })
                }
                
            }
        },
        created(){
            this.loadTopics();
            this.getResults();
        }
    }
</script>