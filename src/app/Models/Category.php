<?php
namespace App\Models;

use Jenssegers\Mongodb\Eloquent\Model;

class Category extends Model
{
    protected $connection = 'mongodb';

    protected $fillable = [
        'id',
        'title'
    ];
}