<?php

namespace App\Http\Controllers;

use App\Models\Votes;
use Illuminate\Http\Request;

class VoteController extends Controller
{
    public function index() {
        return Votes::all();
    }

    public function store(Request $request) {
        $request->validate([
            'lastName' => 'required',
            'firstName' => 'required',
            'age' => 'required',
            'occupation' => 'required',
            'completeAddress' => 'required',
        ]);

        return Votes::create($request->all());
    }
}
