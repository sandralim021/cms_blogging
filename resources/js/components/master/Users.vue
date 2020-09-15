<template>
    <div class="container">
        <div class="row mt-3">
            <div class="col-sm-6">
                <h1>Users</h1>
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="float-right">
                            <div class="input-group input-group-sm">
                                <input type="text" name="search" v-model="search" @keyup="searchit" class="form-control float-right" placeholder="Search">
                                <div class="input-group-append">
                                    <button type="submit" @click="searchit" class="btn btn-default"><i class="fas fa-search"></i></button>
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
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(user,index) in users.data" :key="user.id">
                                    <td>{{index + 1}}</td>
                                    <td>{{user.name}}</td>
                                    <td><img :src="'/img/user_photos/'+user.photo" width="50" height="50" class="img-fluid"></td>
                                    <td>{{user.email}}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer d-flex justify-content-center">
                        <pagination :data="users" @pagination-change-page="getResults">
                            <span slot="prev-nav">&lt; Previous</span>
	                        <span slot="next-nav">Next &gt;</span>
                        </pagination>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
    </div>
</template>

<script>
    export default {
        data(){
            return{
                editmode: false,
                users: {},
                search: ''
            }
        },
        methods: {
            loadUsers(){
                this.$Progress.start();
                axios.get('api/display_users').then(({ data }) => (this.users = data))
                .then(()=>{
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
                
            },
            getResults(page = 1){
                axios.get('api/display_users?page=' + page)
				.then(response => {
					this.users = response.data;
				});
            },
            searchit:_.debounce(() => {
                Fire.$emit('searching');
            },1000)
        },
        created() {
            Fire.$on('searching',() => {
                let query = this.search;
                axios.get('api/findUser?q=' + query)
                .then((data) => {
                    this.users = data.data
                })
                .catch(() => {

                })
            })
            this.loadUsers();
        }
    }
</script>
