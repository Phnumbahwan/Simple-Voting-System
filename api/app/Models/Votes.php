<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Votes extends Model
{
    use HasFactory;
    protected $fillable = [
        'lastName',
        'firstName',
        'age',
        'occupation',
        'completeAddress',
    ];
}
