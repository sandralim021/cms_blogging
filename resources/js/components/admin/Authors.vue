<template>
    <div class="container">
        <div class="row mt-3">
            <div class="col-sm-6">
                <h1>Authors</h1>
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
                                    <th>Name</th>
                                    <th>Photo</th>
                                    <th>Email</th>
                                    <th>Modify</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(author,index) in authors.data" :key="author.id">
                                    <td>{{ index + 1 }}</td>
                                    <td>{{ author.name }}</td>
                                    <td><img :src="'/img/user_photos/'+author.photo" width="50" height="50" class="img-circle"></td>
                                    <td>{{ author.email }}</td>
                                    <td>
                                        <a href="#" @click="editModal(author)" class="btn btn-sm btn-warning">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <a href="#" @click="deleteAuthor(author.id)" class="btn btn-sm btn-danger">
                                            <i class="fa fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer d-flex justify-content-center">
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="author_modal" tabindex="-1" aria-labelledby="author_modalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="author_modalLabel">{{ editmode ? 'Update Author Information' : 'Add New Author'}}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form class="form-horizontal" @submit.prevent="editmode ? updateAuthor() : createAuthor()">
                        <div class="modal-body">
                            <div class="form-group row">
                                <label for="name" class="col-sm-2 col-form-label">Name</label>
                                <div class="col-sm-8">
                                    <input v-model="form.name" type="text" name="name" placeholder="Enter Name" class="form-control"
                                        :class="{ 'is-invalid': form.errors.has('name') }">
                                    <has-error :form="form" field="name"></has-error>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-8">
                                    <input v-model="form.email" type="email" name="email" placeholder="Enter Email" class="form-control"
                                        :class="{ 'is-invalid': form.errors.has('email') }">
                                    <has-error :form="form" field="email"></has-error>
                                </div>
                            </div>
                            <div class="form-group row" v-if="editmode===true">
                                <label for="photo" class="col-sm-2 col-form-label">Photo Preview</label>
                                <div class="col-sm-5">
                                    <img :src="'/img/user_photos/'+form.current_photo" width="150" height="150" class="img-fluid">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="photo" class="col-sm-2 col-form-label">{{editmode ? 'Update Photo' : 'Photo'}}</label>
                                <div class="col-sm-8">
                                    <input type="file" id="photo" @change="pictureAction" name="photo" class="form-input">
                                </div>
                            </div>
                            <div v-if="editmode===false" class="form-group row">
                                <label for="password" class="col-sm-2 col-form-label">Password</label>
                                <div class="col-sm-8">
                                    <input v-model="form.password" type="password" name="password" placeholder="Enter Password" class="form-control"
                                        :class="{ 'is-invalid': form.errors.has('password') }">
                                    <has-error :form="form" field="password"></has-error>
                                </div>
                            </div>
                            <div v-if="editmode===true" class="form-group row">
                                <label for="password" class="col-sm-2 col-form-label">Update Password</label>
                                <div class="col-sm-8">
                                    <input v-model="form.updated_password" type="password" name="updated_password" placeholder="(Leave Empty If Not Changing)" class="form-control"
                                        :class="{ 'is-invalid': form.errors.has('updated_password') }">
                                    <has-error :form="form" field="updated_password"></has-error>
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
                authors: {},
                search: '',
                form: new Form({
                    id: '',
                    name: '',
                    email: '',
                    photo: '',
                    current_photo: '',
                    password: '',
                    updated_password: ''
                })
            }
        },
        methods: {
            newModal(){
                this.editmode = false;
                this.form.clear();
                this.form.reset();
                $('#photo').val('');
                $('#author_modal').modal('show');      
            },
            createAuthor(){
                this.$Progress.start();
                this.form.post('api/author')
                .then(()=>{
                    $('#author_modal').modal('hide');
                    toast.fire({
                        icon: 'success',
                        title: 'Author Created Successfully'
                    });
                    this.loadArticles();
                    this.$Progress.finish();
                })
                .catch(()=>{
                    this.$Progress.fail();
                })
            },
            loadAuthors(){
                axios.get('api/author').then(({ data }) => (this.authors = data));
            },
            editModal(author){
                this.editmode = true;
                this.form.clear();
                this.form.reset();
                $('#author_modal').modal('show');
                this.form.id = author.id;
                this.form.name = author.name;
                this.form.email = author.email;
                this.form.current_photo = author.photo;
                this.form.password = author.password;
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
                        'Should be image file (.png /.jpg)',
                        'error'
                    )
                    $('#photo').val('');
                }
            }
        },
        created() {
            this.loadAuthors();
        }
    }
</script>
