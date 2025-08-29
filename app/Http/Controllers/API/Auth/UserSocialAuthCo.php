<?php

namespace App\Http\Controllers\API\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Support\Facades\Validator;
use Laravel\Socialite\Two\AppleProvider;
use Laravel\Sanctum\PersonalAccessToken;
use App\Http\Requests\Auth\UserRequest;
use App\Http\Requests\Auth\LoginRequest;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Laravel\Sanctum\Sanctum;
use Google\Client as GoogleClient;
use Auth;
use Hash;

class UserSocialAuthCo extends Controller
{
    /**
     * Redirect to Google authentication.
     *
     * @return \Illuminate\Http\Response
     */

    public function manualLogin(LoginRequest $request){
        
        try{

            $credentials = $request->validated();
            $admin = User::select('id','email','password','account_type','name','first_name','last_name')->where('email', $credentials['email'])->first();

            if ($admin && Hash::check($request->password, $admin->password)){ 
                
                $user = $admin; 
                $user->tokens()->delete();
                $token = $user->createToken('API Token')->plainTextToken;
                $user['token'] = $token;

                $user = $user->toArray();
                array_walk_recursive($user, function (&$item) {
                    $item = $item ?? '';
                });
                
                return response()->json([
                    'success' => 'success',
                    'message' => 'SignIn successful.',
                    'user' => $user,
                ], 200);
            } else {
                
                return response()->json([
                    'success' => 'failed',
                    'message' => 'Invalid email or password',
                ], 401);
            }
        } catch (\Exception $e) {

            \Log::error('SignIn failed: ' . $e->getMessage());
    
            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    public function manualsignUp(UserRequest $request){

        try {
            $validator = Validator::make($request->all(), [
                'email' => 'required|email|unique:users,email',
                'password' => 'required|string|min:8',
            ]);
    
            if ($validator->fails()) {
                return response()->json([
                    'status' => 'error',
                    'message' => $validator->errors()->first(),
                    'errors' => $validator->errors(),
                ], 422);
            }

            if($request->business_page == 1){
                $user['account_type'] = 'GB';
            }
    
            $user = User::create([
                'email' => $request->email,
                'password' => Hash::make($request->password), 
            ]);

            $token = $user->createToken('manual-auth-token')->plainTextToken;
            $user['token'] = $token;
    
            return response()->json([
                'status' => 'success',
                'message' => 'Signup successful.',
                'user' => $user->makeHidden(['id','created_at','updated_at','deleted_at']),
            ], 201);
    
        } catch (\Exception $e) {

            \Log::error('Signup failed: ' . $e->getMessage());
    
            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    public function redirectToGoogle(){

        return Socialite::driver('google')->redirect();
    }

    /**
     * Handle Google authentication callback.
     *
     * @return \Illuminate\Http\Response
     */
    // for webTest
    public function handleGoogleCallback()
    {
        $googleUser = Socialite::driver('google')->user();

            $user = User::where('email', $googleUser->getEmail())->first();

            if (!$user) {
                $user = User::create([
                    'name' => $googleUser->getName(),
                    'email' => $googleUser->getEmail(),
                    'google_id' => $googleUser->getId(),
                    'password' => bcrypt(uniqid()), // random password
                ]);
            }
     
        Auth::login($user);
        session(['referrer' => $user]);

        return view('frontend.dashboard', compact('user'));
        // return redirect('/home');
    }
    // Task: need to update when flatter update
    public function googleDataStore(Request $request){     
        
        try {

            $validator = Validator::make($request->all(), [
                'name' => 'nullable|string',
                'email' => 'nullable|email',
                'photo' => 'nullable',
                'google_id' => 'nullable|string',
                'token' => 'nullable|string',
            ]);

            if ($validator->fails()) {
                $errors = collect($validator->errors()->toArray())->map(fn($messages) => $messages[0]);
                return response()->json([
                    'status' => 'error',
                    'message' => $validator->errors()->first(),
                    'errors' => $errors,
                ], 422);
            }

            $users = User::select('id','email','password','account_type','name','first_name','last_name')->where('google_id', trim($request->google_id))->first();
            
            if(!$users){

                $idToken = $request->input('id_token');

                if($idToken){

                    $client = new GoogleClient(['client_id' => env('GOOGLE_CLIENT_ID')]);

                    $payload = $client->verifyIdToken($idToken);

                    if ($payload) {
                        $input['google_id'] = $payload['sub'];
                        $input['email'] = $payload['email'];
                        $input['name'] = $payload['name'] ?? null;
                        $input['first_name'] = $payload['given_name'] ?? null;
                        $input['last_name'] = $payload['family_name'] ?? null;
                        $input['avatar'] = $payload['picture'] ?? null;

                        $users = User::select('id','email','password','account_type','name','first_name','last_name')->where('google_id', $payload['sub'])->first();

                        if(!$users){
                            $user = User::updateOrCreate($input);
                            // Generate a token for API access
                            $token = $user->createToken('google-auth-token')->plainTextToken;
                            $user['token'] = $token;
                            
                            return response()->json([
                                'status' => 'success',
                                'message' => 'Signup Successful.',
                                'user' => $user->makeHidden(['created_at','updated_at','deleted_at']),
                            ]);
                        }else{
                            $users->tokens()->delete();
                            $token = $users->createToken('google-auth-token')->plainTextToken;
                            $users['token'] = $token;

                            return response()->json([
                                'status' => 'success',
                                'message' => 'SignIn successful.',
                                'user' => $users->makeHidden(['created_at','updated_at','deleted_at']),
                            ]);
                        }

                    } else {
                        return response()->json(['error' => 'Invalid ID token'], 401);
                    }
                }else{
                    $input = $request->all();
                    $input['avatar'] = $request->photo;
                    if($request->business_page == 1){
                        $user['account_type'] = 'GB';
                    }
                    $user = User::create($input);

                    // Generate a token for API access
                    $token = $user->createToken('google-auth-token')->plainTextToken;
                    $user['token'] = $token;
                    
                    return response()->json([
                        'status' => 'success',
                        'message' => 'Signup Successful.',
                        'user' => $user->makeHidden(['created_at','updated_at','deleted_at']),
                    ]);
                }

            }else{

                $users->tokens()->delete();
                $token = $users->createToken('google-auth-token')->plainTextToken;
                $users['token'] = $token;

                return response()->json([
                    'status' => 'success',
                    'message' => 'SignIn successful.',
                    'user' => $users->makeHidden(['created_at','updated_at','deleted_at']),
                ]);
            }
            
        } catch (\Exception $e) {
            
            return response()->json([
                'success' => false,
                'message' => 'Failed to authenticate with Google.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Redirect to Apple authentication.
     *
     * @return \Illuminate\Http\Response
     */
    public function redirectToApple(){

        return Socialite::driver('apple')->redirect();
    }

    /**
     * Handle Apple authentication callback.
     *
     * @return \Illuminate\Http\Response
     */
    public function handleAppleCallback(){
        
        try {

            $appleUser = Socialite::driver('apple')->stateless()->user();
            $users = User::where('google_id', $googleUser->getId())->first();
            
            if(!$users){
                $user = User::firstOrCreate([
                    'apple_id' => $appleUser->getId(),
                ], [
                    'name' => $appleUser->getName(),
                    'first_name' => $googleUser->user['given_name'],
                    'last_name' => $googleUser->user['family_name'],
                    'email' => $appleUser->getEmail(),
                ]);

                $token = $user->createToken('google-auth-token')->plainTextToken;
                
                return response()->json([
                    'status' => 'success',
                    'user' => $user,
                    'token' => $token,
                ]);

            }else{

                return response()->json([
                    'status' => 'success',
                    'user' => $users,
                ]);
            }
        } catch (\Exception $e) {
            
            return response()->json([
                'success' => false,
                'message' => 'Failed to authenticate with Apple.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    // send-OTP
    public function sendOtp(Request $request){
        
        try{
            if($request->user_id){
                
                $user = User::select('id','email','password','account_type','name','first_name','last_name')->where('id', $request->user_id)->first();
                
            }else{
         
                $user = User::select('id','email','password','account_type','name','first_name','last_name')->where('email', $request['email'])->first();
            
            }

            if ($user){ 
            
                $otp = str_pad(rand(0, 99999), 5, '0', STR_PAD_LEFT);

                $user = User::find($user->id);
                $user->otp = $otp;
                $user->otp_expires_at = now()->addMinutes(2); // OTP expires in 2 minutes
                $user->otp_status = 0;
                $user->save();
                
                // Send OTP to the user's email
                Mail::send('emails.otp', ['otp' => $otp], function ($message) use ($user) {
                    $message->to($user->email)
                            ->subject('Your OTP for password reset');
                });

                $data['otp'] =$otp;
                $data['email'] = $user->email;
                $data['otp_expires_at'] = $user->otp_expires_at;
                $data['otp_status'] = $user->otp_status;
                
                return response()->json([
                    'success' => 'success',
                    'message' => 'OTP sent successful ',
                    'data' => $data,
                ], 200);
            } else {
                
                return response()->json([
                    'success' => 'failed',
                    'message' => 'Invalid email',
                ], 401);
            }

        } catch (\Exception $e) {

            \Log::error('OTP send failed: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => 'OTP send failed.',
                'errors' => $e->getMessage(),
            ], 500);
        }
    }
    // verify-otp
    public function verifyOtp(Request $request){
        
        try {

            $validator = Validator::make($request->all(), [
                'email' => 'required|email',
                'otp' => 'required|digits:5',
            ]);
    
            if ($validator->fails()) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Validation failed.',
                    'errors' => $validator->errors(),
                ], 422);
            }
    
        $user = User::where('email', $request->email)->first();
    
        if ($user && $user->otp === $request->otp && now()->lessThanOrEqualTo($user->otp_expires_at)) {

            $user->otp = null; 
            $user->otp_expires_at = null; 
            $user->otp_status = 1; 
            $user->save();
    
            return response()->json(['message' => 'OTP matched successful.'], 200);
        }else{

            return response()->json(['message' => 'Invalid or expired OTP.'], 400);
        }
    
        } catch (\Exception $e) {

            \Log::error('OTP verify failed: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => 'OTP verify failed.',
                'errors' => $e->getMessage(),
            ], 500);
        }
    }
    // reset-password
    public function resetPassword(Request $request){

        try{
          
            $validator = Validator::make($request->all(), [
                'email' => 'required|email|exists:users,email',
                'password' => 'required|string|min:8',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => 'error',
                    'message' => $validator->errors()->first(),
                    'errors' => $validator->errors(),
                ], 422);
            }

            $user = User::where('email', $request->email)->first();
                
            if($request->old_password){

                $validator = Validator::make($request->all(), [
                    'old_password' => 'required|string|min:8',
                ]);

                if ($validator->fails()) {
                    return response()->json([
                        'status' => 'error',
                        'message' => $validator->errors()->first(),
                        'errors' => $validator->errors(),
                    ], 422);
                }

                if(Hash::check($request->old_password, $user->password)){

                    $user->password = Hash::make($request->password);
                    $user->save();

                    return response()->json(['status' => 'success','message' => 'Password has been successfully reset.'], 200);

                }else{

                    return response()->json(['status' => 'failed','message' => 'Old password not match.'], 400);
                }
                    
            }else{

                $user->password = Hash::make($request->password);
                $user->save();

                return response()->json(['message' => 'Password has been successfully reset.'], 200);
            }

        } catch (\Exception $e) {

            \Log::error('Password reset failed: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => 'Password reset failed.',
                'errors' => $e->getMessage(),
            ], 500);
        }
    }
    // logout
    public function logout(Request $request){

        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'status' => 'success',
            'message' => 'Logged out successful.',
        ], 200);
    }

}
