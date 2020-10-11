## Blog Website with Vue and Laravel
A Blog website where the admin and authors can create, edit and publish articles to make available on public (users). A user can view the articles made by admin and authors and user can sort the viewing of articles by searching or choosing the topic on the list.

## Programming Technologies
This project is built using Boostrap, Vue.js and Laravel Framework.

## Installation
* Clone the repo ` https://github.com/sandralim021/laravue_blog.git `
* ` cd ` to project folder
* Run ` composer install `
* Duplicate `.env.example` file and rename it to `.env` and set your database information 
* Run ` php artisan key:generate ` to generate the app key
* Run ` npm install `
* Run ` php artisan migrate ` 
* Run ` php artisan db:seed ` to add admin information to database
* Run ` php artisan passport:install ` to generate passport keys
* Done!!!

## Admin Credentials
Email: admin@gmail.com__
Password: admin123

## Screenshots
### Admin and Author Login
![Admin and Author Login](screenshots/Admin%20and%20Author%20Login.PNG)
### Admin - Users
![Admin - Users](screenshots/admin/01.%20users.PNG)
### Admin - Authors
![Admin - Authors](screenshots/admin/02.%20authors.PNG)
### Admin - Topics
![Admin - Topics](screenshots/admin/03.%20topics.PNG)
### Admin - Articles
![Admin - Articles](screenshots/admin/04.%20articles.PNG)
### Admin - Profile
![Admin - Profile](screenshots/admin/05.%20Profile.PNG)

### Author
![Authors](screenshots/author/01.%20Author.PNG)

### User - Login
![User - Login](screenshots/user/01.%20User%20Login.PNG)
### User - Home
![User - Home](screenshots/user/02.%20Home%20Articles.PNG)
### User - View Article
![User - View Article](screenshots/user/04.%20View%20Article.PNG)
### User - Profile
![User - Profile](screenshots/user/03.%20Manage%20Profile.PNG)
