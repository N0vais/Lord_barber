<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Doctor;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\ValidationException\ValidationException;
use Illuminate\Support\Facades\Hash;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * login
     */
    public function login(Request $reqeust)
        {
            //validate incoming inputs
            $reqeust->validate([
                'email'=>'required|email',
                'password'=>'required',
            ]);

            //check matching user
            $user = User::where('email', $reqeust->email)->first();

            //check password
            if(!$user || ! Hash::check($reqeust->password, $user->password)){
                throw ValidationException::withMessages([
                    'email'=>['login invalido!!!'],
                ]);
            }

            //then return generated token
            return $user->createToken($reqeust->email)->plainTextToken;
        }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
