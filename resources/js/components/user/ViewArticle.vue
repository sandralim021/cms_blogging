<template>
    <div class="col-md-8">
         <router-link to="/">
                <i class="nav-icon fas fa-arrow-left"> Back</i>
        </router-link>
        <br>
        <span class="recent-articles">{{content.title}}</span>
        <br>
        <span class="author-name">By {{ content.author }} - {{content.topic}} - {{ content.created_at | articleDate }}</span>
        <hr>
        <img class="img-fluid" width="800" height="400" :src="'/img/article_photos/'+content.photo">
        <hr>
        <p v-html="content.content"></p>
    </div>
</template>

<script>
   export default {
        data(){
            return {
              content: {
                    article_id: '',
                    title: '',
                    topic: '',
                    photo: '',
                    content: '',
                    author: '',
                    created_at: ''
                }
            }
        },

        created() {
            this.$Progress.start();
            axios.get(`/api/user/view_article/${this.$route.params.article_id}`)
            .then(({ data }) => {
              //Passing value into content
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
