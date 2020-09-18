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
                                <input type="text" name="search" v-model="search" @keyup.enter="searchResults()" class="form-control float-right" placeholder="Search">
                                <div class="input-group-append">
                                    <button type="submit" @click.prevent="searchResults()" class="btn btn-primary">Search</button>
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
                        <pagination v-if="normalmode == true" :data="users" @pagination-change-page="getResults">
                            <span slot="prev-nav">&lt; Previous</span>
	                        <span slot="next-nav">Next &gt;</span>
                        </pagination>
                        <pagination v-if="searchmode == true" :data="users" @pagination-change-page="searchResults">
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
                search: '',
                normalmode: true,
                searchmode: false
            }
        },
        methods: {
            getResults(page = 1){
                this.$Progress.start();
                axios.get('api/display_users?page=' + page)
				.then(response => {
                    this.users = response.data;
                    this.$Progress.finish();
                })
                .catch(()=>{
                    //Failed
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
                    axios.get('api/findUser/'+query+'?page=' + page)
                    .then((response) => {
                        this.users = response.data
                        this.normalmode = false;
                        this.searchmode = true;
                        this.$Progress.finish();
                    })
                    .catch(() => {
                        this.$Progress.fail();
                    })
                }
                
            },
        },
        created() {
            this.getResults();
        }
    }
</script>
