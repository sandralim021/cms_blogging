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
            <a href="" @click.prevent="LikeFunction"><i class="fa-thumbs-up" :class="[like ? 'fas' : 'far']"></i></a> <b>{{ like ? 'Liked' : 'Like'}} (0 Likes)</b>  
        </div>
             
    </div>
</template>

<script>
   export default {
        data(){
            return {
                like: false,
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
                    axios.post('/api/user/like/add_like/'+this.content.article_id)
                    .then(()=>{
                        this.like = true;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
                }else if(this.like==true){
                    axios.delete('/api/user/like/remove_like/'+this.content.article_id)
                    .then(()=>{
                        this.like = false;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
                }

            }
        },

        created() {
            // Create multiple requests for viewing article and like status
            this.$Progress.start();
            axios.get(`/api/user/view_article/${this.$route.params.article_id}`)
            .then(({ data }) => {
                //Passing value into contents
                this.content.article_id = data.article_id;
                this.content.title = data.title;
                this.content.topic = data.topic_name;
                this.content.photo = data.photo;
                this.content.content = data.content;
                this.content.author = data.name;
                this.content.created_at = data.created_at;
                this.$Progress.finish();
            })
            .catch(()=>{
                //Failed
                this.$Progress.fail();
            })
            
            
        }
    }
</script>
