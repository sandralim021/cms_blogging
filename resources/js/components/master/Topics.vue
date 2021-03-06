<template>
    <div class="container">
        <div class="row mt-3">
            <div class="col-sm-6">
                <h1>Topics</h1>
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                         <div class="float-left">
                            <button class="btn btn-success"  @click="newModal">Add Record <i
                                            class="fas fa-plus"></i></button>
                        </div>
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
                                    <th>Topic</th>
                                    <th>Status</th>
                                    <th>Modify</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(topic,index) in topics.data" :key="topic.topic_id">
                                    <td>{{(index + 1) + (topics.from - 1)}}</td>
                                    <td>{{topic.topic_name}}</td>
                                    <td v-if="topic.topic_status == 'not_active'">
                                        <span class="badge bg-danger">Not Active</span>
                                    </td>
                                    <td v-else>
                                        <span class="badge bg-success">Active</span>
                                    </td>
                                    <td>
                                        <a href="" @click.prevent="editModal(topic)" class="btn btn-sm btn-warning">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <a href="" @click.prevent="deleteTopic(topic.topic_id)" class="btn btn-sm btn-danger">
                                            <i class="fa fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer d-flex justify-content-center">
                        <pagination v-if="normalmode == true" :data="topics" @pagination-change-page="getResults">
                            <span slot="prev-nav">&lt; Previous</span>
	                        <span slot="next-nav">Next &gt;</span>
                        </pagination>
                        <pagination v-if="searchmode == true" :data="topics" @pagination-change-page="searchResults">
                            <span slot="prev-nav">&lt; Previous</span>
	                        <span slot="next-nav">Next &gt;</span>
                        </pagination>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="topic_modal" tabindex="-1" aria-labelledby="topic_modalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="topic_modalLabel">{{ editmode ? 'Update Topic Information' : 'Add New Topic'}}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form class="form-horizontal" @submit.prevent="editmode ? updateTopic() : createTopic()">
                        <div class="modal-body">
                            <div class="form-group row">
                                <label for="topic_name" class="col-sm-3 col-form-label">Topic Name</label>
                                <div class="col-sm-8">
                                    <input v-model="form.topic_name" type="text" name="topic_name" placeholder="Enter Topic Name" class="form-control"
                                        :class="{ 'is-invalid': form.errors.has('topic_name') }">
                                    <has-error :form="form" field="topic_name"></has-error>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="topic_status" class="col-sm-3 col-form-label">Status</label>
                                <div class="col-sm-8">
                                    <select v-model="form.topic_status" class="form-control" name="topic_status" :class="{ 'is-invalid': form.errors.has('topic_status') }">
                                        <option value="">Select Status</option>
                                        <option value="not_active">Not Active</option>
                                        <option value="active">Active</option>
                                    </select>
                                     <has-error :form="form" field="topic_status"></has-error>
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
                topics: {},
                search: '',
                normalmode: true,
                searchmode: false,
                form: new Form({
                    topic_id: '',
                    topic_name: '',
                    topic_status: ''
                })
            }
        },
        methods: {
            newModal(){
                this.editmode = false;
                this.form.clear();
                this.form.reset();
                $('#topic_modal').modal('show');      
            },
            createTopic(){
                this.$Progress.start();
                this.form.post('/api/topic')
                .then(()=>{
                    $('#topic_modal').modal('hide');
                    toast.fire({
                        icon: 'success',
                        title: 'Topic Created Successfully'
                    });
                    this.getResults();
                    this.$Progress.finish();
                })
                .catch(()=>{
                    this.$Progress.fail();
                })
            },
            editModal(topic){
                this.editmode = true;
                this.form.clear();
                this.form.reset();
                $('#topic_modal').modal('show');
                this.form.fill(topic);
            },
            updateTopic(){
                this.$Progress.start();
                this.form.put('/api/topic/'+this.form.topic_id)
                .then(()=>{
                    $('#topic_modal').modal('hide');
                    toast.fire({
                        icon: 'success',
                        title: 'Topic Updated Successfully'
                    });
                    this.getResults();
                    this.$Progress.finish();
                })
                .catch(()=>{
                    //Failed
                    this.$Progress.fail();
                })
            },
            deleteTopic(id){
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
                        this.form.delete('/api/topic/'+id).then(() =>{
                            swal.fire(
                                'Deleted!',
                                'Record has been deleted.',
                                'success'
                            )
                            this.getResults();
                        }).catch(()=>{
                            swal.fire(
                                'Failed!',
                                'Error while deleting the topic information',
                                'warning'
                            )
                        })
                    }
                    
                })
            },
            getResults(page = 1){
                this.$Progress.start();
                axios.get('/api/topic?page=' + page)
				.then(response => {
                    this.topics = response.data;
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
                    axios.get('/api/findTopic/'+query+'?page=' + page)
                    .then((response) => {
                        this.topics = response.data
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
