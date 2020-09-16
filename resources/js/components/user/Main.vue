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
                <div class="d-flex justify-content-center">
                    <pagination :data="articles" @pagination-change-page="getResults">
                        <span slot="prev-nav">&lt; Previous</span>
                        <span slot="next-nav">Next &gt;</span>
                    </pagination>
                </div>
            </div>
            <div class="col-md-4">
                <span class="sponsors">Search Article</span>
                <br>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" v-model="search" @keyup="searchit" type="search" placeholder="Search" aria-label="Search">
                </form>
                <br>
                <span class="sponsors">Topics</span>
                <div class="list-group">
                    <a v-for="topic in topics" :key="topic.topic_id" :value="topic.topic_id" href="#" class="list-group-item list-group-item-action">
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
                editmode: false,
                articles: {},
                topics: '',
                search: ''
            }
        },
        methods: {
            loadArticles(){
                this.$Progress.start();
                axios.get('api/user/articles').then(({ data }) => (this.articles = data))
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
            searchit:_.debounce(() => {
                Fire.$emit('searching');
            },1000)
        },
        created(){
            Fire.$on('searching',() => {
                let query = this.search;
                axios.get('api/user/findArticle?q=' + query)
                .then((data) => {
                    this.articles = data.data
                })
                .catch(() => {

                })
            })
            this.loadTopics();
            this.loadArticles();
        }
    }
</script>