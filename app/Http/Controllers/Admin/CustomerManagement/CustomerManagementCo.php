<?php

namespace App\Http\Controllers\Admin\CustomerManagement;

use App\Http\Controllers\Controller;
use App\Models\Api\TBusiness;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Api\TBusinessOwnerInfo;
use App\Models\Api\TSaveBusiness;
use App\Models\Api\TBusinessRating;
use App\Models\Admin\TBusinessType;
use App\Models\Admin\TBusinessCategory;
use App\Models\Admin\TBusinessSubCategory;
use App\Models\Admin\TCreedTags;
use App\Models\Admin\TAdminRestaurant;
use App\Models\Api\TPayment;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Auth;
use Carbon\Carbon;
use DB;

class CustomerManagementCo extends Controller
{
    public function customerList(Request $request)
    {

        if (!empty($request->all()) && $request->account_type == 'G') {

            $datas = User::where('account_type', 'G')->get();
            $accountType = 'G';
        } elseif (!empty($request->all()) && $request->account_type == 'GB') {

            $datas = User::where('account_type', 'GB')->get();
            $accountType = 'GB';
        } else {

            $accountType = '';
            $datas = User::get();
        }

        return view('admin.customerManagement.index', compact(['datas', 'accountType']));
    }

    public function customerListCreate()
    {
        $types = TBusinessType::get();
        $categories = TBusinessCategory::get();
        $subCategories = TBusinessSubCategory::get();
        $creedTags = TCreedTags::get();
        $restaurants = TAdminRestaurant::get();

        return view('admin.customerManagement.add', compact(['types', 'categories', 'subCategories', 'creedTags', 'restaurants']));
    }

    public function customerListStore(Request $request)
    {

        $loginData = new user();
        $loginData->first_name = $request->first_name;
        $loginData->last_name = $request->last_name;
        $loginData->name = $request->first_name . ' ' . $request->last_name;
        $loginData->account_type = 'GB';
        $loginData->phone_number = $request->phone_number;
        $loginData->email = $request->email;
        $loginData->password = hash($request->password);
        $loginData->save();

        $ownerInfo = new TBusinessOwnerInfo();
        $ownerInfo->user_id = $loginData->id;
        $ownerInfo->first_name = $request->first_name;
        $ownerInfo->last_name = $request->last_name;
        $ownerInfo->email = $request->email;
        $ownerInfo->country_code = $request->country_code;
        $ownerInfo->phone_number = $request->phone_number;
        $ownerInfo->address = $request->address;
        $ownerInfo->status = 2;
        $ownerInfo->save();

        $businessInfo = new TBusiness();
        $businessInfo->business_name = $request->business_name;
        $businessInfo->business_type_id = $request->business_type_id;
        $businessInfo->business_category_id = $request->business_category_id;
        $businessInfo->business_subcategory_id = $request->business_subcategory_id;
        $businessInfo->creed_tags_id = $request->creed_tags_id;
        $businessInfo->business_email = $request->business_email;
        $businessInfo->country_code = $request->country_code;
        $businessInfo->business_phone_number = $request->business_phone_number;
        $businessInfo->business_website = $request->business_website;
        $businessInfo->country = $request->country;
        $businessInfo->state = $request->state;
        $businessInfo->city = $request->city;
        $businessInfo->zip_code = $request->zip_code;
        $businessInfo->address = $request->address;
        $businessInfo->lat = $request->lat;
        $businessInfo->long = $request->long;
        $businessInfo->description = $request->description;
        $businessInfo->service_area = $request->service_area;
        $businessInfo->hotline_country_code = $request->hotline_country_code;
        $businessInfo->customer_hotline = $request->customer_hotline;
        $businessInfo->customer_email_leads = $request->customer_email_leads;
        $businessInfo->restaurant_id = $request->restaurant_id;
        $businessInfo->discount_code = $request->discount_code;
        $businessInfo->discount_code_description = $request->discount_code_description;
        $businessInfo->hancut_text = $request->hancut_text;
        $businessInfo->business_owner_id = $ownerInfo->id;
        $businessInfo->status = 2;
        $businessInfo->save();

        return redirect()->route('customers.list')->with('success', 'New Customer Account Created Successfully');
    }

    public function customerListEdit($id)
    {

        $user = User::find($id);
        $savedBusinessLists = TSaveBusiness::with('business')
            ->where('user_id', $user->id)
            ->where('status', 1)
            ->get();

        $businessOwnerInfo = TBusinessOwnerInfo::with('users')
            ->where('user_id', $user->id)
            ->first();

        $businessListIds = DB::table('t_businesses')
            ->join('t_business_owner_infos', 't_business_owner_infos.id', '=', 't_businesses.business_owner_id')
            ->join('users', 'users.id', '=', 't_business_owner_infos.user_id')
            ->where('t_business_owner_infos.user_id', $user->id)
            ->pluck('t_businesses.id');

        $businessLists = TBusiness::whereIn('id', $businessListIds)
            ->with(['businessOwnerInfos', 'countryName', 'cityName', 'stateName', 'businessCategory', 'businessSubCategory', 'businessTags', 'operationData', 'galleryData', 'ratings', 'restaurant', 'paymentInfo'])
            ->get();

        if ($user->account_type == 'GB') {
            return view('admin.customerManagement.generalCustomerEdit', compact(['user', 'savedBusinessLists', 'businessLists']));
        } else {
            return view('admin.customerManagement.generalCustomerEdit', compact(['user', 'savedBusinessLists']));
        }
    }

    public function ownerInfoUpdate(Request $request, $id)
    {

        $validator = Validator::make($request->all(), [
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'email' => 'required|email',
            'country_code' => 'nullable|string',
            'phone_number' => 'required|string',
            'address' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            $errors = collect($validator->errors()->toArray())->map(fn($messages) => $messages[0]);
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $errors,
            ], 422);
        }

        $ownerInfo = TBusinessOwnerInfo::find($id)->update($request->all());

        return redirect()->back()->with('info', 'Owner Info Updated Successfully');
    }

    public function businessInfoUpdate(Request $request, $id)
    {

        $validator = Validator::make($request->all(), [
            'business_name' => 'required|string',
            'business_type_id' => 'nullable|string',
            'business_category_id' => 'nullable|integer',
            'business_subcategory_id' => 'nullable|integer',
            'creed_tags_id' => 'nullable|integer',
            'business_email' => 'nullable|email',
            'country_short_code' => 'nullable|string',
            'country_code' => 'nullable|string',
            'business_phone_number' => 'nullable|string',
            'business_website' => 'nullable|string',
            'country' => 'nullable|string',
            'state' => 'nullable|string',
            'city' => 'nullable|string',
            'zip_code' => 'nullable|string',
            'address' => 'nullable|string',
            'lat' => 'nullable|string',
            'long' => 'nullable|string',
            'description' => 'nullable|string',
            'service_area' => 'nullable|string',
            'hotline_country_code' => 'nullable|string',
            'customer_hotline' => 'nullable|string',
            'customer_email_leads' => 'nullable|string',
            'restaurant_id' => 'nullable|string',
            'discount_code' => 'nullable|string',
            'discount_code_description' => 'nullable|string',
            'hancut_text' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            $errors = collect($validator->errors()->toArray())->map(fn($messages) => $messages[0]);
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $errors,
            ], 422);
        }

        $businessInfo = TBusiness::find($id)->update($request->all());

        return redirect()->back()->with('info', 'Business Info Updated Successfully');
    }

    public function businessAccountDeactive(Request $request, $id)
    {
        $business = TBusiness::find($id);
        $business->galleryData()->delete();
        $business->operationData()->delete();
        $business->ratings()->delete();
        $business->delete();

        return redirect()->back()->with('info', 'This Business Account Deactivated Successfully');
    }

    public function businessAccountActive(Request $request, $id)
    {
        $business = TBusiness::withTrashed()->find($id)->restore();

        return redirect()->back()->with('info', 'This Business Account Activated Successfully');
    }


    public function businessAccountActiveDeactive(Request $request)
    {
        $business = TBusiness::with('businessOwnerInfos')->where('id', $request->business_id)->first();
        $businessOwnerInfo = TBusinessOwnerInfo::where('id', $business->business_owner_id)->first();

        // checking if business payment expired
        $paymentInfo = TPayment::where('business_id', $business->id)->first();

        if (!empty($paymentInfo)) {
            if ($request->is_active == 1) {
                if ($paymentInfo->subscription_expired_date < Carbon::now()) {
                    return back()->with('error', 'Subscription Already Expired. Please renew your subscription.');
                }
            }
        }

        $business->update([
            'onboard_status' => $request->is_active,
        ]);

        $businessOwnerInfo->update([
            'onboard_status' => $request->is_active
        ]);


        return back()->with('success', 'Business Account Status Updated Successfully');
    }

    public function businessAccountDelete($id)
    {
        $business = TBusiness::find($id);
        $business->businessOwnerInfos()->delete();
        $business->galleryData()->delete();
        $business->operationData()->delete();
        $business->ratings()->delete();
        $business->halalCertificateData()->delete();
        $business->businessProfileVisitors()->delete();
        $business->saveBusinessLists()->delete();
        $business->delete();

        return redirect()->back()->with('success', 'Business Account Deleted Successfully');
    }

    public function businessAccountRestore($id)
    {
        $business = TBusiness::withTrashed()->find($id);

        $business->galleryData()->withTrashed()->restore();
        $business->operationData()->withTrashed()->restore();
        $business->businessOwnerInfos()->withTrashed()->restore();
        $business->ratings()->withTrashed()->restore();
        $business->halalCertificateData()->withTrashed()->restore();
        $business->businessProfileVisitors()->withTrashed()->restore();
        $business->saveBusinessLists()->withTrashed()->restore();
        $business->restore();

        return redirect()->back()->with('success', 'Business Account Restored Successfully');
    }


    public function customerDetailsView($id)
    {
        $user = User::find($id);
        $savedBusinessLists = TSaveBusiness::with('business')
            ->where('user_id', $user->id)
            ->where('status', 1)
            ->get();

        $businessOwnerInfo = TBusinessOwnerInfo::with('users')
            ->where('user_id', $user->id)
            ->first();

        $businessListIds = DB::table('t_businesses')
            ->join('t_business_owner_infos', 't_business_owner_infos.id', '=', 't_businesses.business_owner_id')
            ->join('users', 'users.id', '=', 't_business_owner_infos.user_id')
            ->where('t_business_owner_infos.user_id', $user->id)
            ->pluck('t_businesses.id');

        $businessLists = TBusiness::whereIn('id', $businessListIds)
            ->with(['businessOwnerInfos', 'countryName', 'cityName', 'stateName', 'businessCategory', 'businessSubCategory', 'businessTags', 'operationData', 'galleryData', 'ratings', 'restaurant', 'paymentInfo'])
            ->get();

        if ($user->account_type == 'GB') {
            return view('admin.customerManagement.generalCustomerView', compact(['user', 'savedBusinessLists', 'businessLists']));
        } else {
            return view('admin.customerManagement.generalCustomerView', compact(['user', 'savedBusinessLists']));
        }
    }

    public function profileImage(Request $request)
    {
        $request->validate([
            'avatar' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
        ]);

        try {
            if ($request->file('avatar')) {
                $file = $request->file('avatar');
                $profile = time() . '.' . $file->getClientOriginalExtension();
                $file->move(public_path('images/customerProfile'), $profile);
                $imagePath = 'images/customerProfile/' . $profile;

                $user = User::find($request->id);
                $user->avatar = $imagePath;
                $user->save();
            }
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()]);
        }


        // return redirect()->route('customers-details.view', $request->id)->with('success', 'Profile Image Successfully Updated');
    }

    // customer active / deactive
    public function customerListActiveDeactive(Request $request)
    {
        $user = User::with('businessOwnerInfos')->find($request->user_id);

        foreach ($user->businessOwnerInfos as $value) {
            $ownerInfo = TBusinessOwnerInfo::with(['business'])->find($value->id);

            if (!empty($ownerInfo->business)) {
                $ownerInfo->business->update([
                    'onboard_status'    => $request->is_active,
                ]);
            }

            $ownerInfo->update([
                'onboard_status'        => $request->is_active
            ]);
        }

        $user->update([
            'status'            => $request->is_active,
        ]);

        return back()->with('success', 'Customer Account Status Updated Successfully');
    }

    public function customerListDelete($id)
    {
        try {
            $users = User::with(['businessOwnerInfos', 'businessOwnerInfos.business', 'businessOwnerInfos.business.galleryData', 'businessOwnerInfos.business.operationData', 'businessOwnerInfos.business.ratings', 'businessOwnerInfos.business.halalCertificateData', 'businessOwnerInfos.business.businessProfileVisitors', 'businessOwnerInfos.business.saveBusinessLists'])->find($id);

            foreach ($users->businessOwnerInfos as $value) {

                $ownerInfo = TBusinessOwnerInfo::with(['business', 'business.galleryData', 'business.operationData', 'business.ratings'])->find($value->id);

                if (!empty($ownerInfo->business)) {
                    // $data [] = $ownerInfo->business;
                    $ownerInfo->business->galleryData()->delete();
                    $ownerInfo->business->operationData()->delete();
                    $ownerInfo->business->ratings()->delete();
                    $ownerInfo->business->halalCertificateData()->delete();
                    $ownerInfo->business->businessProfileVisitors()->delete();
                    $ownerInfo->business->saveBusinessLists()->delete();
                }

                $ownerInfo->business()->delete();
                $ownerInfo->delete();
            }

            $randomNumber = str_pad(rand(0, 9999), 4, '0', STR_PAD_LEFT);

            $users->update([
                'email' => 'd_'. $randomNumber . '_' . $users->email,
            ]);

            $users->delete();

            return redirect()->route('customers.list')->with('success', 'Account Archieve Successfully');
        } catch (\Exception $e) {
            Log::error('Error deleting user: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Unable to archieve the user.');
        }
    }

    public function customerArchiveList()
    {

        $archiveData = User::onlyTrashed()->get();
        $archiveBusinessData = TBusiness::onlyTrashed()->with([
            'businessOwnerInfos' => function ($q) {
                $q->withTrashed();
            },
            'businessOwnerInfos.users' => function ($q) {
                $q->withTrashed();
            },

        ])->get();

        return view('admin.customerManagement.archieveList', compact('archiveData', 'archiveBusinessData'));
    }

    public function customerArchiveListRetrieve($id)
    {
        $users = User::withTrashed()->find($id)->restore();

        $users = User::with(['businessOwnerInfos', 'businessOwnerInfos.business', 'businessOwnerInfos.business.galleryData', 'businessOwnerInfos.business.operationData', 'businessOwnerInfos.business.ratings',  'businessOwnerInfos.business.halalCertificateData', 'businessOwnerInfos.business.businessProfileVisitors', 'businessOwnerInfos.business.saveBusinessLists'])->withTrashed()->find($id);

        foreach ($users->businessOwnerInfos as $value) {
            $ownerInfo = TBusinessOwnerInfo::with(['business', 'business.galleryData', 'business.operationData', 'business.ratings', 'business.halalCertificateData', 'business.businessProfileVisitors', 'business.saveBusinessLists'])->where('id', $value->id)->withTrashed()->get()->first();

            $business = TBusiness::withTrashed()->find($ownerInfo->business_id);

            // business related table
            $business->galleryData()->withTrashed()->restore();
            $business->operationData()->withTrashed()->restore();
            $business->ratings()->withTrashed()->restore();
            $business->halalCertificateData()->withTrashed()->restore();
            $business->businessProfileVisitors()->withTrashed()->restore();
            $business->saveBusinessLists()->withTrashed()->restore();
            $business->restore();

            $ownerInfo->withTrashed()->restore();
        }


        return redirect()->back()->with('success', 'Selected user successfully retrieve.');
    }


    public function customerArchiveListDelete($id)
    {

        $users = User::with(['businessOwnerInfos', 'businessOwnerInfos.business', 'businessOwnerInfos.business.galleryData', 'businessOwnerInfos.business.operationData', 'businessOwnerInfos.business.ratings'])->withTrashed()->find($id);

        $users->forceDelete();

        return redirect()->back()->with('success', 'Selected user permanent deleted successfull.');
    }

    public function businessList(Request $request)
    {
        if (!empty($request->all()) && $request->business_status == 'incomplete') {

            $datas = TBusiness::where('status', '<', 7)->latest()->get(); //->where('approval_status', 0)->where('onboard_status', 0)->latest()->get();
            $businessStatus = 'incomplete';
        } elseif (!empty($request->all()) && $request->business_status == 'pending') {

            $datas = [];     //TBusiness::where('status', 7)->where('approval_status', 0)->where('onboard_status', 0)->latest()->get();
            $businessStatus = 'pending';
        } elseif (!empty($request->all()) && $request->business_status == 'published') {

            $datas = TBusiness::where('status', 7)->latest()->get(); //TBusiness::where('status', 7)->where('approval_status', 1)->where('onboard_status', 1)->latest()->get();
            $businessStatus = 'published';
        } elseif (!empty($request->all()) && $request->business_status == 'unpublished') {

            $datas = []; //TBusiness::where('status', 7)->where('approval_status', 1)->where('onboard_status', 0)->latest()->get();
            $businessStatus = 'unpublished';
        } elseif (!empty($request->all()) && $request->business_status == 'inactive') {

            $datas = TBusiness::withTrashed()->where('status', 7)->where('deleted_at', '!=', NULL)->latest()->get();
            $businessStatus = 'inactive';
        } else {

            $datas = TBusiness::withTrashed()->latest()->get();
            $businessStatus = '';
        }

        return view('admin.customerManagement.businessList', compact(['datas', 'businessStatus']));
    }

    public function reviews($id)
    {
        $reviews = TBusiness::with('ratingsWithInactive', 'ratingsWithInactive.user')->find($id);

        return view('admin.customerManagement.reviews', compact(['reviews']));
    }

    public function reviewsDelete($id)
    {

        $reviews = TBusinessRating::find($id);
        $reviews->delete();

        return redirect()->back()->with('success', 'Reviews Deleted Successful.');
    }
}
