<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\User;

class AuthorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return User::where('role','author')
                    ->latest()
                    ->paginate(10);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'name' => 'required|string',
            'email' => 'required|email|unique:users',
            'password' => 'required'
        ]);
        if($request->photo){
            $extension = explode('/', mime_content_type($request->photo))[1];
            $name = time().'.'.$extension;
    
            \Image::make($request->photo)->save(public_path('img/user_photos/').$name);
            $request->merge(['photo' => $name]);
        }else{
            $request->merge(['photo' => 'user_default.png']);
        }
        return User::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'role' => 'author',
            'photo' => $request['photo'],
            'password' => Hash::make($request['password']) 
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request,[
            'name' => 'required|string',
            'email' => 'required|email|unique:users,email,'.$id,
        ]);
        $current_photo = $request->current_photo;
        if($request->photo != $current_photo){
            $extension = explode('/', mime_content_type($request->photo))[1];
            $name = time().'.'.$extension;

            \Image::make($request->photo)->save(public_path('img/user_photos/').$name);
            $request->merge(['photo' => $name]);

            $authorPhoto = public_path('img/user_photos/').$current_photo;
            if(!($current_photo == 'user_default.png')){
                if(file_exists($authorPhoto)){
                    @unlink($authorPhoto);
                }
            }
            
        }
        if($request->updated_password != ""){
            return User::where('id', $id)->update(['password' => Hash::make($request['password'])]);
        }
        return User::where('id', $id)->update([
            'name' => $request['name'],
            'email' => $request['email'],
            'photo' => $request['photo']
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $author = User::findOrFail($id);
        $authorPhoto = public_path('img/user_photos/').$author->photo;
        if(!($author->photo == 'user_default.png')){
            if(file_exists($authorPhoto)){
                @unlink($authorPhoto);
            }
        }
        return $author->delete();
    }

    public function search(){
        if ($search = \Request::get('q')) {
            $authors = User::where(function($query) use ($search){
                $query->where([['name','LIKE',"%$search%"],['role','author']])
                        ->orWhere([['email','LIKE',"%$search%"],['role','author']]);
            })->paginate(10);
        }else{
            $authors = User::where('role','author')
                            ->latest()
                            ->paginate(10);
        }

        return $authors;
    }
}
