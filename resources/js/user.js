require('./user-bootstrap');

window.Vue = require('vue');
import VueRouter from 'vue-router'

Vue.use(VueRouter)

let routes = [
    { path: '/', component: require('./components/user/Home.vue').default},
    { path: '/view_article/:article_id', name:'view_article', component: require('./components/user/ViewArticle.vue').default},
    { path: '/search', name:'search', component: require('./components/user/SearchResults.vue').default },
]

Vue.component('search-ui', require('./components/user/SearchUI.vue').default);
Vue.component('profile', require('./components/user/Profile.vue').default);


const router = new VueRouter({
    mode: 'history',
    routes, // short for `routes: routes`
    base: '/home'
})

import VueProgressBar from 'vue-progressbar'
Vue.use(VueProgressBar, {
    color: 'rgb(143, 255, 199)',
    failedColor: 'red',
    height: '2px',
    thickness: '5px'
})

import swal from 'sweetalert2'
window.swal = swal;

const toast = swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    onOpen: (toast) => {
      toast.addEventListener('mouseenter', swal.stopTimer)
      toast.addEventListener('mouseleave', swal.resumeTimer)
    }
});

window.toast = toast;

import moment from 'moment';
Vue.filter('articleDate',function(created){
    return moment(created).format('MMMM Do YYYY');
});

import { Form, HasError, AlertError } from 'vform';
window.Form = Form;
Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)


Vue.component('pagination', require('laravel-vue-pagination'));

window.Fire = new Vue();

const app = new Vue({
    el: '#user',
    router,
    data:{
        search_article: false,
        search_topic: false
    }
});
