<?php

namespace App\Http\Controllers;

use App\Models\NomineeVote;
use Illuminate\Http\Request;

class NomineeVoteController extends Controller
{
    public function index() {
        return NomineeVote::all();
    }

    public function store(Request $request) {
        $request->validate([
            'voter_id' => 'required',
            'president_id' => 'required',
            'vice_president_id' => 'required',
            'treasurer_id' => 'required',
        ]);

        return NomineeVote::create($request->all());
    }
}
