<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Admin\TAdminUser;
use App\Models\UserNidImage;
use App\Models\Admin\TAdminCountry;
use App\Models\TDeposit;
use App\Models\TInvest;
use App\Models\TodoList;
use App\Models\BuyPackage;
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
use Flasher\Laravel\Facade\Flasher;

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
    public function register(Request $request)
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

        $checkEmail = User::where('email', $request->email)->first();
        if($checkEmail){
            Flasher::addError('Email already exists');
            return redirect()->route('frontend.register');
        }
        
        $input = $request->except('nid_image'); 
        // dd($request);
        $input['password'] = Hash::make($input['password']);
        $input['own_refer_code'] = rand(4,9999);
        $input['level'] = "Level 1";

        $userStore = User::create($input);

        if ($request->hasFile('nid_image')) {

            foreach ($request->file('nid_image') as $index => $image) {

                $imageName = time() . $index . '_' . $image->getClientOriginalName();
                $image->move(public_path('images/users'), $imageName);
                $imagePaths = 'images/users/' . $imageName;

                $data = new UserNidImage();
                $data->user_id = $userStore->id;
                $data->nid_image = $imagePaths;
                $data->save();
            }
        }

        $user = User::with(['buyPackages','deposits','invests'])->where('id', $userStore->id)->first();

        Auth::login($user);
        session(['referrer' => $user]);
    
        return view('frontend.dashboard', compact('user'));
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
            $admin = User::with(['buyPackages','deposits','invests'])->where('email', $request->email)->first();

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
                return redirect()->route('frontend.login')->with('error','Invalid email or password');
            }

    }

    public function userDashboard(){
         
        $data = session('referrer');
        
        if($data){
            $user = User::with(['buyPackages','deposits','invests'])->where('id', $data->id)->first();
            return view('frontend.dashboard', compact('user'));
        }else{
            return redirect()->route('frontend.login')->with('error','Please Login');
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
            return redirect()->route('frontend.login')->with('error','Please Login');
        }
    }

    public function depositFormStore(Request $request){

        $data = $request;
        return view('frontend.depositConfirm', compact('data'));
    }

    public function depositConfirm(Request $request){

        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'binance_id' => 'required',
            'amount' => 'required|string',
            'order_id' => 'nullable',
            'deposit_proof' => 'required|image',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }
        
        $input = $request->except('deposit_proof'); 
        // Handle file upload
        if ($request->hasFile('deposit_proof')) {
            $image      = $request->file('deposit_proof');
            $imageName  = time() . '_' . uniqid() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('images/depositProof'), $imageName);

            $input['deposit_proof'] = 'images/depositProof/' . $imageName;
        }

        $input['payment_status'] = 0;

        // Save to DB
        $deposit = TDeposit::create($input);

        // $user = User::find($request->user_id);
        // $totalAmount = $user->total_deposit_amount+$request->amount;
        // $user->total_deposit_amount = $totalAmount;
        // $user->save();
        // Flash a success message
        // session()->flash('success', 'Deposit on processing wait for confirmation message.');
        return redirect()->route('frontend-dashboard');  //->with('success','Deposit on processing wait for confirmation message.');
    }

    public function buyFundedPackage(Request $request){

        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'package_id' => 'required',
            'amount' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }

        $input = $request->all(); 
        $input['payment_status'] = 1;
        $deposit = BuyPackage::create($input);
        $amountConvert = $request->amount;

        $user = User::find($request->user_id);
        $user->total_deposit_amount = $user->total_deposit_amount - $amountConvert;
        $user->save();

        return redirect()->back();
    }

    public function investForm(Request $request){

        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'package_id' => 'required',
            'amount' => 'required',
            'order_id' => 'nullable',
            'invest_proof' => 'required|image',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }

        $user = User::find($request->user_id);

        if($request->amount<100 || $user->total_deposit_amount<$request->amount ){
            return redirect()->route('deposit'); 
        }
        
        $input = $request->except('invest_proof'); 
        // Handle file upload
        if ($request->hasFile('invest_proof')) {
            $image      = $request->file('invest_proof');
            $imageName  = time() . '_' . uniqid() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('images/investProof'), $imageName);

            $input['invest_proof'] = 'images/investProof/' . $imageName;
        }

        $input['payment_status'] = 0;

        // Save to DB
        $deposit = TInvest::create($input);

        // Flash a success message
        // session()->flash('success', 'Deposit on processing wait for confirmation message.');
        return redirect()->route('frontend-dashboard');  //->with('success','Deposit on processing wait for confirmation message.');
    }

    public function depositList(){
        $datas = TDeposit::orderBy('id', 'DESC')->get();
        return view('admin.deposit.index', compact('datas'));
    }

    public function depositConfirmStatus($id){
        $data = TDeposit::find($id);
        $data->payment_status = 1;
        $data->save();

        $user = User::find($data->user_id);
        $user->total_deposit_amount =  $user->total_deposit_amount + $data->amount;
        $user->save();

        return redirect()->route('deposit-list')->with('success', 'Deposit Accepted Success');
    }

    public function investList(){
        $datas = TInvest::orderBy('id', 'DESC')->get();
        return view('admin.invest.index', compact('datas'));
    }

    public function investConfirmStatus($id){
        $data = TInvest::find($id);
        $data->payment_status = 1;
        $data->save();

        $user = User::find($data->user_id);
        $user->total_invest_amount =  $user->total_invest_amount + $data->amount;
        $user->save();

        return redirect()->route('invest-list')->with('success', 'Invest Accepted Success');
    }

    public function buyPackageList(){
        $datas = BuyPackage::orderBy('id', 'DESC')->get();
        return view('admin.buyPackage.index', compact('datas'));
    }

    public function buyPackagesTodoList(Request $request)
    {
        $request->validate([
            'buy_id' => 'required|integer',
            'user_id' => 'required|integer',
            'rules' => 'nullable|array', 
        ]);

        $userId = $request->user_id;
        $buyId = $request->buy_id;
        $rules = $request->rules ?? []; 

        // All possible rule keys
        $allRuleKeys = [
            'min_profit',
            'max_loss',
            'trade_limit',
            'risk_management',
            'rule_break',
            'profit_share',
        ];

        // 1. Delete rules that are not selected
        TodoList::where('buy_id', $buyId)
            ->whereIn('rule_key', $allRuleKeys)
            ->whereNotIn('rule_key', array_keys($rules))
            ->delete();

        // 2. Add or update selected rules
        foreach ($rules as $key => $value) {
            TodoList::updateOrCreate(
                ['user_id' => $userId, 'buy_id' => $buyId, 'rule_key' => $key],
                ['rule_value' => $value]
            );
        }

        return back()->with('success', 'Rules updated successfully.');
    }

    public function fetchRules($buy_id)
    {
        $rules = TodoList::where('buy_id', $buy_id)->pluck('rule_key')->toArray();

        return response()->json($rules); // just return rule_keys like ['min_profit', 'max_loss']
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
