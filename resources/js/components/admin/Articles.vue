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
                                <input type="text" name="search" class="form-control float-right" placeholder="Search">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
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
                                    <th>Status</th>
                                    <th>Modify</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer d-flex justify-content-center">
                       
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="article_modal" tabindex="-1" aria-labelledby="article_modalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="article_modalLabel">{{ editmode ? 'Update Article Information' : 'Add New Topic'}}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form class="form-horizontal" @submit.prevent="editmode ? updateArticle() : createArtocle()">
                        <div class="modal-body">
                            <div class="form-group row">
                                <label for="title" class="col-sm-2 col-form-label">Title</label>
                                <div class="col-sm-5">
                                     <input v-model="form.title" type="text" name="title" placeholder="Enter Title" class="form-control"
                                        :class="{ 'is-invalid': form.errors.has('title') }">
                                    <has-error :form="form" field="title"></has-error>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="Content" class="col-sm-2 col-form-label">Content</label>
                                <div class="col-sm-10">
                                    <textarea class="textarea" placeholder="Place some text here"></textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="photo" class="col-sm-2 col-form-label">Photo</label>
                                <div class="col-sm-5">
                                    <input type="file" id="photo" name="photo" class="form-input">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="article_status" class="col-sm-2 col-form-label">Status</label>
                                <div class="col-sm-5">
                                     <select v-model="form.article_status" class="form-control" name="article_status" :class="{ 'is-invalid': form.errors.has('article_status') }">
                                        <option value="" selected>Select Status</option>
                                        <option value="0">Draft</option>
                                        <option value="1">Published</option>
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
    export default {
        data(){
            return{
                editmode: false,
                articles: {},
                search: '',
                form: new Form({
                    article_id: '',
                    title: '',
                    content: '',
                    photo: '',
                    article_status: ''
                })
            }
        },
        methods: {
            newModal(){
                this.editmode = false;
                this.form.clear();
                this.form.reset();
                $('#article_modal').modal('show');      
            }
        },
        mounted() {
           $('.textarea').summernote({
                toolbar: [
                    [ 'style', [ 'style' ] ],
                    [ 'font', [ 'bold', 'italic', 'underline', 'clear'] ],
                    [ 'fontname', [ 'fontname' ] ],
                    [ 'fontsize', [ 'fontsize' ] ],
                    [ 'color', [ 'color' ] ],
                    [ 'para', [ 'ol', 'ul', 'paragraph', 'height' ] ],
                    [ 'table', [ 'table' ] ],
                    [ 'insert', [ 'link'] ],
                    [ 'view', [ 'undo', 'redo', 'codeview', 'help' ] ]
                ]
           });
        }
    }
</script>
