<template>
    <div class="container">
        <div class="row mt-3">
            <div class="col-sm-6">
                <h1>Articles</h1>
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                         <div class="float-left">
                            <button class="btn btn-success" @click="newModal">Add Record <i
                                            class="fas fa-plus"></i></button>
                        </div>
                        <div class="float-right">
                            <div class="input-group input-group-sm">
                                <input type="text" name="search" @keyup.enter="searchResults()" v-model="search" class="form-control float-right" placeholder="Search">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-primary" @click.prevent="searchResults()">Search</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover text-nowrap">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Title</th>
                                    <th>Photo</th>
                                    <th>Topic</th>
                                    <th>Content</th>
                                    <th>Created By</th>
                                    <th>Status</th>
                                    <th>Modify</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(article,index) in articles.data" :key="article.article_id">
                                    <td>{{(index + 1) + (articles.from - 1)}}</td>
                                    <th>{{article.title}}</th>
                                    <td><img :src="'/img/article_photos/'+article.photo" width="50" height="50" class="img-fluid"></td>
                                    <td>{{article.topic_name}}</td>
                                    <td>{{article.content | striphtml}}</td>
                                    <td>{{article.name}}</td>
                                    <td v-if="article.article_status == 'draft'">
                                        <span class="badge bg-warning">Draft</span>
                                    </td>
                                    <td v-else>
                                        <span class="badge bg-success">Published</span>
                                    </td>
                                    <td>
                                        <a href="#" @click="editModal(article)" class="btn btn-sm btn-warning">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <a href="#" @click="deleteArticle(article.article_id)" class="btn btn-sm btn-danger">
                                            <i class="fa fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer d-flex justify-content-center">
                       <pagination v-if="normalmode == true" :data="articles" @pagination-change-page="getResults">
                            <span slot="prev-nav">&lt; Previous</span>
	                        <span slot="next-nav">Next &gt;</span>
                        </pagination>
                        <pagination v-if="searchmode == true" :data="articles" @pagination-change-page="searchResults">
                            <span slot="prev-nav">&lt; Previous</span>
	                        <span slot="next-nav">Next &gt;</span>
                        </pagination>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="article_modal" tabindex="-1" aria-labelledby="article_modalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="article_modalLabel">{{ editmode ? 'Update Article Information' : 'Add New Article'}}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form class="form-horizontal" @submit.prevent="editmode ? updateArticle() : createArticle()">
                        <div class="modal-body">
                            <div class="form-group row">
                                <label for="title" class="col-sm-2 col-form-label">Title</label>
                                <div class="col-sm-5">
                                     <input v-model="form.title" type="text" name="title" placeholder="Enter Title" class="form-control"
                                        :class="{ 'is-invalid': form.errors.has('title') }">
                                    <has-error :form="form" field="title"></has-error>
                                </div>
                            </div>
                            <div class="form-group row" v-if="editmode===true">
                                <label for="photo" class="col-sm-2 col-form-label">Photo Preview</label>
                                <div class="col-sm-5">
                                    <img :src="'/img/article_photos/'+form.current_photo" width="150" height="150" class="img-round">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="photo" class="col-sm-2 col-form-label">{{editmode ? 'Update Photo' : 'Photo'}}</label>
                                <div class="col-sm-5">
                                    <input type="file" id="photo" @change="pictureAction" name="photo" class="form-input">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="topic" class="col-sm-2 col-form-label">Topic</label>
                                <div class="col-sm-5">
                                     <select v-model="form.topic" class="form-control" name="topic" :class="{ 'is-invalid': form.errors.has('topic') }">
                                        <option value="">Select Topic</option>
                                        <option v-for="topic in topics" :key="topic.topic_id" :value="topic.topic_id">
                                            {{ topic.topic_name }}
                                        </option>
                                    </select>
                                    <has-error :form="form" field="topic"></has-error>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="content" class="col-sm-2 col-form-label">Content</label>
                                <div class="col-sm-10">
                                     <quill-editor v-model="form.content" name="content" :class="{ 'is-invalid': form.errors.has('topic') }" :options="editorOption" style="height: 350px; padding-bottom: 75px;"></quill-editor>
                                     <has-error :form="form" field="content"></has-error>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="article_status" class="col-sm-2 col-form-label">Status</label>
                                <div class="col-sm-5">
                                     <select v-model="form.article_status" class="form-control" name="article_status" :class="{ 'is-invalid': form.errors.has('article_status') }">
                                        <option value="" selected>Select Status</option>
                                        <option value="draft">Draft</option>
                                        <option value="published">Published</option>
                                    </select>
                                    <has-error :form="form" field="article_status"></has-error>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">{{ editmode ? 'Update' : 'Create'}}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import 'quill/dist/quill.snow.css'
    import { quillEditor } from 'vue-quill-editor'
    Vue.filter('striphtml', function (value) {
        var div = document.createElement("div");
        div.innerHTML = value;
        var text = div.textContent || div.innerText || "";
        var final_value = '';
        if(text.length < 15){
            final_value = text;
        }else{
            final_value = text.substring(0,15)+"...";
        }
        return final_value;
    });
    export default {
        data(){
            return{
                editorOption: {
                    placeholder: 'Write something fantastic...',
                },
                editmode: false,
                normalmode: true,
                searchmode: false,
                articles: {},
                topics: '',
                search: '',
                form: new Form({
                    article_id: '',
                    title: '',
                    topic: '',
                    content: '',
                    photo: '',
                    current_photo: '',
                    article_status: ''
                })
            }
        },
        components: {
            quillEditor
        },
        methods: {
            newModal(){
                this.editmode = false;
                this.form.clear();
                this.form.reset();
                $('#photo').val('');
                $('#article_modal').modal('show');      
            },
            loadTopics(){
                axios.get('api/get_topics')
                    .then((response) => {
                       this.topics = response.data;
                    })
            },
            getResults(page = 1){
                this.$Progress.start();
                axios.get('api/article?page=' + page)
				.then(response => {
                    this.articles = response.data;
                    this.$Progress.finish();
                })
                .catch(()=>{
                    this.$Progress.fail();
                })
            },
            searchResults(page = 1){
                let query = this.search;
                this.$Progress.start();
                if(query === ''){
                    this.getResults();
                    this.normalmode = true;
                    this.searchmode = false;
                    this.$Progress.finish();
                }else{
                    axios.get('api/findArticle/'+query+'?page=' + page)
                    .then((response) => {
                        this.articles = response.data
                        this.normalmode = false;
                        this.searchmode = true;
                        this.$Progress.finish();
                    })
                    .catch(() => {
                        this.$Progress.fail();
                    })
                }
                
            },
            createArticle(){
                this.$Progress.start();
                this.form.post('api/article')
                .then(()=>{
                    $('#article_modal').modal('hide');
                    toast.fire({
                        icon: 'success',
                        title: 'Article Created Successfully'
                    });
                    this.getResults();
                    this.$Progress.finish();
                })
                .catch(()=>{
                    this.$Progress.fail();
                })
            },
            editModal(article){
                this.editmode = true;
                this.form.clear();
                this.form.reset();
                $('#photo').val('');
                $('#article_modal').modal('show');
                this.form.article_id = article.article_id;
                this.form.title = article.title;
                this.form.topic = article.topic_id;
                this.form.content = article.content;
                this.form.current_photo = article.photo;
                this.form.photo = article.photo;
                this.form.article_status = article.article_status;
            },
            updateArticle(){
                var photo = $('#photo').val();
                if(photo == ""){
                    this.form.photo = this.form.current_photo;
                }
                this.$Progress.start();
                this.form.put('api/article/'+this.form.article_id)
                .then(()=>{
                    $('#article_modal').modal('hide');
                    toast.fire({
                        icon: 'success',
                        title: 'Article Updated Successfully'
                    });
                    this.getResults();
                    this.$Progress.finish();
                })
                .catch(()=>{
                    //Failed
                    this.$Progress.fail();
                })
            },
            deleteArticle(id){
                swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.value) {
                        // Send Request To The Server
                        this.form.delete('api/article/'+id).then(() =>{
                            swal.fire(
                                'Deleted!',
                                'Record has been deleted.',
                                'success'
                            )
                            this.loadArticles();
                        }).catch(()=>{
                            swal.fire(
                                'Failed!',
                                'Error while deleting the article information',
                                'warning'
                            )
                        })
                    }
                    
                })
            },
            pictureAction(e){
                let file = e.target.files[0];
                var reader = new FileReader();
                console.log(file);
                if(file['type'] === 'image/jpeg' || file['type'] === 'image/png'){
                    reader.onloadend = (file) => {
                        this.form.photo = reader.result;
                    }
                    reader.readAsDataURL(file);
                }else{
                    swal.fire(
                        'Failed!',
                        'Should be image file (.png / .jpg)',
                        'error'
                    )
                    $('#photo').val('');
                }
            }
        },
        created() {
            this.loadTopics();
            this.getResults();
        }
    }
</script>
