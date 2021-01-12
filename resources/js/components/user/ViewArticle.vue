<template>
    <div class="col-md-8">
        <br>
        <span class="recent-articles">{{content.title}}</span>
        <br>
        <span class="author-name">By {{ content.author }} - {{content.topic}} - {{ content.created_at | articleDate }}</span>
        <hr>
        <img class="img-fluid" width="800" height="400" :src="'/img/article_photos/'+content.photo">
        <hr>
        <p v-html="content.content"></p>
        <hr>
        <div class="float-left">
            <i class="far fa-comment"></i> <b>0 Comments</b>   
        </div>
        <div class="float-right">
            <a href="" @click.prevent="LikeFunction"><i class="fa-thumbs-up" :class="[like ? 'fas' : 'far']"></i></a> <b>{{ like ? 'Liked' : 'Like'}} ({{ like_count }} Likes)</b>  
        </div>
             
    </div>
</template>

<script>
   export default {
        data(){
            return {
                like: false,
                like_count: '',
                content: {
                    article_id: '',
                    title: '',
                    topic: '',
                    photo: '',
                    content: '',
                    author: '',
                    created_at: '',
                }
            }
        },

        methods:{
            LikeFunction(){
                if(this.like==false){
                    axios.all([
                        axios.post('/api/user/like/add_like/'+this.content.article_id), 
                        axios.get('/api/user/like/like_status/'+this.content.article_id)
                    ])
                    .then(axios.spread((obj1,obj2)=>{
                        this.like = true;
                        this.like_count = obj2.data.like_count;
                    }))
                    .catch(function (error) {
                        console.log(error);
                    });
                }else if(this.like==true){
                    axios.all([
                        axios.delete('/api/user/like/remove_like/'+this.content.article_id), 
                        axios.get('/api/user/like/like_status/'+this.content.article_id)
                    ])
                    .then(axios.spread((obj1,obj2)=>{
                        this.like = false;
                        this.like_count = obj2.data.like_count;
                    }))
                    .catch(function (error) {
                        console.log(error);
                    });
                }

            }
        },

        created() {
            this.$Progress.start();
            const article_id = this.$route.params.article_id;
            axios.all([
                axios.get('/api/user/view_article/'+article_id), 
                axios.get('/api/user/like/like_status/'+article_id)
            ])
            .then(axios.spread((obj1,obj2) => {
                //Passing value into contents
                this.content.article_id = obj1.data.article_id;
                this.content.title = obj1.data.title;
                this.content.topic = obj1.data.topic_name;
                this.content.photo = obj1.data.photo;
                this.content.content = obj1.data.content;
                this.content.author = obj1.data.name;
                this.content.created_at = obj1.data.created_at;
                //Determining like status
                if(obj2.data.status == 1){
                    this.like = true;
                }else if(obj2.data.status == 0){
                    this.like = false;
                }
                this.like_count = obj2.data.like_count;
                this.$Progress.finish();
            }))
            .catch(()=>{
                //Failed
                this.$Progress.fail();
            })
            
        }   
    }
    
</script>
