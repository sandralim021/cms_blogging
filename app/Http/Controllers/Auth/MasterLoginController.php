<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;

class MasterLoginController extends Controller
{
    public function __construct(){
        $this->middleware('guest:master')->except('logout');
    }
    public function showLoginForm(){
        return view('auth.master_login');
    }
    public function login(Request $request){
        //Validating Data
        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required|min:6'
        ]);
        //Attempt to log the user in
        if(Auth::guard('master')->attempt(['email' => $request->email,'password' => $request->password], $request->remember)){
            //If successful, then redirect to their intended location
            return redirect()->intended(route('master.dashboard'));
        }
        //If unsuccessful, then redirect back to login function with form data
        return redirect()->back()->withInput($request->only('email','remember'));
    }
    public function logout(){
        Auth::guard('master')->logout();
        return redirect(route('master.login'));
    }
}
