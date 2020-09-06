<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    protected $table = 'articles';
    protected $primaryKey = 'article_id';
    protected $fillable = ['title','user_id','content','photo','article_status'];
}
