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
            <a v-for="topic in topics" :key="topic.topic_id" @click.prevent="TopicSearch(topic.topic_id)" href="#" class="list-group-item list-group-item-action select-topic">
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
            searchit: _.debounce(() => {
                Fire.$emit('searching');
            }),

            searchResults(){
                if(this.$route.name == 'search'){
                    //this.$router.push({query: {article: this.search}});
                    this.$router.push({ query: Object.assign({}, this.$route.query, { article: this.search }) });
                    this.searchit();
                }else{
                    this.$router.push({name: 'search', query: {article: this.search} });
                }
                
            },
            topicSearch(){

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