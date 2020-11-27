<template>
    <div class="col-md-4">
        <span class="sponsors">Search Article</span>
        <br>
        <form class="form-inline my-2 my-lg-0" @submit.prevent="searchResults">
            <input class="form-control mr-sm-2" v-model="search" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
        <br>
        <span class="sponsors">Topics</span>
        <div class="list-group">
            <a v-for="topic in topics" :key="topic.topic_id" @click.prevent="topicSearch(topic.topic_id,topic.topic_name)" href="#" class="list-group-item list-group-item-action select-topic">
                {{ topic.topic_name }}
            </a>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                search: '',
                topics: ''       
            }
        },
        methods: {
            search_article: _.debounce(() => {
                Fire.$emit('search_article');
            }),
            search_topic: _.debounce(() => {
                Fire.$emit('search_topic');
            }),

            searchResults(){
                if(this.$route.name == 'search'){
                    //this.$router.push({query: {article: this.search}});
                    this.$parent.search_article = true;
                    this.$parent.search_topic = false;
                    this.$router.replace({ query: {article: this.search}});
                    this.search_article();
                }else{
                    this.$parent.search_article = true;
                    this.$parent.search_topic = false;
                    this.$router.push({name: 'search', query: {article: this.search} });
                }
                
            },
            topicSearch(id,name){
                if(this.$route.name == 'search'){
                    //this.$router.push({query: {article: this.search}});
                    this.$parent.search_article = false;
                    this.$parent.search_topic = true;
                    this.$router.replace({ query: { topic_id: id, topic_name: name}});
                    this.search_topic();
                }else{
                    this.$parent.search_article = false;
                    this.$parent.search_topic = true;
                    this.$router.push({name: 'search', query: {topic_id: id, topic_name: name} });
                }
                
            },
            loadTopics(){
                axios.get('/api/user/topics')
                    .then((response) => {
                       this.topics = response.data;
                    })
            }
        },
        created() {
            this.loadTopics();
        }
    }
</script>