<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Admin\TAdminUser;
use App\Models\UserNidImage;
use App\Models\Admin\TAdminCountry;
use Spatie\Permission\Models\Role;
use App\Http\Requests\TAdminUserRequest;
use DB;
use Hash;
use Illuminate\Support\Arr;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Auth;

class UserCo extends Controller
{

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = TAdminUser::latest()->get();
  
        return view('admin.userManagement.users.index',compact('data'));
    }
    
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(): View
    {
        $roles = Role::pluck('name','name')->all();
        $country = TAdminCountry::get();

        return view('admin.userManagement.users.create',compact('roles','country'));
    }
    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request): RedirectResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'email' => 'required|email',
            'phone_number' => 'required|string',
            'password' => 'required|string',
            'refer_code' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }
        
        $input = $request->except('nid_image'); 
        // dd($request);
        $input['password'] = Hash::make($input['password']);
        $input['own_refer_code'] = rand(4,9999);
        $input['level'] = "Level 1";

        $user = User::create($input);

        if ($request->hasFile('nid_image')) {

            foreach ($request->file('nid_image') as $index => $image) {

                $imageName = time() . $index . '_' . $image->getClientOriginalName();
                $image->move(public_path('images/users'), $imageName);
                $imagePaths = 'images/users/' . $imageName;

                $data = new UserNidImage();
                $data->user_id = $user->id;
                $data->nid_image = $imagePaths;
                $data->save();
            }
        }
    
        return redirect()->route('login')->with('success','Registration successfully');
    }

    public function manualLogin(Request $request){
  
            $credentials = Validator::make($request->all(), [
                'email' => 'required|email',
                'password' => 'required|string',
            ]);

            if ($credentials->fails()) {
                return response()->json([
                    'status' => 'error',
                    'message' => $credentials->errors()->first(),
                    'errors' => $credentials->errors(),
                ], 422);
            }

            // $credentials = $request->validated();
            $admin = User::where('email', $request->email)->first();

            if ($admin && Hash::check($request->password, $admin->password)){ 
                $user = $admin; 
                $user->tokens()->delete();
                $token = $user->createToken('API Token')->plainTextToken;
                $user['token'] = $token;

                // $user = $user->toArray();
                // array_walk_recursive($user, function (&$item) {
                //     $item = $item ?? '';
                // });
                // dd($user);
                Auth::login($user);
                session(['referrer' => $user]);

                return view('frontend.dashboard', compact('user'));
                // return redirect()->route('user-dashboard')->with('success','Login successfully');
            } else {
                return redirect()->route('login')->with('error','Invalid email or password');
            }

    }

    public function userDashboard(){
        
        $user = session('referrer');
        if($user){
            return view('frontend.dashboard', compact('user'));
        }else{
            return redirect()->route('login')->with('error','Please Login');
        }
    }

    public function logoutUser(Request $request)
    {
        // Destroy all session data
        $request->session()->flush();

        // Log out the user
        Auth::logout();

        // Regenerate session ID to prevent fixation
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        // Redirect to homepage or login
        return redirect('/');
    }

    public function depositForm(){
        
        $user = session('referrer');
        if($user){
            return view('frontend.depositForm', compact('user'));
        }else{
            return redirect()->route('login')->with('error','Please Login');
        }
    }

    public function depositFormStore(Request $request){

        $data = $request;
        return view('frontend.depositConfirm', compact('data'));
    }

    public function depositConfirm(Request $request){
      
        dd($request->all());
    }
    
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id): View
    {
        $user = TAdminUser::find($id);

        return view('admin.userManagement.users.show',compact('user'));
    }
    
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id): View
    {
        $adminUser = TAdminUser::find($id);
        $country = TAdminCountry::get();
        $roles = Role::pluck('name','name')->all();
        $userRole = $adminUser->roles->pluck('name','name')->all();
    
        return view('admin.userManagement.users.edit',compact('adminUser','roles','userRole','country'));
    }
    
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(TAdminUserRequest $request, $id): RedirectResponse
    {
        $validated = $request->validated();
    
        $input = $request->all();
        if(!empty($input['password'])){ 
            $input['password'] = Hash::make($input['password']);
        }else{
            $input = Arr::except($input,array('password'));    
        }
    
        $tAdminUser = TAdminUser::find($id);
        $tAdminUser->update($input);
        DB::table('model_has_roles')->where('model_id',$id)->delete();
    
        $tAdminUser->assignRole($request->input('roles'));
    
        return redirect()->route('users.index')->with('info','User updated successfully');
    }
    
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id): RedirectResponse
    {
        TAdminUser::find($id)->delete();
        return redirect()->route('users.index')->with('warning','User deleted successfully');
    }
}
