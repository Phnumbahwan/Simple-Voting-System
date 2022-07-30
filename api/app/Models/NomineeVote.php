<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NomineeVote extends Model
{
    use HasFactory;
    protected $fillable = [
        'voter_id',
        'president_id',
        'vice_president_id',
        'treasurer_id'
    ];
}
