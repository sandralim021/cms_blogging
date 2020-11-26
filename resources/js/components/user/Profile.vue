<template>
    <div class="col-md-8">
        <div class="card">
            <div class="card-header">Profile Information</div>
            <div class="card-body">
                <form novalidate>
                    <div class="form-group row">
                        <label for="name" class="col-md-4 col-form-label text-md-right">Name</label>
                        <div class="col-md-6">
                            <input v-model="form.name" id="name" type="text" class="form-control" :class="{ 'is-invalid': form.errors.has('name') }" name="name" autofocus>
                            <has-error :form="form" field="name"></has-error>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="email" class="col-md-4 col-form-label text-md-right">Email</label>
                        <div class="col-md-6">
                            <input v-model="form.email" id="email" type="email" class="form-control" :class="{ 'is-invalid': form.errors.has('email') }" name="email">
                            <has-error :form="form" field="email"></has-error>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                        <div class="col-md-6">
                            <input v-model="form.password" id="password" type="password" class="form-control" :class="{ 'is-invalid': form.errors.has('password') }" name="password" placeholder="(leave empty if not changing)">
                            <has-error :form="form" field="password"></has-error>
                        </div>
                    </div>

                    <div class="form-group row mb-0 text-center">
                        <div class="col-md-6 offset-md-4">
                            <button @click.prevent="updateInfo" type="submit" class="btn btn-primary">
                                Update Profile
                            </button>
                        </div>
                    </div>
                </form>
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
                    password: ''
                })
            }
        },
        methods: {
            updateInfo(){
                this.$Progress.start();
                if(this.form.password==""){
                    this.form.password = undefined;
                }
                this.form.put('/api/user/profile/')
                .then(()=>{
                    window.location.reload();
                })
                .catch(()=>{
                    this.$Progress.fail();
                });
            }
        },
        created() {
            this.$Progress.start();
            axios.get('/api/user/profile')
            .then(({ data }) => (this.form.fill(data)));
            this.$Progress.finish();
        }
    }
</script>