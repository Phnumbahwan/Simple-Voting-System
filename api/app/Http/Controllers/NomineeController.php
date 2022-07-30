<?php

namespace App\Http\Controllers;

use App\Models\Nominee;
use Illuminate\Http\Request;

class NomineeController extends Controller
{
    public function index() {
        return Nominee::all();
    }

    public function store(Request $request) {

        if(($request->input('category') != 'President') and ($request->input('category') != 'Vice President') and ($request->input('category') != 'Treasurer')) {
            return "Invalid category!";
        }

        $request->validate([
            'name' => 'required',
            'description' => 'required',
            'category' => 'required|in:President,Vice President,Treasurer'
        ]);

        $nominee = new Nominee;
        $nominee->name = $request->input('name');
        $nominee->description = $request->input('description');
        $nominee->category = $request->input('category');
        if($request->hasFile('image')) {
            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = time().'.'.$extension;
            $file->move('../../ui/src/uploads/', $filename);
            $nominee->image = $filename;
        }
        $nominee->save();

        return $nominee;
    }
}
