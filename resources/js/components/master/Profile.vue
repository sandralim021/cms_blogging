<style>
    .widget-user-header {
        background-position: center center;
        background-size: cover;
        height: 250px !important;
    }

    .widget-user .card-footer {
        padding: 0;
    }

</style>

<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12 mt-3">
                <div class="card card-widget widget-user">
                    <!-- Add the bg color to the header using any of the bg-* classes -->
                    <div class="widget-user-header text-white" style="background-image:url('./img/alone.jpg');">
                        <h3 class="widget-user-username text-right">Elizabeth Pierce</h3>
                        <h5 class="widget-user-desc text-right">Web Designer</h5>
                    </div>
                    <div class="widget-user-image">
                        <img class="img-circle" :src="getProfilePhoto()" alt="User Avatar">
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header p-2">
                        <ul class="nav nav-pills">
                            <li class="nav-item"><a class="nav-link active" href="#profile" data-toggle="tab">Profile Information</a></li>
                        </ul>
                    </div><!-- /.card-header -->
                    <div class="card-body">
                        <div class="tab-content">
                            <!-- Profile Tab -->
                            <div class="tab-pane active" id="profile">
                                <form class="form-horizontal">
                                    <div class="form-group row">
                                        <label for="name" class="col-sm-2 col-form-label">Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" v-model="form.name" id="name" name="name" placeholder="Name" class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
                                            <has-error :form="form" field="name"></has-error>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="email" class="col-sm-2 col-form-label">Email</label>
                                        <div class="col-sm-10">
                                            <input type="email" v-model="form.email" id="email" name="email" placeholder="Email" class="form-control" :class="{ 'is-invalid': form.errors.has('email') }">
                                            <has-error :form="form" field="email"></has-error>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="photo" class="col-sm-2 col-form-label">Profile Photo</label>
                                        <div class="col-sm-10">
                                            <input type="file" @change="updateProfile" id="photo" name="photo" class="form-input">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="password" class="col-sm-2 col-form-label">Password</label>
                                        <div class="col-sm-10">
                                            <input type="password" v-model="form.password" id="password" name="password" placeholder="(leave empty if not changing)" class="form-control" :class="{ 'is-invalid': form.errors.has('password') }">
                                            <has-error :form="form" field="password"></has-error>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="offset-sm-2 col-sm-12">
                                            <button @click.prevent="updateInfo" type="submit" class="btn btn-success">Update</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- /.tab-pane -->
                        </div>
                        <!-- /.tab-content -->
                    </div><!-- /.card-body -->
                </div>
                <!-- /.nav-tabs-custom -->
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return {
               form: new Form({
                    id: '',
                    name: '',
                    email: '',
                    password: '',
                    photo: '',
                    current_photo: ''
                })
            }
        },

        mounted() {
            console.log('Component mounted.')
        },

        methods: {
            getProfilePhoto(){
                let prefix = (this.form.photo.match(/\//) ? '' : '/img/user_photos/');
                return prefix + this.form.photo;
            },

            updateInfo(){
                this.$Progress.start();
                var photo = $('#photo').val();
                if(photo == ""){
                    this.form.photo = this.form.current_photo;
                }
                 if(this.form.password==""){
                    this.form.password = undefined;
                }
                this.form.put('api/profile/')
                .then(()=>{
                    this.$Progress.finish();
                })
                .catch(()=>{
                    this.$Progress.fail();
                });
            },
            
            updateProfile(e){
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
            this.$Progress.start();
            axios.get('api/profile')
            .then(({ data }) => {
                this.form.id = data.id;
                this.form.name = data.name;
                this.form.photo = data.photo;
                this.form.current_photo = data.photo;
                this.form.email = data.email;
                this.form.password = data.password;
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
            
            
        }
    }
</script>
