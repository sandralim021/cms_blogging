<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Master;
class ProfileController extends Controller
{
    public function profile(){
      return \Auth::guard('master-api')->user();
    }
    public function updateProfile(Request $request){

        $id = $request->id;

        $this->validate($request,[
            'name' => 'required|string',
            'email' => 'required|string|email|unique:users,email,'.$id,
            'password' => 'sometimes|required|min:6'
        ]);

        $current_photo = $request->current_photo;
        if($request->photo != $current_photo){
            $extension = explode('/', mime_content_type($request->photo))[1];
            $name = time().'.'.$extension;

            \Image::make($request->photo)->save(public_path('img/user_photos/').$name);
            $request->merge(['photo' => $name]);

            $userPhoto = public_path('img/user_photos/').$current_photo;
            if(!($current_photo == 'user_default.png')){
                if(file_exists($userPhoto)){
                    @unlink($userPhoto);
                }
            }
        }
        if(!empty($request->password)){
            return Master::where('id', $id)->update(['password' => Hash::make($request['password'])]);
        }
        return Master::where('id', $id)->update([
            'name' => $request['name'],
            'email' => $request['email'],
            'photo' => $request['photo']
        ]);
    }
}
