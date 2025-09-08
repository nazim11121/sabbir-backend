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
use App\Models\Category;
use App\Models\Package;
use App\Models\Withdraw;
use App\Models\Slider;
use App\Models\Notice;
use App\Models\Commission;
use App\Models\Review;
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
use Illuminate\Support\Facades\Mail;
use App\Mail\ForgotPasswordMail;
use App\Mail\PurchasePackageMail;
use App\Mail\SuccessPackageMail;
use App\Mail\FailedPackageMail;
use Illuminate\Support\Facades\Password;

class UserCo extends Controller
{

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $packages = Package::where('status', 1)->get();
        $services = Package::where('category_id', 1)->where('status', 1)->get();
        $funded   = Package::where('category_id', 2)->where('status', 1)->get();
        $slider   = Slider::orderBy('hierarchy', 'ASC')->where('status', 1)->get();
        $notice   = Notice::where('status', 1)->orderBy('id', 'DESC')->first();
        $reviews  = Review::with('user')->where('status', 1)->get();

        return view('frontend.welcome',compact(['packages','services','funded','slider','notice','reviews']));
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
                return redirect()->route('frontend.login'); //->with('error','Invalid email or password');
            }

    }

    public function userDashboard(){
         
        $data = session('referrer');
        
        if($data){
            $user = User::with(['buyPackages','deposits','invests'])->find($data->id);
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

        $user = User::find($request->user_id);
        $input = $request->all(); 

        $amountConvert = (float)($request->amount);
        $exists = BuyPackage::where('user_id', $request->user_id)
            ->where('package_id', $request->package_id)
            ->where('payment_status', 0) // pending status
            ->exists();

        if ($exists) {
            return redirect()->route('frontend-dashboard');//back()->with('error', 'You already purchased this package, please wait for approval.');
        }
        if($amountConvert > $user->total_deposit_amount){
            return redirect()->route('deposit'); 
        }
        $input['payment_status'] = 0; 
        $deposit = BuyPackage::create($input);
        
        $user = User::find($request->user_id);
        $user->total_deposit_amount =(float)($user->total_deposit_amount) - $amountConvert;
        $user->save();

        // Send mail via queue
        Mail::to($user->email)->queue(new PurchasePackageMail($user));

        return redirect()->back();
    }

    public function investForm(Request $request){

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

        $user = User::find($request->user_id);
        $amountConvert = (float)($request->amount);

        if($request->amount<100 || (float)($user->total_deposit_amount) < $amountConvert ){
            return redirect()->route('deposit'); 
        }
        
        $input = $request->all(); 
        
        if($amountConvert > (float)($user->total_deposit_amount)){
            return redirect()->route('deposit'); 
        }
        $input['payment_status'] = 1;
        $input['investment_type'] = "flexible";
        $deposit = TInvest::create($input);

        $user->total_deposit_amount = (float)($user->total_deposit_amount) - $amountConvert;
        $user->total_invest_amount = (float)($user->total_invest_amount) + $amountConvert;
        $user->save();

        // Flash a success message
        // session()->flash('success', 'Deposit on processing wait for confirmation message.');
        return redirect()->route('frontend-dashboard');  //->with('success','Deposit on processing wait for confirmation message.');
    }

    public function lockedInvestForm(Request $request){

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

        $user = User::find($request->user_id);
        $amountConvert = (float)($request->amount);

        if($request->amount<100 || (float)($user->total_deposit_amount) < $amountConvert ){
            return redirect()->route('deposit'); 
        }
        
        if($amountConvert > (float)($user->total_deposit_amount)){
            return redirect()->route('deposit'); 
        }

        $input = $request->all(); 
        $input['payment_status'] = 1;
        $input['investment_type'] = "locked";
        // Save to DB
        $deposit = TInvest::create($input);

        $user->total_deposit_amount = (float)($user->total_deposit_amount) - $amountConvert;
        $user->total_invest_amount = (float)($user->total_invest_amount) + $amountConvert;
        $user->save();

        // Flash a success message
        // session()->flash('success', 'Deposit on processing wait for confirmation message.');
        return redirect()->route('frontend-dashboard');  //->with('success','Deposit on processing wait for confirmation message.');
    }

    public function depositList(){
        $datas = TDeposit::orderBy('id', 'DESC')->get();
        return view('admin.deposit.index', compact('datas'));
    }

    public function depositConfirmStatus($id,$id2){
        $data = TDeposit::find($id);
        if($id2==2){
            $data->payment_status = 2;
            $data->save();
        }elseif($id2==1) {
            $data->payment_status = 1;
            $data->save();
            $user = User::find($data->user_id);
            $user->total_deposit_amount =  (float)($user->total_deposit_amount) + (float)($data->amount);
            $user->save();
        }

        return redirect()->route('deposit-list')->with('success', 'Deposit Status update Success');
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
        $user->total_invest_amount =  (float)($user->total_invest_amount) + (float)($data->amount);
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

    public function buypackageConfirmStatus($id,$id2){
        $data = BuyPackage::find($id);
        $user = User::find($data->user_id);
        if($id2==2){
            $data->payment_status = 2;
            // Send mail via queue
            Mail::to($user->email)->queue(new FailedPackageMail($user));
        }elseif($id2==1) {
            $data->payment_status = 1;
            // Send mail via queue
            Mail::to($user->email)->queue(new SuccessPackageMail($user));
        }
        $data->save();

        return redirect()->route('buy-packages-list')->with('success', 'Status Update Success');
    }

    public function fetchRules($buy_id)
    {
        $rules = TodoList::where('buy_id', $buy_id)->pluck('rule_key')->toArray();

        return response()->json($rules); // just return rule_keys like ['min_profit', 'max_loss']
    }

    public function withdrawForm(){

        $user = session('referrer');
        if($user){
            return view('frontend.withdrawForm', compact('user'));
        }else{
            return redirect()->route('frontend.login')->with('error','Please Login');
        }
    }

    public function withdrawFormStore(Request $request)
    { 
        $request->validate([
            'user_id' => 'required',
            'amount' => 'required|numeric|min:10',
            'binance_id' => 'required|string|max:255',
        ]);

        $user = User::find($request->user_id);
        $amountConvert = (float)($request->amount);

        if($amountConvert > (float)($user->total_deposit_amount)){
            return response()->json(['success' => false, 'message' => 'Insufficient balance.']);
        }

        $withdrawAmountPending = Withdraw::where('user_id', $request->user_id)->where('payment_status', 0)->sum('amount');;
        $draftTotal = ($user->total_deposit_amount - $withdrawAmountPending);
        if($draftTotal < $amountConvert){
            return response()->json(['success' => false]);
        }


        if($amountConvert > (float)($user->total_deposit_amount)){
            return response()->json(['success' => false, 'message' => 'Insufficient balance.']);
        }

        // For example:
        Withdraw::create([
            'user_id' => $request->user_id,
            'amount' => $request->amount,
            'binance_id' => $request->binance_id,
            'payment_status' => 0, // Pending status
        ]);

        return response()->json(['success' => true]);
    }

    public function withdrawRequestList(){
        $datas = Withdraw::orderBy('id', 'DESC')->get();
        return view('admin.withdraw.index', compact('datas'));
    }

    public function withdrawConfirmStatus($id, $id2){
        $data = Withdraw::find($id);
        if($id2==2){
            $data->payment_status = 2;
            $data->save();
        }elseif($id2==1) {
            $data->payment_status = 1;
            $data->save();
            $user = User::find($data->user_id);
            $user->total_withdraw_amount =  (float)($user->total_withdraw_amount) + (float)($data->amount);
            $user->total_deposit_amount =  (float)($user->total_deposit_amount) - (float)($data->amount);
            $user->save();
        }
        return redirect()->route('withdraw-request-list')->with('success', 'Status Update Success');
    }

    public function updatePhoto(Request $request)
    {
        $request->validate([
            'photo' => 'required|image|mimes:jpg,jpeg,png,webp',
        ]);

        $user = User::find($request->user_id);

        // Store photo
        if ($request->hasFile('photo')) {
            $image      = $request->file('photo');
            $imageName  = time() . '_' . uniqid() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('images/profile_photos'), $imageName);
            $path = 'images/profile_photos/' . $imageName;
        }

        // Update user
        $user->profile_photo = $path;
        $user->save();

        return redirect()->route('frontend-dashboard')->with('success', 'Profile photo updated!');
    }

    public function commissionList(){
        $datas = Commission::with('user')->orderBy('id', 'DESC')->get();
        return view('admin.commission.index', compact('datas'));
    }

    public function commissionCreate()
    {
        $users = User::get();
        return view('admin.commission.create', compact('users'));
    }

    public function commissionStore(Request $request)
    { 
        $request->validate([
            'user_id' => 'required',
            'commission_type' => 'nullable|string|max:100',
            'percentage' => 'nullable|numeric|min:1|max:100',
            'amount' => 'required|numeric|min:1',
            'remarks' => 'nullable|string|max:255',
        ]);

        Commission::create([
            'user_id' => $request->user_id, 
            'commission_type' => $request->commission_type, 
            'percentage' => $request->percentage, 
            'amount' => $request->amount,
            'remarks' => $request->remarks,
            'created_by' => auth()->id(),
        ]);

        $user = User::find($request->user_id);
        $totalDeposit = (float) ($user->total_deposit_amount ?? 0.00);
        $amount = (float) $request->amount;
        $sum = $totalDeposit + $amount;
        $user->total_commission_amount = (float) ($user->total_commission_amount ?? 0.00) + $amount;
        $user->total_deposit_amount = $sum;
        $user->save();

        return redirect()->route('commission.list')->with('success', 'Commission submitted successfully.');
    }

    public function commissionEdit($id)
    {
        $datas = Commission::find($id);
        $users = User::get();
        return view('admin.commission.edit', compact('datas','users'));
    }

    public function commissionUpdate(Request $request)
    { 
        $request->validate([
            'user_id' => 'required',
            'commission_type' => 'nullable|string|max:100',
            'percentage' => 'nullable|numeric|min:1|max:100',
            'amount' => 'nullable|numeric|min:10',
            'remarks' => 'nullable|string|max:255',
        ]);

        $comData = Commission::find($id);
        $comData->user_id = $request->user_id;
        $comData->commission_type = $request->commission_type;
        $comData->percentage = $request->percentage;
        $comData->amount = $request->amount;
        $comData->remarks = $request->remarks;
        $comData->created_by = auth()->id();
        $comData->save();

        $user = User::find($request->user_id);
        $totalDeposit = (float) ($user->total_deposit_amount ?? 0.00);
        $amount = (float) $request->amount;
        $sum = $totalDeposit + $amount;
        $user->total_commission_amount = (float) ($user->total_commission_amount ?? 0.00) + $amount;
        $user->total_deposit_amount = $sum;
        $user->save();

        return redirect()->route('commission.list')->with('success', 'Commission updated successfully.');
    }

    public function commissionDelete($id)
    {
        $data = Commission::find($id);
        $user = User::find($data->user_id);
        $totalDeposit = (float) ($user->total_deposit_amount ?? 0.00);
        $amount = (float) $data->amount;
        $minus = $totalDeposit - $amount;
        $user->total_commission_amount = (float) ($user->total_commission_amount ?? 0.00) - $amount;
        $user->total_deposit_amount = $minus;
        $user->save();

        $data->delete();
        return redirect()->back()->with('warning', 'Commission deleted successfully.');
    }

    public function reviewList(){
        $datas = Review::with('user')->orderBy('id', 'DESC')->get();
        return view('admin.review.index', compact('datas'));
    }

    public function reviewCreate()
    {
        $users = User::get();
        return view('admin.review.create', compact('users'));
    }

    public function reviewStore(Request $request)
    { 
        $request->validate([
            'user_id' => 'required',
            'remarks' => 'nullable|string|max:255',
        ]);

        if($request->status){
            $status = $request->status;
        }else{
            $status = 0;
        }

        Review::create([
            'user_id' => $request->user_id, 
            'remarks' => $request->remarks,
            'status'  => $status,
            'created_by' => auth()->id(),
        ]);

        return redirect()->route('review.list')->with('success', 'Review submitted successfully.');
    }

    public function reviewEdit($id)
    {
        $datas = Review::find($id);
        $users = User::get();
        return view('admin.review.edit', compact('datas','users'));
    }

    public function reviewUpdate(Request $request)
    { 
        $request->validate([
            'user_id' => 'required',
            'remarks' => 'nullable|string|max:255',
        ]);

        if($request->status){
            $status = $request->status;
        }else{
            $status = 0;
        }

        Review::updateOrCreate(
            [
                'user_id' => $request->user_id, 
            ],
            [
                'remarks'    => $request->remarks,
                'status' => $status,
                'created_by' => auth()->id(),
            ]
        );

        return redirect()->route('review.list')->with('success', 'Review updated successfully.');
    }

    public function reviewDelete($id)
    {
        Review::find($id)->delete();
        return redirect()->back()->with('warning', 'Review deleted successfully.');
    }

    public function investCancel(Request $request){

        $request->validate([
            'user_id' => 'required',
            'invest_id' => 'required',
        ]);

        $user = User::find($request->user_id);
        $invest = TInvest::find($request->invest_id);
        if($invest->invest_type == "Flexible"){
            $isCancelable = $invest->created_at->diffInHours(\Carbon\Carbon::now()) >= 24;
        }else{
            $isCancelable = $invest->created_at->diffInDays(now()) >= 30;
        }

        if($isCancelable){
            $user->total_invest_amount = $user->total_invest_amount - $invest->amount;
            $user->total_deposit_amount = $user->total_deposit_amount + $invest->amount;
            $user->save();

            $invest->payment_status = 2;
            $invest->save();

            return redirect()->route('frontend-dashboard')->with('success','Investment cancelled and amount refunded to available balance.');
        }else{
            return redirect()->route('frontend-dashboard')->with('error','Investment can only be cancelled after 7 days.');
        }
    }

    public function forgotPasswordMail(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json(['error' => 'Email not found in our records.'], 404);
        }

        // Generate secure token
        $token = Password::getRepository()->create($user);

        // Send mail via queue
        Mail::to($user->email)->queue(new ForgotPasswordMail($user, $token));

        return response()->json([
            'success' => true,
            'token' => $token,
            'message' => 'Reset link sent to your email.'
        ]);
    }

    public function showResetForm(Request $request)
    {
        $email = $request->query('email');
        $token = $request->query('token');

        return view('frontend.resetPassword', compact('email', 'token'));
    }


    public function resetPassword(Request $request)
    { 
        $request->validate([
            'token' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8', // make sure confirm_password exists
        ]);

        $status = Password::reset(
            $request->only('email', 'password', 'token'),
            function ($user, $password) {
                $user->password = Hash::make($password);
                $user->save();
            }
        );

        if ($status === Password::PASSWORD_RESET) {
            return response()->json([
                'success' => true,
                'message' => 'Password reset successful!',
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Invalid token or email.',
            ], 400);
        }
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
