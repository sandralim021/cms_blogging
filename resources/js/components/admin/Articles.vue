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
                            <button class="btn btn-success">Add Record <i
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
        
    </div>
</template>

<script>
    export default {
        data(){
            return{
               
            }
        },
        methods: {
            
        },
        created() {
           
        }
    }
</script>
