<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Admin\TCompanyInfo;
use App\Models\Admin\TAdminCountry;
use App\Models\Admin\TAdminState;
use App\Models\Admin\TAdminCity;
use App\Models\Admin\TCreedTags;
use App\Models\Admin\TAboutUs;
use App\Models\Admin\TAdminPrivacyPolicy;
use App\Models\Admin\TAppTermsAndConditions;
use App\Models\Api\TBusinessOwnerInfo;
use App\Models\Api\TContactCreed;
use App\Models\Api\TDashboardTodoList;
use Illuminate\Support\Facades\Http;
use App\Jobs\ImportMosquesFromGoogle;

use App\Models\Api\TCallMe;
use App\Models\Api\TQuote;
use App\Models\Api\TBusiness;
use App\Models\Api\TPayment;
use App\Models\Api\TAdminVersion;
use App\Models\Api\TSaveBusiness;
use App\Models\Api\TCreedVisitor;
use App\Models\Api\TBusinessProfileVisitor;
use App\Models\Admin\TDays;
use App\Models\Admin\TCheckoutTextData;
use App\Models\Api\TBusinessRating;
use App\Models\Api\TBusinessGallery;
use App\Models\Api\TAdminMosqueData;
use App\Models\Admin\TAdminAffiliation;
use App\Models\Admin\TAdminRestaurant;
use App\Models\Admin\TAdminPricingPlan;
use App\Models\Api\TOperationHour;
use App\Models\Api\THalalCertificateData;
use App\Models\Admin\TBusinessTags;
use App\Models\Admin\TBusinessType;
use App\Models\Admin\TAdminNote;
use App\Models\Admin\TBusinessCategory;
use App\Models\Admin\TBusinessSubCategory;
use App\Http\Requests\Api\TBusinessOwnerInfoRequest;
use App\Models\Admin\TAdminAddListingFormManagement;
use App\Http\Requests\Api\TBusinessRequest;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Mail;
use Carbon\Carbon;
use Stripe\Stripe;
use Stripe\Checkout\Session;
use Auth;
use DB;
use Illuminate\Support\Str;

class UserBusinessOwnerInfoCo extends Controller
{
    // Business Owner info page get data
    public function businessOwnerInfoGet(Request $request)
    {

        try {
            if (!empty($request->owner_id)) {
                // Fetch the business owner info for the current user
                $tUserTBusinessOwnerInfo = TBusinessOwnerInfo::select([
                    'id',
                    'first_name',
                    'last_name',
                    'email',
                    'country_code',
                    'country_short_code',
                    'phone_number',
                    'address',
                    'business_id',
                    'status'
                ])
                    ->where('user_id', $request->user()->id)
                    ->where('id', $request->owner_id)
                    ->latest()
                    ->get()
                    ->first();
            } else {
                // Fetch the business owner info for the current user
                $tUserTBusinessOwnerInfo = TBusinessOwnerInfo::select([
                    'id',
                    'first_name',
                    'last_name',
                    'email',
                    'country_code',
                    'country_short_code',
                    'phone_number',
                    'address',
                    'business_id',
                    'status'
                ])
                    ->where('user_id', $request->user()->id)
                    ->latest()
                    ->get()
                    ->first();
            }
            // If data exists, convert it to an array for easier manipulation
            if (!empty($tUserTBusinessOwnerInfo)) {
                $tUserTBusinessOwnerInfo = $tUserTBusinessOwnerInfo->toArray();
            }

            // Fetch the field status for "Owner Info"
            $data2 = TAdminAddListingFormManagement::select(['field_name', 'field_status'])
                ->where('field_category', 'Owner Info')
                ->where('status', 1)
                ->get()
                ->toArray();

            // Merge the field status into the owner info data
            foreach ($data2 as $field) {
                // Add status as a new field like 'first_name_status', 'last_name_status', etc.
                if (isset($tUserTBusinessOwnerInfo[$field['field_name']])) {
                    $tUserTBusinessOwnerInfo[$field['field_name'] . '_status'] = (bool) $field['field_status'];
                }
            }

            // Send the response with the merged data
            return response()->json([
                'status' => 'success',
                'owner_info_page_title' => TAdminNote::where('status', 1)->get()->pluck('owner_info_page')->first(),
                'data' => $tUserTBusinessOwnerInfo
            ], 200);
        } catch (\Exception $e) {
            \Log::error('Database error: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // Business Owner info page data store
    public function businessOwnerInfoStore(Request $request)
    {

        try {
            $validator = Validator::make($request->all(), [
                'first_name' => 'required|string',
                'last_name' => 'required|string',
                'email' => 'required|email',
                'country_code' => 'required|string',
                'country_short_code' => 'nullable',
                'phone_number' => 'required|string',
                'address' => 'nullable|string',
                'owner_id' => 'nullable',
            ]);

            if ($validator->fails()) {
                $errors = collect($validator->errors()->toArray())->map(fn($messages) => $messages[0]);
                return response()->json([
                    'status' => 'error',
                    'message' => $validator->errors()->first(),
                    'errors' => $errors,
                ], 422);
            }

            if ($request->owner_id == null) {
                $tUserTBusinessOwnerInfo = new TBusinessOwnerInfo();
                $tUserTBusinessOwnerInfo->user_id = $request->user()->id;
                $tUserTBusinessOwnerInfo->first_name = $request->first_name;
                $tUserTBusinessOwnerInfo->last_name = $request->last_name;
                $tUserTBusinessOwnerInfo->email = $request->email;
                $tUserTBusinessOwnerInfo->country_short_code = $request->country_short_code;
                $tUserTBusinessOwnerInfo->country_code = $request->country_code;
                $tUserTBusinessOwnerInfo->phone_number = $request->phone_number;
                $tUserTBusinessOwnerInfo->address = $request->address;
                $tUserTBusinessOwnerInfo->save();

                $users = User::find($request->user()->id);
                if ($users->name == '') {
                    $users->name = $request->first_name . ' ' . $request->last_name;
                    $users->first_name = $request->first_name;
                    $users->last_name = $request->last_name;
                    $users->country_short_code = $request->country_short_code;
                    $users->country_code = $request->country_code;
                    $users->phone_number = $request->phone_number;
                    $users->address = $request->address;
                    $users->save();
                }
            } else {
                $tUserTBusinessOwnerInfo = TBusinessOwnerInfo::find($request->owner_id);
                $tUserTBusinessOwnerInfo->first_name = $request->first_name;
                $tUserTBusinessOwnerInfo->last_name = $request->last_name;
                $tUserTBusinessOwnerInfo->email = $request->email;
                $tUserTBusinessOwnerInfo->country_short_code = $request->country_short_code;
                $tUserTBusinessOwnerInfo->country_code = $request->country_code;
                $tUserTBusinessOwnerInfo->phone_number = $request->phone_number;
                $tUserTBusinessOwnerInfo->address = $request->address;
                $tUserTBusinessOwnerInfo->save();
            }
            return response()->json([
                'status' => 'success',
                'message' => 'Owner info saved successfully.',
                'tUserTBusinessOwnerInfo' => $tUserTBusinessOwnerInfo->id,
            ], 201);
        } catch (\Exception $e) {

            \Log::error('Database error: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // Business info step1 page get data(BusinessInfo)
    public function businessInfoStore1Get(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'owner_id' => 'required|integer|exists:t_business_owner_infos,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }

        try {

            $owner_info = TBusinessOwnerInfo::where('id', $request->owner_id)->first();
            $tUserTBusinessInfoStep1 = TBusiness::select(['id', 'business_name', 'description', 'business_type_id', 'business_category_id', 'business_subcategory_id', 'address', 'lat', 'long', 'country', 'state', 'city', 'zip_code'])->find($owner_info->business_id);
            if ($tUserTBusinessInfoStep1) {

                $data = json_decode($tUserTBusinessInfoStep1, true);
                $data['business_type_id'] = json_decode($data['business_type_id']);
                $data['business_subcategory_id'] = ($data['business_subcategory_id']);
                $data['country'] = $tUserTBusinessInfoStep1->countryName->name;
                $data['state'] = $tUserTBusinessInfoStep1->stateName->name;
                $data['city'] = $tUserTBusinessInfoStep1->cityName->name;

                if (!empty($tUserTBusinessInfoStep1)) {
                    $tUserTBusinessInfoStep1 = $data;
                }

                $data2 = TAdminAddListingFormManagement::select(['field_name', 'field_status'])
                    ->where('field_category', 'Business Info')
                    ->where('status', 1)
                    ->get()
                    ->toArray();

                // Merge the field status into the owner info data
                foreach ($data2 as $field) {
                    // Add status as a new field like 'first_name_status', 'last_name_status', etc.
                    if (isset($tUserTBusinessInfoStep1[$field['field_name']])) {
                        $tUserTBusinessInfoStep1[$field['field_name'] . '_status'] = (bool) $field['field_status'];
                    }
                }
            } else {
                $tUserTBusinessInfoStep1 = null;
            }

            return response()->json([
                'status' => 'success',
                'business_info_step_1' => TAdminNote::where('status', 1)->get()->pluck('business_info_step_1')->first(),
                'owner_info'    => $owner_info,
                'data'    => $tUserTBusinessInfoStep1,
            ], 200);
        } catch (\Exception $e) {

            \Log::error('Database error: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // Business info store step 1 (BusinessInfo)
    public function businessInfoStore1(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'owner_id' => 'required|integer|exists:t_business_owner_infos,id',
            'business_name' => 'required|string',
            'description' => 'required|string',
            'business_type_id' => 'required',
            'business_category_id' => 'required',
            'address' => 'required|string',
            'lat' => 'required',
            'long' => 'required',
            'country' => 'required|string',
            'state' => 'required|string',
            'city' => 'required|string',
            'zip_code' => 'required|string',
            'business_subcategory_id' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }

        try {

            $businessOwnerId = TBusinessOwnerInfo::where('id', $request->owner_id)->where('user_id', $request->user()->id)->where('status', '>=', 1)->get()->first();

            if(empty($businessOwnerId->id)){
                $message = "Please first fillup business owner information.";
                return response()->json([
                    'status' => 'failed',
                    'message' => $message
                ],500);
            }

            // business category section
            $business_category_id = $request->business_category_id;

            // business subcategory section
            $array = $request->business_subcategory_id;
            if ($array != null) {

                $storedTexts = [];

                $array = array_map(function ($item) use (&$storedTexts, $business_category_id) {
                    if (!ctype_digit($item)) {
                        $storedTexts[] = $item;
                        $newId = TBusinessSubCategory::firstOrCreate(['name' => $item, 'category_id' => $business_category_id])->id;
                        return ((string)$newId);
                    }
                    return $item;
                }, $array);
            } else {
                $array = NULL;
            }

            // country-dynamic
            $countryName = $request->input('country');
            $country = TAdminCountry::firstOrCreate(
                ['name' => $countryName],
                ['name' => $countryName]
            );
            // state-dynamic
            $stateName = $request->input('state');
            $state = TAdminState::firstOrCreate(
                ['name' => $stateName],
                ['name' => $stateName, 'country_id' => $country->id, 'country_name' => $country->name]
            );
            // city-dynamic
            $cityName = $request->input('city');
            $city = TAdminCity::firstOrCreate(
                ['name' => $cityName],
                ['name' => $cityName, 'state_id' => $state->id, 'country_id' => $country->id]
            );

            if ($businessOwnerId->business_id != '') {
                $businessData = TBusiness::find($businessOwnerId->business_id);
                $businessData->business_owner_id = $businessOwnerId->id;
                $businessData->business_name = $request->business_name;
                $businessData->description = $request->description;
                $businessData->business_type_id = json_encode($request->business_type_id);
                $businessData->business_category_id = $business_category_id;
                $businessData->business_subcategory_id = $array;
                $businessData->address = $request->address;
                $businessData->lat = $request->lat;
                $businessData->long = $request->long;
                $businessData->country = $country->id;
                $businessData->state = $state->id;
                $businessData->city = $city->id;
                $businessData->zip_code = $request->zip_code;
                $businessData->save();

                $tUserBusinessOwnerInfo = TBusinessOwnerInfo::find($businessOwnerId->id);
            } else {
                $businessData = new TBusiness();
                $businessData->business_owner_id = $businessOwnerId->id;
                $businessData->business_name = $request->business_name;
                $businessData->description = $request->description;
                $businessData->business_type_id = json_encode($request->business_type_id);
                $businessData->business_category_id = $business_category_id;
                $businessData->business_subcategory_id = $array;
                $businessData->address = $request->address;
                $businessData->lat = $request->lat;
                $businessData->long = $request->long;
                $businessData->country = $country->id;
                $businessData->state = $state->id;
                $businessData->city = $city->id;
                $businessData->zip_code = $request->zip_code;
                $businessData->status = 2;
                $businessData->save();

                $tUserBusinessOwnerInfo = TBusinessOwnerInfo::find($businessOwnerId->id);
                $tUserBusinessOwnerInfo->business_id = $businessData->id;
                $tUserBusinessOwnerInfo->status = 2;
                $tUserBusinessOwnerInfo->save();

                $tUsers = User::find($tUserBusinessOwnerInfo->user_id);
                $tUsers->account_type = 'GB';
                $tUsers->save();
            }

            $data = json_decode($businessData->makeHidden(['created_at', 'updated_at', 'deleted_at']), true);

            $data['business_type_id'] = json_decode($data['business_type_id']);
            $data['country'] = $businessData->countryName->name;
            $data['state'] = $businessData->stateName->name;
            $data['city'] = $businessData->cityName->name;
            // $businessData = json_encode($data, JSON_PRETTY_PRINT);

            $message = "Business info saved successfully.";
            return response()->json([
                'status' => 'success',
                'message' => $message,
                // 'ownerId' => $tUserBusinessOwnerInfo->id,
                // 'businessInfoStep1' => $data,
                // 'userBusinessOwnerInfo' => $tUserBusinessOwnerInfo->makeHidden(['created_at','updated_at','deleted_at'])
            ], 201);
        } catch (\Exception $e) {
            \Log::error('Database error: ' . $e->getMessage());
            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // Business info step2 page get data(BusinessContactInfo)
    public function businessInfoStore2Get(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'owner_id' => 'required|integer|exists:t_business_owner_infos,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }

        try {

            $owner_info = TBusinessOwnerInfo::where('id', $request->owner_id)->first();
            $tUserTBusinessInfoStep2 = TBusiness::select(['id', 'business_phone_number', 'country_short_code', 'country_code', 'business_email', 'same_as_owner_phone', 'same_as_owner_email', 'business_website', 'affiliation_id', 'facebook_link', 'instagram_link', 'twitter_link', 'tiktok_link'])->find($owner_info->business_id);
            $data = json_decode($tUserTBusinessInfoStep2, true);
            $data['affiliation_id'] = json_decode($data['affiliation_id']) == "" ? [] : json_decode($data['affiliation_id']);

            if (!empty($tUserTBusinessInfoStep2)) {
                $tUserTBusinessInfoStep2 = $data;
            }

            $data2 = TAdminAddListingFormManagement::select(['field_name', 'field_status'])
                ->where('field_category', 'Business Contact Info')
                ->where('status', 1)
                ->get()
                ->toArray();

            // Merge the field status into the owner info data
            foreach ($data2 as $field) {
                // Add status as a new field like 'first_name_status', 'last_name_status', etc.
                if (isset($tUserTBusinessInfoStep2[$field['field_name']])) {
                    $tUserTBusinessInfoStep2[$field['field_name'] . '_status'] = (bool) $field['field_status'];
                }
            }

            return response()->json([
                'status' => 'success',
                'business_info_step_2' => TAdminNote::where('status', 1)->get()->pluck('business_info_step_2')->first(),
                'owner_info'    => $owner_info,
                'data' => $tUserTBusinessInfoStep2,
            ], 200);
        } catch (\Exception $e) {

            \Log::error('Database error: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // Business info store step 2 (BusinessContactInfo)
    public function businessInfoStore2(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'owner_id' => 'required|integer|exists:t_business_owner_infos,id',
            'country_code' => 'required',
            'country_short_code' => 'nullable',
            'business_phone_number' => 'required',
            'business_email' => 'required|email',
            'same_as_owner_phone' => 'nullable',
            'same_as_owner_email' => 'nullable',
            'business_website' => 'nullable|url',
            'affiliation_id' => 'nullable',
            'facebook_link' => 'nullable | regex:/^https?:\/\/(www\.)?facebook\.com\/[A-Za-z0-9\.]+\/?$/',
            'instagram_link' => 'nullable | regex:/^https?:\/\/(www\.)?instagram\.com\/[A-Za-z0-9_\.]+\/?$/',
            'twitter_link' => ['nullable', 'regex:/^https?:\/\/(www\.)?(twitter|x)\.com\/[A-Za-z0-9_]{1,15}\/?$/'],
            'tiktok_link' => 'nullable | regex:/^https?:\/\/(www\.)?tiktok\.com\/@?[A-Za-z0-9_.]+\/?$/',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }

        try {
            $businessOwnerId = TBusinessOwnerInfo::where('id', $request->owner_id)->where('user_id', $request->user()->id)->where('status', '>=', 2)->get()->first();

            if(empty($businessOwnerId->id)){
                $message = "Please first fillup business information step 1.";
                return response()->json([
                    'status' => 'failed',
                    'message' => $message
                ],500);
            }

            // business affiliation_function
            $array = $request->affiliation_id;
            if ($array != null) {

                $storedTexts = [];

                $array = array_map(function ($item) use (&$storedTexts) {
                    if (!ctype_digit($item)) {
                        $storedTexts[] = $item;
                        $newId = TAdminAffiliation::firstOrCreate(['name' => $item])->id;
                        return ((string)$newId);
                    }
                    return $item;
                }, $array);
            } else {
                $array = '';
            }

            $businessData = TBusiness::find($businessOwnerId->business_id);
            $businessData->country_code          = $request->country_code;
            $businessData->country_short_code    = $request->country_short_code;
            $businessData->business_phone_number = $request->business_phone_number;
            $businessData->business_email        = $request->business_email;
            if ($request->same_as_owner_phone == 1) {
                $businessData->same_as_owner_phone = 1;
            } else {
                $businessData->same_as_owner_phone = 0;
            }
            if ($request->same_as_owner_email == 1) {
                $businessData->same_as_owner_email = 1;
            } else {
                $businessData->same_as_owner_email = 0;
            }
            $businessData->business_website      = $request->business_website;
            if ($businessOwnerId->status < 3) {
                $businessData->status = 3;
            }
            if ($array != '') {
                $businessData->affiliation_id = json_encode($array);
            } else {
                $businessData->affiliation_id = NULL;
            }
            $businessData->facebook_link  = $request->facebook_link;
            $businessData->instagram_link = $request->instagram_link;
            $businessData->twitter_link   = $request->twitter_link;
            $businessData->tiktok_link    = $request->tiktok_link;
            $businessData->save();

            $tUserBusinessOwnerInfo = TBusinessOwnerInfo::find($businessOwnerId->id);
            if ($businessOwnerId->status < 3) {
                $tUserBusinessOwnerInfo->status = 3;
            }
            $tUserBusinessOwnerInfo->save();

            $message = "Business contact info saved successfully.";

            return response()->json([
                'status' => 'success',
                'message' => $message,
                // 'userBusinessInfo' => $businessData->makeHidden(['created_at','updated_at']),
                // 'userBusinessOwnerInfo' => $tUserBusinessOwnerInfo->makeHidden(['created_at','updated_at']),
            ], 200);
        } catch (\Exception $e) {
            \Log::error('Database error: ' . $e->getMessage());
            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // Business info step3 page get data(AddBusinessImages)
    public function businessInfoStore3Get(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'owner_id' => 'required|integer|exists:t_business_owner_infos,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }

        try {

            $owner_info = TBusinessOwnerInfo::where('id', $request->owner_id)->first();
            $tUserTBusinessInfoStep3 = TBusiness::with('galleryData')->select(['id', 'business_profile_image'])->find($owner_info->business_id);
            if (!empty($tUserTBusinessInfoStep3)) {
                $tUserTBusinessInfoStep3 = $tUserTBusinessInfoStep3;
            }

            $data2 = TAdminAddListingFormManagement::select(['field_name', 'field_status'])
                ->where('field_category', 'Add Business Images')
                ->where('status', 1)
                ->get()
                ->toArray();

            // Merge the field status into the owner info data
            foreach ($data2 as $field) {
                // Add status as a new field like 'first_name_status', 'last_name_status', etc.
                if (isset($tUserTBusinessInfoStep3[$field['field_name']])) {
                    $tUserTBusinessInfoStep3[$field['field_name'] . '_status'] = (bool) $field['field_status'];
                }
            }

            return response()->json([
                'status' => 'success',
                'business_info_step_3' => TAdminNote::where('status', 1)->get()->pluck('business_info_step_3')->first(),
                'owner_info'    => $owner_info,
                'data' => $tUserTBusinessInfoStep3,
            ], 200);
        } catch (\Exception $e) {

            \Log::error('Database error: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // Business info store step 3 (AddBusinessImages)
    public function businessInfoStore3(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'owner_id' => 'required|integer|exists:t_business_owner_infos,id',
            // 'business_profile_image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }

        try {
            $businessOwnerId = TBusinessOwnerInfo::where('id', $request->owner_id)->where('user_id', $request->user()->id)->where('status', '>=', 3)->get()->first();

            if(empty($businessOwnerId->id)){
                $message = "Please first fillup business information step 2.";
                return response()->json([
                    'status' => 'failed',
                    'message' => $message
                ],500);
            }

            if ($request->file('business_profile_image')) {

                $file = $request->file('business_profile_image');
                $profile = time() . '.' . $file->getClientOriginalExtension();
                $file->move(public_path('images/business/profile'), $profile);
                $imagePath = 'images/business/profile/' . $profile;
            } else {
                $imagePath = TBusiness::where('business_owner_id', $request->owner_id)->get()->pluck('business_profile_image')->first();
            }

            $businessData = TBusiness::find($businessOwnerId->business_id);
            $businessData->business_profile_image = $imagePath;
            if ($businessOwnerId->status < 4) {
                $businessData->status = 4;
            }
            $businessData->save();

            if ($request->hasFile('business_gallery_image')) {

                foreach ($request->file('business_gallery_image') as $index => $image) {

                    $imageName = time() . $index . '_' . $image->getClientOriginalName();
                    $image->move(public_path('images/business/gallery'), $imageName);
                    $imagePaths = 'images/business/gallery/' . $imageName;

                    $galleryData = new TBusinessGallery();
                    $galleryData->business_id = $businessData->id;
                    $galleryData->business_gallery_image = $imagePaths;
                    $galleryData->save();
                }
            }

            $tUserBusinessOwnerInfo = TBusinessOwnerInfo::find($businessOwnerId->id);
            if ($businessOwnerId->status < 4) {
                $tUserBusinessOwnerInfo->status = 4;
            }
            $tUserBusinessOwnerInfo->save();

            $galleryDatas = TBusinessGallery::where('business_id', $businessData->id)->get()->makeHidden(['created_at', 'updated_at']);

            $message = "Business images saved successfully.";

            return response()->json([
                'status' => 'success',
                'message' => $message,
            ], 200);
        } catch (\Exception $e) {
            \Log::error('Database error: ' . $e->getMessage());
            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // Business info step4 page get data(Hours&ServiceArea)
    public function businessInfoStore4Get(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'owner_id' => 'required|integer|exists:t_business_owner_infos,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }

        try {

            $owner_info = TBusinessOwnerInfo::where('id', $request->owner_id)->first();
            $tUserTBusinessInfoStep4 = TBusiness::with('operationData')->select(['id', 'service_area'])->find($owner_info->business_id);

            $data = json_decode($tUserTBusinessInfoStep4, true);
            $data['service_area'] = json_decode($data['service_area']);

            if (!empty($tUserTBusinessInfoStep4)) {
                $tUserTBusinessInfoStep4 = $data;
            }

            $data2 = TAdminAddListingFormManagement::select(['field_name', 'field_status'])
                ->where('field_category', 'Hours & Service Area')
                ->where('status', 1)
                ->get()
                ->toArray();

            // Merge the field status into the owner info data
            foreach ($data2 as $field) {
                // Add status as a new field like 'first_name_status', 'last_name_status', etc.
                if (isset($tUserTBusinessInfoStep4[$field['field_name']])) {
                    $tUserTBusinessInfoStep4[$field['field_name'] . '_status'] = (bool) $field['field_status'];
                }
            }

            return response()->json([
                'status' => 'success',
                'business_info_step_4' => TAdminNote::where('status', 1)->get()->pluck('business_info_step_4')->first(),
                'owner_info'    => $owner_info,
                'data' => $tUserTBusinessInfoStep4,
            ], 200);
        } catch (\Exception $e) {

            \Log::error('Database error: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // Business info store step 4 (Hours&ServiceArea)
    public function businessInfoStore4(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'owner_id' => 'required|integer|exists:t_business_owner_infos,id',
            'service_area' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }

        try {
            $businessOwnerId = TBusinessOwnerInfo::where('id', $request->owner_id)->where('user_id', $request->user()->id)->where('status', '>=', 4)->get()->first();

            if(empty($businessOwnerId->id)){
                $message = "Please first fillup business information step 3.";
                return response()->json([
                    'status' => 'failed',
                    'message' => $message
                ],500);
            }

            $businessData = TBusiness::find($businessOwnerId->business_id);
            $businessData->service_area = json_encode($request->service_area);
            if ($businessOwnerId->status < 5) {
                $businessData->status = 5;
            }
            $businessData->save();
            $operationHourCheck = TOperationHour::where('business_id', $businessData->id)->get();

            if (!empty($operationHourCheck)) {
                foreach ($operationHourCheck as $value) {
                    $data =  ToperationHour::find($value->id);
                    $data->delete();
                }
            }

            foreach ($request->operation_data as $scheduleData) {

                $scheduleData['business_id'] = $businessData->id;
                $scheduleData['timezone'] = $request->timezone ?? '';
                TOperationHour::create($scheduleData);
            }

            $tUserBusinessOwnerInfo = TBusinessOwnerInfo::find($businessOwnerId->id);
            if ($businessOwnerId->status < 5) {
                $tUserBusinessOwnerInfo->status = 5;
            }
            $tUserBusinessOwnerInfo->save();

            $operationHours = TOperationHour::where('business_id', $businessData->id)->get()->makeHidden(['created_at', 'updated-at']);

            $message = "Business hours & service area saved successfully.";

            return response()->json([
                'status' => 'success',
                'message' => $message,
                // 'userBusinessInfo' => $businessData->makeHidden(['created_at','updated_at']),
                // 'userBusinessOwnerInfo' => $tUserBusinessOwnerInfo->makeHidden(['created_at','updated_at']),
                // 'operationHours' => $operationHours,
            ], 200);
        } catch (\Exception $e) {
            \Log::error('Database error: ' . $e->getMessage());
            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // Business info step5 page get data(YourCreedTags)
    public function businessInfoStore5Get(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'owner_id' => 'required|integer|exists:t_business_owner_infos,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }

        try {
            $owner_info = TBusinessOwnerInfo::where('id', $request->owner_id)->first();
            $tUserTBusinessInfoStep5 = TBusiness::select(['id', 'creed_tags_id', 'restaurant_id', 'business_category_id'])->find($owner_info->business_id);

            $data = json_decode($tUserTBusinessInfoStep5, true);
            $data['creed_tags_id'] = json_decode($data['creed_tags_id']);
            $data['restaurant_id'] = json_decode($data['restaurant_id']);

            $tBusinessCategory = TBusinessCategory::where('id', $tUserTBusinessInfoStep5->business_category_id)->first();
            $is_restaurant = 0; // default value

            // Check if the category name is not null and contains the word 'restaurant'
            if ($tBusinessCategory && isset($tBusinessCategory->name)) {
                $categoryName = strtolower(trim($tBusinessCategory->name)); // Convert to lowercase and trim whitespace

                // Match whole word or part of it
                if (preg_match('/restaurant/i', $categoryName)) {
                    $is_restaurant = 1;
                }
            }

            if (!empty($tUserTBusinessInfoStep5)) {
                $tUserTBusinessInfoStep5 = $data;
            }

            $data2 = TAdminAddListingFormManagement::select(['field_name', 'field_status'])
                ->where('field_category', 'Your Creed Tags')
                ->where('status', 1)
                ->get()
                ->toArray();

            // Merge the field status into the owner info data
            foreach ($data2 as $field) {
                // Add status as a new field like 'first_name_status', 'last_name_status', etc.
                if (isset($tUserTBusinessInfoStep5[$field['field_name']])) {
                    $tUserTBusinessInfoStep5[$field['field_name'] . '_status'] = (bool) $field['field_status'];
                }
            }

            // Fetch halal certificate data
            $halalCertificateDatas = THalalCertificateData::where('business_id', $owner_info->business_id)
                ->get(['id', 'certificate_by', 'halal_certificate'])
                ->makeHidden(['created_at', 'updated_at']); // Hide unnecessary fields

            // Create arrays for certificate_by and halal_certificate
            $certificateByArray = [];
            $halalCertificateArray = [];

            foreach ($halalCertificateDatas as $certificateData) {
                $certificateByArray[] = $certificateData->certificate_by; // Collect all certificate_by texts
                $halalCertificateArray[] = $certificateData->halal_certificate; // Collect all halal_certificate image paths
            }

            $tUserTBusinessInfoStep5['certificate'] = $halalCertificateDatas;

            return response()->json([
                'status' => 'success',
                'business_info_step_5' => TAdminNote::where('status', 1)->get()->pluck('business_info_step_5')->first(),
                'owner_info' => $owner_info,
                'is_restaurant' => $is_restaurant,
                'data' => $tUserTBusinessInfoStep5, // Now includes certificate_by and halal_certificate arrays
            ], 200);
        } catch (\Exception $e) {

            \Log::error('Database error: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // Business info store step 5 (YourCreedTags)
    public function businessInfoStore5(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'owner_id' => 'required|integer|exists:t_business_owner_infos,id',
            'creed_tags_id' => 'required',
            'restaurant_id' => 'nullable',
            'certificate_by' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }

        try {
            $businessOwnerId = TBusinessOwnerInfo::where('id', $request->owner_id)->where('user_id', $request->user()->id)->where('status', '>=', 5)->get()->first();

               if(empty($businessOwnerId->id)){
                   $message = "Please first fillup business information step 4.";
                   return response()->json([
                       'status' => 'failed',
                       'message' => $message
                   ],500);
               }

            $businessData = TBusiness::find($businessOwnerId->business_id);

            $businessData->creed_tags_id = json_encode($request->creed_tags_id);
            if ($request->restaurant_id != '') {
                $businessData->restaurant_id = json_encode($request->restaurant_id);
            } else {
                $businessData->restaurant_id = NULL;
            }
            if ($businessOwnerId->status < 6) {
                $businessData->status = 6;
            }
            $businessData->save();
            // Handle halal certificate data
            foreach ($request->certificates ?? [] as $index => $certData) {
                $image = $certData['halal_certificate'] ?? null; 
                
                // Handle file upload
                if ($image instanceof \Illuminate\Http\UploadedFile) {
                    $imageName = time() . $index . '_' . $image->getClientOriginalName();
                    $image->move(public_path('images/business/halal_certificate'), $imageName); 
                    $path = 'images/business/halal_certificate/' . $imageName;
                } else {
                    $path = $image ?? THalalCertificateData::where('id', $certData['id'])->value('halal_certificate'); 
                }

                // Avoid passing null as ID to updateOrCreate
                $match = $certData['id'] ? ['id' => $certData['id']] : ['certificate_by' => $certData['certificate_by']];

                if($certData['certificate_by']!=''){
                    $certificatesData [] = THalalCertificateData::updateOrCreate(
                        $match,
                        [
                            'business_id' => $businessOwnerId->business_id,
                            'certificate_by' => $certData['certificate_by'],
                            'halal_certificate' => $path,
                        ]
                    );
                }    
            }

            $tUserBusinessOwnerInfo = TBusinessOwnerInfo::find($businessOwnerId->id);
            if ($businessOwnerId->status < 6) {
                $tUserBusinessOwnerInfo->status = 6;
            }
            $tUserBusinessOwnerInfo->save();

            $message = "Business creed tags saved successfully.";
            return response()->json([
                'status' => 'success',
                'message' => $message,
            ], 200);
        } catch (\Exception $e) {
            \Log::error('Database error: ' . $e->getMessage());
            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // Business info step5 page get data(CreedExclusivePromo)
    public function businessInfoStore6Get(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'owner_id' => 'required|integer|exists:t_business_owner_infos,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }

        try {

            $owner_info = TBusinessOwnerInfo::where('id', $request->owner_id)->get()->first();
            $tUserTBusinessInfoStep6 = TBusiness::select(['id', 'discount_code_description', 'discount_code'])->find($owner_info->business_id);

            if (!empty($tUserTBusinessInfoStep6)) {
                $tUserTBusinessInfoStep6 = $tUserTBusinessInfoStep6;
            }

            $data2 = TAdminAddListingFormManagement::select(['field_name', 'field_status'])
                ->where('field_category', 'Creed Exclusinve Promo')
                ->where('status', 1)
                ->get()
                ->toArray();

            // Merge the field status into the owner info data
            foreach ($data2 as $field) {
                // Add status as a new field like 'first_name_status', 'last_name_status', etc.
                if (isset($tUserTBusinessInfoStep6[$field['field_name']])) {
                    $tUserTBusinessInfoStep6[$field['field_name'] . '_status'] = (bool) $field['field_status'];
                }
            }

            return response()->json([
                'status' => 'success',
                'business_info_step_6' => TAdminNote::where('status', 1)->get()->pluck('business_info_step_6')->first(),
                'owner_info'    => $owner_info,
                'data' => $tUserTBusinessInfoStep6,
                'STRIPE_SECRET_KEY' => env('APP_URL') . '/api/business-info/stripe-price-table', //env('STRIPE_SECRET_KEY'),
                'STRIPE_PUBLISHABLE_KEY' => env('STRIPE_PUBLISHABLE_KEY'),
                'stripe_price_table' => env('APP_URL') . '/api/business-info/stripe-price-table'
            ], 200);
        } catch (\Exception $e) {

            \Log::error('Database error: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // Business info store step 6
    public function businessInfoStore6(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'owner_id' => 'required|integer|exists:t_business_owner_infos,id',
            'discount_code_description' => 'nullable',
            'discount_code' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }

        try {

            $businessOwnerId = TBusinessOwnerInfo::where('id', $request->owner_id)->where('user_id', $request->user()->id)->where('status', '>=', 6)->get()->first();

               if(empty($businessOwnerId->id)){
                   $message = "Please first fillup business information step 5.";
                   return response()->json([
                       'status' => 'failed',
                       'message' => $message
                   ],500);
               }

            $businessData = TBusiness::find($businessOwnerId->business_id);
            $businessData->discount_code_description = $request->discount_code_description;
            $businessData->discount_code = $request->discount_code;
            if ($businessOwnerId->status < 7) {
                $businessData->status = 7;
            }
            $businessData->save();

            $tUserBusinessOwnerInfo = TBusinessOwnerInfo::find($businessOwnerId->id);
            if ($businessOwnerId->status < 7) {
                $tUserBusinessOwnerInfo->status = 7;
            }
            $tUserBusinessOwnerInfo->save();

            $message = "Creed exclusive promo saved successfully.";
            return response()->json([
                'status' => 'success',
                'message' => $message,
                // 'userBusinessInfo' => $businessData->makeHidden(['created_at','updated_at']),
                // 'userBusinessOwnerInfo' => $tUserBusinessOwnerInfo->makeHidden(['created_at','updated_at']),
                'STRIPE_SECRET_KEY' => env('APP_URL') . '/api/business-info/stripe-price-table', //env('STRIPE_SECRET_KEY'),
                'STRIPE_PUBLISHABLE_KEY' => env('STRIPE_PUBLISHABLE_KEY'),
                'stripe_price_table' => env('APP_URL') . '/api/business-info/stripe-price-table'
            ], 200);
        } catch (\Exception $e) {
            \Log::error('Database error: ' . $e->getMessage());
            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // Stripe-price-table-page
    public function stripePriceTable()
    {
        return view('admin.stripe.price_table');
    }

    // Payment success handler
    public function paymentSuccess(Request $request)
    {
        // Extract session_id or other data from the request
        $sessionId = $request->query('session_id');

        $check = TPayment::where('business_id', $request->business_id)->get()->first();

        // Optional: Verify the session using Stripe API
        if ($sessionId) {
            $stripe = new \Stripe\StripeClient(env('STRIPE_SECRET_KEY'));

            try {
                $session = $stripe->checkout->sessions->retrieve($sessionId);

                // Extract payment details
                $paymentDetails = [
                    'business_id' => $request->business_id,
                    'session_id' => $session->id,
                    'invoice_id' => $session->invoice,
                    'customer_id' => $session->customer,
                    'customer_email' => $session->customer_email,
                    'payable_amount' => $session->amount_subtotal / 100,
                    'paid_amount' => $session->amount_total / 100,
                    'currency' => $session->currency,
                    'billing_address' => json_encode($session->customer_details),
                    'payment_status' => $session->payment_status,
                    'payment_method_types' => $session->payment_method_types[0],
                    'discounts' => json_encode($session->discounts),
                    'total_details' => json_encode($session->total_details),
                    'mode' => $session->mode,
                    'subscription_id' => $session->subscription,
                    'status' => 1,
                ];

                // Save payment details to database
                if ($session->payment_status == 'paid') {
                    // added subscription start date and expired date
                    $currentDate = Carbon::now();
                    $oneYearLater = Carbon::now()->addYear();
                    $currentDateFormatted = $currentDate->toDateTimeString();
                    $oneYearLaterFormatted = $oneYearLater->toDateTimeString();
                    $paymentDetails['subscription_start_date'] = $currentDateFormatted;
                    $paymentDetails['subscription_expired_date'] = $oneYearLaterFormatted;

                    TPayment::create($paymentDetails);

                    $paymentID = TPayment::where('business_id', $request->business_id)->orderBy('id', 'DESC')->pluck('id')->first();

                    $tBusiness = TBusiness::find($request->business_id);
                    $tBusiness->payment_id = $paymentID;
                    $tBusiness->status = 8;
                    $tBusiness->approval_status = 1;
                    $tBusiness->onboard_status = 1;
                    $tBusiness->save();

                    $tOwnerInfo = TBusinessOwnerInfo::find($tBusiness->business_owner_id);
                    $tOwnerInfo->status = 8;
                    $tOwnerInfo->save();

                    $tDashboard_todo = TDashboardTodoList::find(1);
                    $tDashboard_todo->checkbox_status = 1;
                    $tDashboard_todo->save();
                } else {
                    $paymentDetails['status'] = 0;
                    TPayment::create($paymentDetails);
                }

                return response()->json([
                    'status' => 'success',
                    'message' => 'Payment successful',
                    'paymentDetails' => $paymentDetails,
                ], 201);
            } catch (\Exception $e) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Error verifying payment',
                    'error' => $e->getMessage(),
                ], 500);
            }
        }

        return response()->json(['message' => 'Session ID not provided'], 400);
    }

    // Payment cancel handler
    public function paymentCancel(Request $request)
    {

        return response()->json([
            'message' => 'Payment canceled by the user',
        ], 200);
    }

    // business type, category, subcategory, affiliations, creedtags, restaurant, business-name list.
    public function allDropDown()
    {

        $type = TBusinessType::where('status', 1)->get()->makeHidden(['created_by', 'updated_by', 'created_at', 'updated_at']);
        $category = TBusinessCategory::where('status', 1)->get()->makeHidden(['created_by', 'updated_by', 'created_at', 'updated_at']);
        $subcategory = TBusinessSubCategory::where('status', 1)->get()->makeHidden(['created_by', 'updated_by', 'created_at', 'updated_at']);
        $businessTags = TBusinessTags::where('status', 1)->get()->makeHidden(['created_by', 'updated_by', 'created_at', 'updated_at']);
        $creedTags = TCreedTags::ordered()->where('status', 1)->get()->makeHidden(['created_by', 'updated_by', 'created_at', 'updated_at']);
        $affiliation = TAdminAffiliation::where('status', 1)->get()->makeHidden(['created_by', 'updated_by', 'created_at', 'updated_at']);
        $restaurant = TAdminRestaurant::where('status', 1)->get()->makeHidden(['created_by', 'updated_by', 'created_at', 'updated_at']);
        $business_list = TBusiness::select(['id', 'business_name'])->where('status', 8)->where('onboard_status', 1)->get(); //->makeHidden(['created_by', 'updated_by', 'created_at', 'updated_at']);

        // Create an array to store categories with their associated subcategories in the desired format
        $categoriesWithSubcategories = $category->map(function ($cat) use ($subcategory) {
            // Find subcategories that belong to the current category and transform them to only include id and name
            $cat->subcategories = $subcategory->where('category_id', $cat->id)->values()->map(function ($subcat) {
                return [
                    'id' => $subcat->id,
                    'name' => $subcat->name,
                ];
            });

            // Return the transformed category with its subcategories
            return [
                'id' => $cat->id,
                'name' => $cat->name,
                'subcategories' => $cat->subcategories,
            ];
        });

        $data =  [
            'type' => $type,
            'category' => $categoriesWithSubcategories,
            // 'subcategory' => $subcategory,
            'creedTags' => $creedTags,
            'affiliation' => $affiliation,
            'restaurant' => $restaurant,
            'business_list' => $business_list,
        ];

        return response()->json(['status' => 'success', 'data' => $data,], 200);
    }

    // get dependency subcategory by category
    public function getSubCategoryByCategory(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'category_id' => 'required|integer|exists:t_business_categories,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }

        try {
            $data = TBusinessSubCategory::select(['id', 'name'])->where('category_id', $request->category_id)->where('status', 1)->get();

            return response()->json(['status' => 'success', 'count' => $data->count(), 'data' => $data], 200);
        } catch (\Exception $e) {

            \Log::error('Database error: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    public function businessType()
    {

        $data = TBusinessType::where('status', 1)->get()->makeHidden(['created_by', 'updated_by', 'created_at', 'updated_at']);

        return response()->json(['status' => 'success', 'count' => $data->count(), 'data' => $data], 200);
    }

    public function businessCategory()
    {

        $data = TBusinessCategory::where('status', 1)->get()->makeHidden(['created_by', 'updated_by', 'created_at', 'updated_at']);

        return response()->json(['status' => 'success', 'count' => $data->count(), 'data' => $data], 200);
    }

    public function businessSubCategory()
    {

        $data = TBusinessSubCategory::where('status', 1)->get()->makeHidden(['created_by', 'updated_by', 'created_at', 'updated_at']);

        return response()->json(['status' => 'success', 'count' => $data->count(), 'data' => $data], 200);
    }

    public function businessTags()
    {

        $data = TBusinessTags::where('status', 1)->get()->makeHidden(['created_by', 'updated_by', 'created_at', 'updated_at']);

        return response()->json(['status' => 'success', 'count' => $data->count(), 'data' => $data], 200);
    }

    public function creedTags()
    {

        $data = TCreedTags::ordered()->where('status', 1)->get()->makeHidden(['created_by', 'updated_by', 'created_at', 'updated_at']);

        return response()->json(['status' => 'success', 'count' => $data->count(), 'data' => $data], 200);
    }

    public function affiliationList()
    {

        $data = TAdminAffiliation::where('status', 1)->get()->makeHidden(['created_by', 'updated_by', 'created_at', 'updated_at']);

        return response()->json(['status' => 'success', 'count' => $data->count(), 'data' => $data], 200);
    }

    public function restaurantDataList()
    {

        $data = TAdminRestaurant::where('status', 1)->get()->makeHidden(['created_by', 'updated_by', 'created_at', 'updated_at']);

        return response()->json(['status' => 'success', 'count' => $data->count(), 'data' => $data], 200);
    }

    public function countryList()
    {

        $data = TAdminCountry::select(['id', 'name'])->get();

        return response()->json(['status' => 'success', 'count' => $data->count(), 'data' => $data], 200);
    }

    public function stateList(Request $request)
    {

        if ($request->country_id != 'null') {
            $data = TAdminState::select(['id', 'name', 'country_id'])->where('country_id', $request->country_id)->get();
        } else {
            $data = TAdminState::select(['id', 'name', 'country_id'])->get();
        }

        return response()->json(['status' => 'success', 'count' => $data->count(), 'data' => $data], 200);
    }

    public function cityList(Request $request)
    {

        if ($request->state_id != 'null') {
            $data = TAdminCity::select(['id', 'name', 'state_id', 'country_id'])->where('state_id', $request->state_id)->get();
        } else {
            $data = TAdminCity::select(['id', 'name', 'state_id', 'country_id'])->get();
        }

        return response()->json(['status' => 'success', 'count' => $data->count(), 'data' => $data], 200);
    }

    public function daysList()
    {

        $data = TDays::where('status', 1)->get()->makeHidden(['created_at', 'updated_at']);

        return response()->json(['status' => 'success', 'data' => $data,], 200);
    }

    // Get nearby business by latitude and longitude on landing page 
    public function getNearByBusiness(Request $request)
    {

        $latitude = $request->input('lat');
        $longitude = $request->input('long');
        $perm = $request->input('perm');
        $radius = (100 * 1.60934); // Radius in kilometers (100 miles to kilometers)

        if ($perm == 0) {
            $latitude = '41.850033';         //'40.12150192260742';
            $longitude = '-87.6500523';      //'-100.45039367675781';
            $data = TBusiness::with('operationData:id,business_id,day,open_time,closed_time', 'ratings', 'galleryData:id,business_id,business_gallery_image')->select(
                'id',
                'business_name',
                'business_profile_image',
                'business_type_id',
                'business_category_id',
                'business_subcategory_id',
                'creed_tags_id',
                'address',
                'country',
                'state',
                'city',
                'zip_code',
                'lat',
                'long',
                'business_phone_number',
                'business_email',
                'business_website',
                'affiliation_id',
                // DB::raw('`long` AS longitude'),
                DB::raw("(6371 * acos(cos(radians($latitude)) * cos(radians(lat)) * cos(radians(`long`) - radians($longitude)) + sin(radians($latitude)) * sin(radians(lat)))) AS distance")
            )
                // ->having('distance', '<=', $radius)
                ->where('status', 8)
                ->where('onboard_status', 1)
                ->whereHas('paymentInfo', function ($query) {
                    $query->where('subscription_expired_date', '>',  now());
                })
                ->where('deleted_at', NULL)
                ->orderBy('distance', 'asc')

                ->get()

                ->makeHidden(['business_type_id', 'business_category_id', 'business_subcategory_id', 'creed_tags_id', 'affiliation_id', 'country', 'state', 'city', 'created_at', 'updated_at', 'deleted_at', 'ratings']);

            $data = $data->map(function ($business) {

                $business->business_type_name = $business->businessTypeName ?? '';
                $business->business_category_name = $business->businessCategory->name ?? '';
                $business->business_subcategory_name = $business->businessSubCategoryNames ?? '';
                $business->business_creed_name = $business->creedTagsName ?? '';
                $business->affiliation_name = $business->affiliationName ?? '';
                $business->country_name = $business->countryName->name ?? '';
                $business->state_name = $business->stateName->name ?? '';
                $business->city_name = $business->cityName->name ?? '';
                $business->average_rating = round((float) $business->averageRating(), 2) ?? '';
                $business->rating_count = TBusinessRating::where('business_id', $business->id)->where('status', 1)->count('id');

                unset($business->businessCategory);
                unset($business->businessSubCategory);
                unset($business->countryName);
                unset($business->stateName);
                unset($business->cityName);
                return $business;
            });

            return response()->json(['status' => 'success', 'data' => $data], 200);
        }

        // Haversine formula to calculate distance between two points
        $data = TBusiness::with('operationData:id,business_id,day,open_time,closed_time', 'ratings', 'galleryData:id,business_id,business_gallery_image')->select(
            'id',
            'business_name',
            'business_profile_image',
            'business_type_id',
            'business_category_id',
            'business_subcategory_id',
            'creed_tags_id',
            'address',
            'country',
            'state',
            'city',
            'zip_code',
            'lat',
            'long',
            'business_phone_number',
            'business_email',
            'business_website',
            'affiliation_id',
            // DB::raw('`long` AS longitude'),
            DB::raw("(6371 * acos(cos(radians($latitude)) * cos(radians(lat)) * cos(radians(`long`) - radians($longitude)) + sin(radians($latitude)) * sin(radians(lat)))) AS distance")
        )
            // ->having('distance', '<=', $radius)
            //->where('status','>=', 4)
            ->where('status', 8)
            ->where('onboard_status', 1)
            ->whereHas('paymentInfo', function ($query) {
                $query->where('subscription_expired_date', '>',  now());
            })
            ->where('deleted_at', NULL)
            ->orderBy('distance', 'asc')
            ->get()

            ->makeHidden(['business_type_id', 'business_category_id', 'business_subcategory_id', 'creed_tags_id', 'affiliation_id', 'country', 'state', 'city', 'created_at', 'updated_at', 'deleted_at', 'ratings']);

        $data = $data->map(function ($business) {

            $business->business_type_name = $business->businessTypeName ?? '';
            $business->business_category_name = $business->businessCategory->name ?? '';
            $business->business_subcategory_name = $business->businessSubCategoryNames ?? '';
            $business->business_creed_name = $business->creedTagsName ?? '';
            $business->affiliation_name = $business->affiliationName ?? '';
            $business->country_name = $business->countryName->name ?? '';
            $business->state_name = $business->stateName->name ?? '';
            $business->city_name = $business->cityName->name ?? '';
            $business->average_rating = round((float) $business->averageRating(), 2) ?? '';
            $business->rating_count = TBusinessRating::where('business_id', $business->id)->where('status', 1)->count('id');
            // $business->average_rating = number_format($business->average_rating, 2, '.', '');

            unset($business->businessCategory);
            unset($business->businessSubCategory);
            unset($business->countryName);
            unset($business->stateName);
            unset($business->cityName);
            return $business;
        });

        return response()->json(['status' => 'success', 'data' => $data], 200);
    }

    // Business Single Profile
    public function getBusinessProfile(Request $request)
    {

        $userId = $request->user_id;
        $id = $request->id;

        $business_profile = TBusiness::with(['businessOwnerInfos', 'operationData:id,business_id,day,open_time,closed_time', 'ratings:id,user_id,business_id,rating_star,description,image,created_at', 'ratings.user:id,name,first_name,last_name,avatar', 'galleryData:id,business_id,business_gallery_image', 'halalCertificateData:id,business_id,certificate_by,halal_certificate'])->select([
            'id',
            'business_name',
            'business_profile_image',
            'business_type_id',
            'business_category_id',
            'business_subcategory_id',
            'creed_tags_id',
            'address',
            'country',
            'state',
            'city',
            'zip_code',
            'lat',
            'long',
            'service_area',
            'business_phone_number',
            'business_email',
            'business_website',
            'affiliation_id',
            'customer_hotline',
            'customer_email_leads',
            'description',
            'restaurant_id',
            'discount_code_description',
            'discount_code',
            'facebook_link',
            'instagram_link',
            'twitter_link',
            'tiktok_link',
            'tiktok_link',
            'onboard_status',
            'is_active',
            'status'
        ])

            ->where('id', $request->id)

            ->get()

            ->makeHidden(['business_type_id', 'business_category_id', 'creed_tags_id', 'affiliation_id', 'country', 'state', 'city', 'created_at', 'updated_at', 'deleted_at']);


        $business_profile = $business_profile->map(function ($business)  use ($id,$userId) {

            $business['save_business'] = 0;
            if ($userId) {
                $saveBusiness = TSaveBusiness::where('user_id', $userId)
                    ->where('business_id', $business->id)
                    ->first();

                $business['save_business'] = $saveBusiness ? 1 : 0;
            }

            $business['owner'] = false;
            if ($userId) {
                $businessInfo = TBusiness::where('id', $id)->first();
                $businessOwner = TBusinessOwnerInfo::where('id', $businessInfo->business_owner_id)->first();
                if ($businessOwner && $businessOwner->user_id == $userId) {
                    $business['owner'] = true;
                }else {
                    $business['owner'] = false;
                }
            }

            $business->business_type_name = $business->businessTypeName ?? '';
            $business->business_category_name = $business->businessCategory->name ?? '';
            $business->business_subcategory_name = $business->businessSubCategoryNames ?? '';
            $business->business_creed_name = $business->creedTagsName ?? '';
            $business->restaurant_id = $business->RestaurantName ?? '';
            $business->affiliation_name = $business->affiliationName ?? '';
            $business->country_name = $business->countryName->name ?? '';
            $business->state_name = $business->stateName->name ?? '';
            $business->city_name = $business->cityName->name ?? '';
            $business->average_rating = round((float) $business->averageRating(), 2) ?? '';
            $business->rating_count = TBusinessRating::where('business_id', $business->id)->where('status', 1)->count('id');
            $business->ratings = $business->ratings->map(function ($rating) {
                $rating->image = json_decode($rating->image, true) ?? []; // Decode the image field into an array
                $rating->created_time = \Carbon\Carbon::parse($rating->created_at)->diffForHumans();

                return $rating;
            });
            // each star count and make percentage start
            $totalRatings = TBusinessRating::where('business_id', $business->id)->where('status', 1)->count();
            $eachRatingsPercentage = TBusinessRating::select(DB::raw('rating_star, COUNT(*) as count'))->where('business_id', $business->id)->where('status', 1)->groupBy('rating_star')->pluck('count', 'rating_star'); // [5 => 20, 4 => 10, ...]
            $star_percentages = [];
            foreach (range(5, 1) as $star) {
                $count = $eachRatingsPercentage[$star] ?? 0;
                $star_percentages[$star] = $totalRatings > 0 ? round(($count / $totalRatings) * 100, 2) : 0;
            }
            $business->each_star_percentages = $star_percentages;
            // end
            unset($business->businessCategory);
            unset($business->businessSubCategory);
            unset($business->countryName);
            unset($business->stateName);
            unset($business->cityName);
            return $business;
        });

        return response()->json(['status' => 'success', 'message' => 'Business profile data showing success.', 'data' => $business_profile,], 200);
    }

    // search box
    public function searchBox()
    {
        $businessName = TBusiness::select('id', 'business_name')->where('status', '>=', 7)->get();
        // $businessCatSUbCat =TBusinessCategory::with('subcategories:id,name,category_id')->select(['id','name'])->where('status', 1)->get();
        $category = TBusinessCategory::select('id', 'name')->where('status', 1)->get();
        $subcategory = TBusinessSubcategory::select('id', 'name', 'category_id')->where('status', 1)->get();
        $data['category'] = $category;
        $data['subcategory'] = $subcategory;
        $data['businessName'] = $businessName;

        return response()->json(['success' => 'success', 'data' => $data]);
    }

    // search with search box
    public function searchBySearchBox(Request $request)
    {
        $validated = $request->validate([
            'lat' => 'required|string',
            'long' => 'required|string',
            'catSubCat' => 'nullable|string',
            'business_name' => 'nullable|string',
            'text_search' => 'nullable|string',
        ]);

        if ($request->business_name != null) {

            $latitude = $validated['lat'];
            $longitude = $validated['long'];
            $business_name = $validated['business_name'];
            $radius = (100 * 1.60934); // Radius in kilometers (100 miles to kilometers)
            // Convert degrees to radians for calculations
            $filterBusinesses = TBusiness::with(['businessOwnerInfos', 'businessCategory:id,name', 'businessSubCategory:id,name', 'galleryData:id,business_id,business_gallery_image', 'operationData:id,business_id,day,open_time,closed_time', 'ratings'])->select(
                'id',
                'business_name',
                'business_profile_image',
                'business_type_id',
                'business_category_id',
                'business_subcategory_id',
                'creed_tags_id',
                'address',
                'country',
                'state',
                'city',
                'zip_code',
                'lat',
                'long',
                'business_phone_number',
                'business_email',
                'business_website',
                'affiliation_id',
                DB::raw('`long` AS longitude'),
                DB::raw("(
                        6371 * acos(
                            cos(radians($latitude)) *
                            cos(radians(lat)) *
                            cos(radians(`long`) - radians($longitude)) +
                            sin(radians($latitude)) *
                            sin(radians(lat))
                        )
                    ) AS distance")
            )
                ->where('business_name', $business_name)
                // ->having('distance', '<=', $radius)
                ->where('status', 8)
                ->where('onboard_status', 1)
                ->whereHas('paymentInfo', function ($query) {
                    $query->where('subscription_expired_date', '>',  now());
                })
                ->where('deleted_at', NULL)
                ->orderBy('distance', 'asc')
                ->get()
                ->makeHidden(['business_type_id', 'business_category_id', 'business_subcategory_id', 'creed_tags_id', 'affiliation_id', 'country', 'state', 'city', 'created_at', 'updated_at', 'deleted_at', 'ratings']);

            $filterBusinesses = $filterBusinesses->map(function ($business) {

                $business->business_type_name = $business->businessTypeName ?? '';
                $business->business_category_name = $business->businessCategory->name ?? '';
                $business->business_subcategory_name = $business->businessSubCategoryNames ?? '';
                $business->business_creed_name = $business->creedTagsName ?? '';
                $business->affiliation_name = $business->affiliationName ?? '';
                $business->country_name = $business->countryName->name ?? '';
                $business->state_name = $business->stateName->name ?? '';
                $business->city_name = $business->cityName->name ?? '';
                $business->average_rating = round((float) $business->averageRating(), 2) ?? '';

                unset($business->businessCategory);
                unset($business->businessSubCategory);
                unset($business->countryName);
                unset($business->stateName);
                unset($business->cityName);
                return $business;
            });

            return response()->json(['success' => 'success', 'data' => $filterBusinesses]);
        } elseif ($request->text_search != null) {

            $latitude = $validated['lat'];
            $longitude = $validated['long'];
            $text_search = $validated['text_search'];
            $firstThree = substr($text_search, 0, 3); // Get first 3 letters
            $radius = (100 * 1.60934); // Radius in kilometers (100 miles to kilometers)
            // Convert degrees to radians for calculations
            $filterBusinesses = TBusiness::with(['businessOwnerInfos', 'businessCategory:id,name', 'businessSubCategory:id,name', 'galleryData:id,business_id,business_gallery_image', 'operationData:id,business_id,day,open_time,closed_time', 'ratings'])->select(
                'id',
                'business_name',
                'business_profile_image',
                'business_type_id',
                'business_category_id',
                'business_subcategory_id',
                'creed_tags_id',
                'address',
                'country',
                'state',
                'city',
                'zip_code',
                'lat',
                'long',
                'business_phone_number',
                'business_email',
                'business_website',
                'affiliation_id',
                DB::raw('`long` AS longitude'),
                DB::raw("(
                        6371 * acos(
                            cos(radians($latitude)) *
                            cos(radians(lat)) *
                            cos(radians(`long`) - radians($longitude)) +
                            sin(radians($latitude)) *
                            sin(radians(lat))
                        )
                    ) AS distance")
            )

                // ->having('distance', '<=', $radius)
                ->where('status', 8)
                ->where(function ($query) use ($text_search) {
                    $query->where('business_name', 'LIKE', "%{$text_search}%")
                        ->orWhereHas('businessCategory', function ($catQuery) use ($text_search) {
                            $catQuery->where('name', 'LIKE', "%{$text_search}%")
                                ->orWhereHas('keywords', function ($kwQuery) use ($text_search) {
                                    $kwQuery->where('name', 'LIKE', "%{$text_search}%");
                                });
                        })
                        ->orWhereHas('businessSubCategory', function ($subQuery) use ($text_search) {
                            $subQuery->where('name', 'LIKE', "%{$text_search}%");
                        });
                })
                ->where('onboard_status', 1)
                ->whereHas('paymentInfo', function ($query) {
                    $query->where('subscription_expired_date', '>',  now());
                })


                ->where('deleted_at', NULL)

                ->orderBy('distance', 'asc')
                ->get()
                ->makeHidden(['business_type_id', 'business_category_id', 'business_subcategory_id', 'creed_tags_id', 'affiliation_id', 'country', 'state', 'city', 'created_at', 'updated_at', 'deleted_at', 'ratings']);

            if ($filterBusinesses->isNotEmpty()) {
                $filterBusinesses = $filterBusinesses->map(function ($business) {

                    $business->business_type_name = $business->businessTypeName ?? '';
                    $business->business_category_name = $business->businessCategory->name ?? '';
                    $business->business_subcategory_name = $business->businessSubCategoryNames ?? '';
                    $business->business_creed_name = $business->creedTagsName ?? '';
                    $business->affiliation_name = $business->affiliationName ?? '';
                    $business->country_name = $business->countryName->name ?? '';
                    $business->state_name = $business->stateName->name ?? '';
                    $business->city_name = $business->cityName->name ?? '';
                    $business->average_rating = round((float) $business->averageRating(), 2) ?? '';

                    unset($business->businessCategory);
                    unset($business->businessSubCategory);
                    unset($business->countryName);
                    unset($business->stateName);
                    unset($business->cityName);
                    return $business;
                });

                return response()->json(['success' => 'success', 'message' => 'Data Found Success', 'data' => $filterBusinesses]);
            } else {
                $filterBusinesses = [];
                return response()->json(['success' => 'success', 'message' => 'Data Not Found', 'data' => $filterBusinesses]);
            }
        } elseif ($request->catSubCat != null) {

            $latitude = $validated['lat'];
            $longitude = $validated['long'];
            $catSubCat = $validated['catSubCat'];
            $radius = (100 * 1.60934); // Radius in kilometers (100 miles to kilometers)
            // Convert degrees to radians for calculations
            $filterBusinesses = TBusiness::with(['businessOwnerInfos', 'businessCategory:id,name', 'businessSubCategory:id,name', 'galleryData:id,business_id,business_gallery_image', 'operationData:id,business_id,day,open_time,closed_time', 'ratings'])->select(
                'id',
                'business_name',
                'business_profile_image',
                'business_type_id',
                'business_category_id',
                'business_subcategory_id',
                'creed_tags_id',
                'address',
                'country',
                'state',
                'city',
                'zip_code',
                'lat',
                'long',
                'business_phone_number',
                'business_email',
                'business_website',
                'affiliation_id',
                DB::raw('`long` AS longitude'),
                DB::raw("(
                        6371 * acos(
                            cos(radians($latitude)) *
                            cos(radians(lat)) *
                            cos(radians(`long`) - radians($longitude)) +
                            sin(radians($latitude)) *
                            sin(radians(lat))
                        )
                    ) AS distance")
            )

                ->where('status', 8)
                ->where(function ($query) use ($catSubCat) {
                    $query->whereHas('businessCategory', function ($q) use ($catSubCat) {
                        $q->where('name', 'LIKE', "%{$catSubCat}%");
                    })->orWhereHas('businessSubCategory', function ($q) use ($catSubCat) {
                        $q->where('name', 'LIKE', "%{$catSubCat}%");
                    });
                })
                ->where('onboard_status', 1)
                ->whereHas('paymentInfo', function ($query) {
                    $query->where('subscription_expired_date', '>',  now());
                })

                // ->having('distance', '<=', $radius)
                ->where('deleted_at', NULL)

                ->orderBy('distance', 'asc')
                ->get()

                ->makeHidden(['business_type_id', 'business_category_id', 'business_subcategory_id', 'creed_tags_id', 'affiliation_id', 'country', 'state', 'city', 'created_at', 'updated_at', 'deleted_at', 'ratings']);

            $filterBusinesses = $filterBusinesses->map(function ($business) {

                $business->business_type_name = $business->businessTypeName ?? '';
                $business->business_category_name = $business->businessCategory->name ?? '';
                $business->business_subcategory_name = $business->businessSubCategoryNames ?? '';
                $business->business_creed_name = $business->creedTagsName ?? '';
                $business->affiliation_name = $business->affiliationName ?? '';
                $business->country_name = $business->countryName->name ?? '';
                $business->state_name = $business->stateName->name ?? '';
                $business->city_name = $business->cityName->name ?? '';
                $business->average_rating = round((float) $business->averageRating(), 2) ?? '';

                unset($business->businessCategory);
                unset($business->businessSubCategory);
                unset($business->countryName);
                unset($business->stateName);
                unset($business->cityName);
                return $business;
            });

            if ($filterBusinesses) {
                return response()->json(['success' => 'success', 'message' => 'Data Found Success', 'data' => $filterBusinesses]);
            } else {
                $filterBusinesses = [];
                return response()->json(['success' => 'success', 'message' => 'Data Not Found', 'data' => $filterBusinesses]);
            }
        }
    }

    // Filter page
    public function filterScreen(Request $request)
    {

        $validated = $request->validate([
            'lat' => 'nullable|string',
            'long' => 'nullable|string',
            'business_name' => 'nullable|string',
            'text_search' => 'nullable|string',
        ]);

        if($request->input('lat') && $request->input('long')){
            $latitude = $request->lat;
            $longitude = $request->long;
        }else{
            $latitude = '41.850033';     
            $longitude = '-87.6500523'; 
        }
        
        $radius = (100 * 1.60934); // Radius in kilometers (100 miles to kilometers)

        if($request->timezone){
            $timezone = $request->input('timezone', 'UTC');
            $currentDay = Carbon::now($timezone)->format('D');
            $currentTime = Carbon::now($timezone)->format('h:i A'); // Current time in HH:mm:ss format
        }else{
            $currentDay = Carbon::now()->format('D');
            $currentTime = Carbon::now()->format('h:i A'); // Current time in HH:mm:ss format
        }
        $customDay = $request->custom_day;
        $customTime = $request->custom_time;

        // Fetch filtered data
        $query = TBusiness::with(['businessOwnerInfos', 'businessCategory:id,name', 'galleryData:id,business_id,business_gallery_image', 'operationData:id,business_id,day,open_time,closed_time', 'ratings'])->select(
            'id',
            'business_name',
            'business_profile_image',
            'business_type_id',
            'business_category_id',
            'business_subcategory_id',
            'creed_tags_id',
            'address',
            'country',
            'state',
            'city',
            'zip_code',
            'lat',
            'long',
            'business_phone_number',
            'business_email',
            'business_website',
            'affiliation_id',
            DB::raw("(
                    6371 * acos(
                        cos(radians($latitude)) *
                        cos(radians(lat)) *
                        cos(radians(`long`) - radians($longitude)) +
                        sin(radians($latitude)) *
                        sin(radians(lat))
                    )
                ) AS distance")
        )

            // ->having('distance', '<=', $radius)
            ->where('status', 8)
            ->where('onboard_status', 1)
            ->whereHas('paymentInfo', function ($query) {
                $query->where('subscription_expired_date', '>',  now());
            })
            ->where('deleted_at', NULL)
            ->orderBy('distance', 'asc');


        // Filter by creed_tags_id (if provided)
        if ($request->has('creed_tags_id')) {
            $creedTags = $request->input('creed_tags_id'); // Expected as an array
            $query->where(function ($q) use ($creedTags) {
                foreach ($creedTags as $tag) {
                    $q->orWhereJsonContains('creed_tags_id', $tag);
                }
            });
        }


        // Filter by restaurant_id (if provided)
        if ($request->has('restaurant_id')) {
            $restaurantIds = $request->input('restaurant_id'); // Expected as an array
            $query->where(function ($q) use ($restaurantIds) {
                foreach ($restaurantIds as $id) {
                    $q->orWhereJsonContains('restaurant_id', $id);
                }
            });
        }

        // Filter by creed_category_id (if provided)
        if ($request->has('category_id') && $request->category_id != 0) {
            $categoryId = $request->input('category_id');
            $query->where('business_category_id', $categoryId);
        }


        // Filter by creed_subCategory_id (if provided)
        if ($request->has('subCategory_id')) {
            $subCategory = $request->input('subCategory_id'); // Expected as an array
            $query->where(function ($q) use ($subCategory) {
                foreach ($subCategory as $subCategoryId) {
                    $q->orWhereJsonContains('business_subcategory_id', $subCategoryId);
                }
            });
        }

        // Filter by ratings (if provided)
        if ($request->has('ratings')) {
            $ratings = (array) $request->input('ratings');

            if (count($ratings) > 1) {
                return response()->json([
                    'message' => 'Please select only one rating.'
                ], 422);
            }

            $query->whereHas('ratings', function ($q) use ($ratings) {
                $q->select(DB::raw('AVG(rating_star)'))
                ->where('status', 1)
                ->whereNull('deleted_at')
                ->groupBy('business_id')
                ->havingRaw('AVG(rating_star) >= ?', [$ratings]);
            });
        }

        // Filter by open_now(if provided)
        if ($request->open_now === 'true') {
            $query->whereHas('operationData', function ($q) use ($currentDay, $currentTime) {
                $q->where('day', $currentDay)
                ->whereRaw("STR_TO_DATE(open_time, '%h:%i %p') <= STR_TO_DATE(?, '%h:%i %p')", [$currentTime])
                ->whereRaw("STR_TO_DATE(closed_time, '%h:%i %p') >= STR_TO_DATE(?, '%h:%i %p')", [$currentTime])
                ->where('status', 1)
                ->whereNull('deleted_at');
            });
        }

        // Filter by custom day and time(if provided)
        if ($request->has('custom_day') && $request->has('custom_time') && $request->custom_time!="Anytime") {
            $query->whereHas('operationData', function ($q) use ($customDay, $customTime) {
                $q->where('day', $customDay)
                    ->where(function ($subQ) use ($customTime) {
                        $subQ->whereRaw("STR_TO_DATE(open_time, '%h:%i %p') = STR_TO_DATE(?, '%h:%i %p')", [$customTime]);
                            // ->orWhereRaw("STR_TO_DATE(closed_time, '%h:%i %p') >= STR_TO_DATE(?, '%h:%i %p')", [$customTime]);
                    });
            });
        }

        // Filter by custom day(if provided)
        if ($request->has('custom_day') && $request->custom_time=="Anytime") {
            $customDay = $request->input('custom_day'); 

            $query->whereHas('operationData', function ($q) use ($customDay) {
                $q->where('day', $customDay);
            });
        }

        // Filter by business-name(if provided)
        if ($request->has('business_name')) {
            $businessName = $request->input('business_name');
            $query->where('business_name', 'LIKE', "%{$businessName}%");
        }

        // Filter by search text(if provided)
        if ($request->filled('text_search')) {
            $text_search = trim($request->input('text_search'));

            // Find exact subcategory matches
            $matchingSubIds = \App\Models\Admin\TBusinessSubCategory::where('name', $text_search)
                ->pluck('id')
                ->map(fn($id) => (string) $id)
                ->toArray();

            // Clone original query to test for exact matches without altering the main one
            $exactMatchQuery = clone $query;

            $exactMatchQuery->where(function ($query) use ($text_search, $matchingSubIds) {
                $query->where('business_name', $text_search)
                    //->orWhereHas('businessCategory', fn($q) => $q->where('name', $text_search));
                    ->orWhereHas('businessCategory', function ($q) use ($text_search) {
                            $q->where('name', $text_search)
                            ->orWhereHas('keywords', fn($k) => $k->where('name', $text_search)); // match keywords
                        });
                if (!empty($matchingSubIds)) {
                    $query->orWhere(function ($q) use ($matchingSubIds) {
                        foreach ($matchingSubIds as $subId) {
                            $q->orWhereJsonContains('business_subcategory_id', $subId);
                        }
                    });
                }
            });

            // If no exact match found, fallback to partial match
            if (!$exactMatchQuery->exists()) {
                $query->where('business_name', 'LIKE', "%{$text_search}%");
            } else {
                // Apply the exact match condition to the main query
                $query->where(function ($query) use ($text_search, $matchingSubIds) {
                    $query->where('business_name', $text_search)
                        // ->orWhereHas('businessCategory', fn($q) => $q->where('name', $text_search));
                        ->orWhereHas('businessCategory', function ($q) use ($text_search) {
                            $q->where('name', $text_search)
                            ->orWhereHas('keywords', fn($k) => $k->where('name', $text_search)); // match keywords
                        });
                    if (!empty($matchingSubIds)) {
                        $query->orWhere(function ($q) use ($matchingSubIds) {
                            foreach ($matchingSubIds as $subId) {
                                $q->orWhereJsonContains('business_subcategory_id', $subId);
                            }
                        });
                    }
                });
            }
        }

        // Execute the query
        $businesses = $query->get()->makeHidden(['business_type_id', 'business_category_id', 'business_subcategory_id', 'creed_tags_id', 'affiliation_id', 'country', 'state', 'city', 'ratings', 'created_at', 'updated_at', 'deleted_at']);
        // Process results (map additional data)
        $businesses = $businesses->map(function ($business) {
            $business->business_type_name = $business->businessTypeName ?? '';
            $business->business_category_name = $business->businessCategory->name ?? '';
            $business->business_subcategory_name = $business->businessSubCategoryNames ?? '';
            $business->business_creed_name = $business->creedTagsName ?? '';
            $business->affiliation_name = $business->affiliationName ?? '';
            $business->country_name = $business->countryName->name ?? '';
            $business->state_name = $business->stateName->name ?? '';
            $business->city_name = $business->cityName->name ?? '';
            $business->average_rating = round((float) $business->averageRating(), 2) ?? '';
            $business->rating_count = TBusinessRating::where('business_id', $business->id)->where('status', 1)->where('deleted_at', NULL)->count('id') ?? 0;

            unset($business->businessCategory);
            unset($business->businessSubCategory);
            unset($business->countryName);
            unset($business->stateName);
            unset($business->cityName);
            return $business;
        });

        return response()->json([
            'status' => 'success',
            'message' => 'Filtered business info retrieved',
            'data' => $businesses,
        ]);
    }

    // public function getMultiBusinessList(Request $request)
    // {

    //     $validator = Validator::make($request->all(), [
    //         'lat' => 'required|string',
    //         'long' => 'required|string',
    //     ]);

    //     if ($validator->fails()) {
    //         return response()->json([
    //             'status' => 'error',
    //             'message' => $validator->errors()->first(),
    //             'errors' => $validator->errors(),
    //         ], 422);
    //     }

    //     $latitude = $request->lat;
    //     $longitude = $request->long;
    //     $radius = (100 * 1.60934); // Radius in kilometers (100 miles to kilometers)

    //     // Convert degrees to radians for calculations
    //     $multiBusinesses = TBusiness::with('operationData:id,business_id,day,open_time,closed_time', 'ratings', 'galleryData:id,business_id,business_gallery_image')->select(
    //         'id',
    //         'business_name',
    //         'business_profile_image',
    //         'business_type_id',
    //         'business_category_id',
    //         'business_subcategory_id',
    //         'creed_tags_id',
    //         'address',
    //         'zip_code',
    //         'lat',
    //         'long',
    //         'business_phone_number',
    //         'business_email',
    //         'business_website',
    //         'affiliation_id',
    //         DB::raw("(
    //                 6371 * acos(
    //                     cos(radians($latitude)) *
    //                     cos(radians(lat)) *
    //                     cos(radians(`long`) - radians($longitude)) +
    //                     sin(radians($latitude)) *
    //                     sin(radians(lat))
    //                 )
    //             ) AS distance")
    //     )
    //         // ->having('distance', '<=', $radius)
    //         ->orderBy('distance', 'asc')
    //         ->get()

    //         ->makeHidden(['business_type_id', 'business_category_id', 'business_subcategory_id', 'creed_tags_id', 'affiliation_id', 'country', 'state', 'city', 'ratings', 'created_at', 'updated_at', 'deleted_at']);

    //     $multiBusinesses = $multiBusinesses->map(function ($business) {

    //         $business->business_type_name = $business->businessTypeName ?? '';
    //         $business->business_category_name = $business->businessCategory->name ?? '';
    //         $business->business_subcategory_name = $business->businessSubCategoryNames ?? '';
    //         $business->business_creed_name = $business->creedTagsName ?? '';
    //         $business->affiliation_name = $business->affiliationName ?? '';
    //         $business->country_name = $business->countryName->name ?? '';
    //         $business->state_name = $business->stateName->name ?? '';
    //         $business->city_name = $business->cityName->name ?? '';
    //         $business->average_rating = round((float) $business->averageRating(), 2) ?? '';

    //         unset($business->businessCategory);
    //         unset($business->businessSubCategory);
    //         unset($business->countryName);
    //         unset($business->stateName);
    //         unset($business->cityName);
    //         return $business;
    //     });

    //     return response()->json(['success' => 'success', 'data' => $multiBusinesses]);
    // }

    // All User List
    // public function userList()
    // {
    //     $data = User::get();
    //     return response()->json(['status' => 'success', 'data' => $data,], 200);
    // }

    // Subscription plan list
    public function pricingPlanList()
    {

        $data = TAdminPricingPlan::select(['id', 'type_name', 'pricing', 'plan_duration', 'key_tag', 'feature_title', 'feature_status'])->where('status', 1)->get()
            ->map(function ($item) {
                // Decode the JSON strings into actual arrays
                $item->feature_title = json_decode($item->feature_title, true);
                $item->feature_status = json_decode($item->feature_status, true);

                return $item;
            });

        return response()->json(['status' => 'success', 'data' => $data], 200);
    }

    // Business Filter using Creed Tags
    // public function searchByCreedTags(Request $request)
    // {

    //     $validated = $request->validate([
    //         'lat' => 'required|string',
    //         'long' => 'required|string',
    //         // 'creed_id' => 'required',
    //     ]);

    //     $latitude = $validated['lat'];
    //     $longitude = $validated['long'];
    //     $creed_id = $request->creed_id;

    //     $radius = (100 * 1.60934); // Radius in kilometers (100 miles to kilometers)

    //     if ($creed_id) {
    //         // Convert degrees to radians for calculations
    //         $filterBusinesses = TBusiness::with(['businessOwnerInfos', 'businessCategory:id,name', 'businessSubCategory:id,name', 'galleryData:id,business_id,business_gallery_image', 'operationData:id,business_id,day,open_time,closed_time', 'ratings'])->select(
    //             'id',
    //             'business_name',
    //             'business_profile_image',
    //             'business_type_id',
    //             'business_category_id',
    //             'business_subcategory_id',
    //             'creed_tags_id',
    //             'address',
    //             'country',
    //             'state',
    //             'city',
    //             'zip_code',
    //             'lat',
    //             'long',
    //             'business_phone_number',
    //             'business_email',
    //             'business_website',
    //             'affiliation_id',
    //             // DB::raw('`long` AS longitude'),90.4128379
    //             DB::raw("(
    //                     6371 * acos(
    //                         cos(radians($latitude)) *
    //                         cos(radians(lat)) *
    //                         cos(radians(`long`) - radians($longitude)) +
    //                         sin(radians($latitude)) *
    //                         sin(radians(lat))
    //                     )
    //                 ) AS distance")
    //         )

    //             ->where(function ($query) use ($creed_id) {
    //                 foreach ($creed_id as $id) {
    //                     $query->orWhereJsonContains('creed_tags_id', $id);
    //                 }
    //             })
    //             // ->having('distance', '<=', $radius)
    //             ->where('status', 8)
    //             ->where('onboard_status', 1)
    //             ->whereHas('paymentInfo', function ($query) {
    //                 $query->where('subscription_expired_date', '>',  now());
    //             })
    //             ->where('deleted_at', NULL)
    //             ->orderBy('distance', 'asc')
    //             ->get()

    //             ->makeHidden(['business_type_id', 'business_category_id', 'business_subcategory_id', 'creed_tags_id', 'affiliation_id', 'country', 'state', 'city', 'ratings', 'created_at', 'updated_at', 'deleted_at']);

    //         $filterBusinesses = $filterBusinesses->map(function ($business) {

    //             $business->business_type_name = $business->businessTypeName ?? '';
    //             $business->business_category_name = $business->businessCategory->name ?? '';
    //             $business->business_subcategory_name = $business->businessSubCategoryNames ?? '';
    //             $business->business_creed_name = $business->creedTagsName ?? '';
    //             $business->affiliation_name = $business->affiliationName ?? '';
    //             $business->country_name = $business->countryName->name ?? '';
    //             $business->state_name = $business->stateName->name ?? '';
    //             $business->city_name = $business->cityName->name ?? '';
    //             $business->average_rating = round((float) $business->averageRating(), 2) ?? '';

    //             unset($business->businessCategory);
    //             unset($business->businessSubCategory);
    //             unset($business->countryName);
    //             unset($business->stateName);
    //             unset($business->cityName);
    //             return $business;
    //         });
    //     } else {
    //         // Convert degrees to radians for calculations
    //         $filterBusinesses = TBusiness::with(['businessOwnerInfos', 'businessCategory:id,name', 'businessSubCategory:id,name', 'galleryData:id,business_id,business_gallery_image', 'operationData:id,business_id,day,open_time,closed_time', 'ratings'])->select(
    //             'id',
    //             'business_name',
    //             'business_profile_image',
    //             'business_type_id',
    //             'business_category_id',
    //             'business_subcategory_id',
    //             'creed_tags_id',
    //             'address',
    //             'country',
    //             'state',
    //             'city',
    //             'zip_code',
    //             'lat',
    //             'long',
    //             'business_phone_number',
    //             'business_email',
    //             'business_website',
    //             'affiliation_id',
    //             // DB::raw('`long` AS longitude'),90.4128379
    //             DB::raw("(
    //                     6371 * acos(
    //                         cos(radians($latitude)) *
    //                         cos(radians(lat)) *
    //                         cos(radians(`long`) - radians($longitude)) +
    //                         sin(radians($latitude)) *
    //                         sin(radians(lat))
    //                     )
    //                 ) AS distance")
    //         )
    //             // ->having('distance', '<=', $radius)
    //             ->where('status', 8)
    //             ->where('onboard_status', 1)
    //             ->whereHas('paymentInfo', function ($query) {
    //                 $query->where('subscription_expired_date', '>',  now());
    //             })
    //             ->where('deleted_at', NULL)
    //             ->orderBy('distance', 'asc')
    //             ->get()

    //             ->makeHidden(['business_type_id', 'business_category_id', 'business_subcategory_id', 'creed_tags_id', 'affiliation_id', 'country', 'state', 'city', 'ratings', 'created_at', 'updated_at', 'deleted_at']);

    //         $filterBusinesses = $filterBusinesses->map(function ($business) {

    //             $business->business_type_name = $business->businessTypeName ?? '';
    //             $business->business_category_name = $business->businessCategory->name ?? '';
    //             $business->business_subcategory_name = $business->businessSubCategoryNames ?? '';
    //             $business->business_creed_name = $business->creedTagsName ?? '';
    //             $business->affiliation_name = $business->affiliationName ?? '';
    //             $business->country_name = $business->countryName->name ?? '';
    //             $business->state_name = $business->stateName->name ?? '';
    //             $business->city_name = $business->cityName->name ?? '';
    //             $business->average_rating = round((float) $business->averageRating(), 2) ?? '';

    //             unset($business->businessCategory);
    //             unset($business->businessSubCategory);
    //             unset($business->countryName);
    //             unset($business->stateName);
    //             unset($business->cityName);
    //             return $business;
    //         });
    //     }

    //     return response()->json(['success' => 'success', 'count' => $filterBusinesses->count(), 'data' => $filterBusinesses]);
    // }

    // Business Filter using Business Category,SubCategory text
    // public function searchByBusinessCatSubCategory(Request $request)
    // {

    //     $validated = $request->validate([
    //         'lat' => 'required|string',
    //         'long' => 'required|string',
    //         'catSubCat' => 'required|string',
    //     ]);

    //     $latitude = $validated['lat'];
    //     $longitude = $validated['long'];
    //     $catSubCat = $validated['catSubCat'];
    //     $radius = (100 * 1.60934); // Radius in kilometers (100 miles to kilometers)

    //     // Convert degrees to radians for calculations
    //     $filterBusinesses = TBusiness::with([
    //         'businessOwnerInfos',
    //         'businessCategory:id,name',
    //         'businessSubCategory:id,name',
    //         'galleryData:id,business_id,business_gallery_image',
    //         'operationData:id,business_id,day,open_time,closed_time',
    //         'ratings'
    //     ])
    //         ->select(
    //             'id',
    //             'business_name',
    //             'business_profile_image',
    //             'business_type_id',
    //             'business_category_id',
    //             'business_subcategory_id',
    //             'creed_tags_id',
    //             'address',
    //             'country',
    //             'state',
    //             'city',
    //             'zip_code',
    //             'lat',
    //             'long',
    //             'business_phone_number',
    //             'business_email',
    //             'business_website',
    //             'affiliation_id',
    //             DB::raw('`long` AS longitude'),
    //             DB::raw("(
    //             6371 * acos(
    //                 cos(radians($latitude)) *
    //                 cos(radians(lat)) *
    //                 cos(radians(`long`) - radians($longitude)) +
    //                 sin(radians($latitude)) *
    //                 sin(radians(lat))
    //             )
    //         ) AS distance")
    //         )
    //         ->where(function ($query) use ($catSubCat) {
    //             $query->whereHas('businessCategory', function ($q) use ($catSubCat) {
    //                 $q->where('name', $catSubCat);
    //             })->orWhereHas('businessSubCategory', function ($q) use ($catSubCat) {
    //                 $q->where('name', $catSubCat);
    //             });
    //         })
    //         ->where('status', 8)
    //         ->where('onboard_status', 1)
    //         ->whereHas('paymentInfo', function ($query) {
    //             $query->where('subscription_expired_date', '>', now());
    //         })
    //         ->whereNull('deleted_at')

    //         ->orderBy('distance', 'asc')
    //         ->get()
    //         ->makeHidden([
    //             'business_type_id',
    //             'business_category_id',
    //             'business_subcategory_id',
    //             'creed_tags_id',
    //             'affiliation_id',
    //             'country',
    //             'state',
    //             'city',
    //             'ratings',
    //             'created_at',
    //             'updated_at',
    //             'deleted_at'
    //         ]);



    //     $filterBusinesses = $filterBusinesses->map(function ($business) {

    //         $business->business_type_name = $business->businessTypeName ?? '';
    //         $business->business_category_name = $business->businessCategory->name ?? '';
    //         $business->business_subcategory_name = $business->businessSubCategoryNames ?? '';
    //         $business->business_creed_name = $business->creedTagsName ?? '';
    //         $business->affiliation_name = $business->affiliationName ?? '';
    //         $business->country_name = $business->countryName->name ?? '';
    //         $business->state_name = $business->stateName->name ?? '';
    //         $business->city_name = $business->cityName->name ?? '';
    //         $business->average_rating = round((float) $business->averageRating(), 2) ?? '';

    //         unset($business->businessCategory);
    //         unset($business->businessSubCategory);
    //         unset($business->countryName);
    //         unset($business->stateName);
    //         unset($business->cityName);
    //         return $business;
    //     });

    //     return response()->json(['success' => 'success', 'data' => $filterBusinesses]);
    // }

    // get category relations
    // public function getCategoryRelation()
    // {

    //     $data = TBusinessCategory::with(['businesses', 'subcategories'])->get();

    //     return response()->json(['success' => 'success', 'data' => $data]);
    // }

    // get subcategory relations
    // public function getSubCategoryRelation()
    // {

    //     $data = TBusinessSubCategory::with(['businesses', 'category'])->get();

    //     return response()->json(['success' => 'success', 'data' => $data]);
    // }

    // aboutUs
    public function aboutUs()
    {
        $data = TAboutUs::select(['individual_title', 'business_title', 'individual_description', 'business_description', 'individual_tab_description', 'business_tab_description'])->where('status', 1)->get()->first();
        // $data['individual_description'] = json_decode($data->individual_description, true);
        $data['individual_description'] = preg_replace("/\r\n|\r|\t|\n/", '', $data->individual_description);
        $data['business_description'] = ""; //json_decode($data->business_description);
        $data['individual_tab_description'] = preg_replace("/\r\n|\r|\t|\n/", '', $data->individual_tab_description); //json_decode($data->individual_tab_description);
        $data['business_tab_description'] = preg_replace("/\r\n|\r|\t|\n/", '', $data->business_tab_description); //json_decode($data->business_tab_description);

        return response()->json(['success' => 'success', 'data' => $data]);
    }

    // appTermsAndConditions
    public function appTermsAndConditions()
    {
        $data = TAppTermsAndConditions::select(['page_1_heading', 'page_2_title', 'page_2_heading', 'page_2_description'])->where('status', 1)->get()->first();
        $data['page_1_heading'] = json_decode($data->page_1_heading);

        return response()->json(['success' => 'success', 'data' => $data]);
    }

    // privacyPolicy
    public function getPrivacyPolicy()
    {
        $data = TAdminPrivacyPolicy::select(['description'])->where('status', 1)->latest()->get()->first();
        $data['description'] = preg_replace("/\r\n|\r|\t|\n/", '', $data->description ?? '');

        return response()->json(['success' => 'success', 'data' => $data]);
    }

    // save business list for user wise
    public function saveBusinessList(Request $request)
    {
        $userId = $request->user()->id;
        $business_id = $request->business_id;

        $saveList = TSaveBusiness::where('user_id', $userId)->get();

        if (count($saveList) != 0) {

            if ($saveList->contains('business_id',  $business_id)) {

                $saveList = TSaveBusiness::where('user_id', $userId)->where('business_id', $business_id)->get()->first();
                $saveList = TSaveBusiness::find($saveList->id);
                $saveList->forceDelete();

                $data = [
                    'userId' => $userId,
                    'business_id' => $business_id
                ];

                return response()->json(['success' => 'success', 'message' => 'This Business unsaved for this user successful.', 'data' => $data]);
            } else {

                $saveList = new TSaveBusiness();
                $saveList->user_id = $request->user()->id;
                $saveList->business_id = $business_id;
                $saveList->save();
            }
        } else {
            $saveList = new TSaveBusiness();
            $saveList->user_id = $request->user()->id;
            $saveList->business_id = $business_id;
            $saveList->save();
        }

        $data = [
            'userId' => $userId,
            'business_id' => $business_id
        ];

        return response()->json(['success' => 'success', 'message' => 'Save business list successful.', 'data' => $data]);
    }

    // show saved business list for user wise
    public function saveBusinessListShow(Request $request)
    {

        $businessList = TSaveBusiness::where('user_id', $request->user()->id)->get();
        $businessDetails = [];

        if ($businessList) {
            foreach ($businessList as $value) {

                $data = \App\Models\Api\TBusiness::with('operationData:id,business_id,day,open_time,closed_time', 'ratings', 'galleryData:id,business_id,business_gallery_image')->where('id', $value->business_id)->get()
                    ->makeHidden(['business_type_id', 'business_category_id', 'business_subcategory_id', 'creed_tags_id', 'affiliation_id', 'country', 'state', 'city']);

                $data = $data->map(function ($business) {

                    $business->business_type_name = $business->businessTypeName ?? '';
                    $business->business_category_name = $business->businessCategory->name ?? '';
                    $business->business_subcategory_name = $business->businessSubCategoryNames ?? '';
                    $business->business_creed_name = $business->creedTagsName ?? '';
                    $business->affiliation_name = $business->affiliationName ?? '';
                    $business->country_name = $business->countryName->name ?? '';
                    $business->state_name = $business->stateName->name ?? '';
                    $business->city_name = $business->cityName->name ?? '';
                    $business->average_rating = round((float) $business->averageRating(), 2) ?? '';
                    $business->rating_count = TBusinessRating::where('business_id', $business->id)->where('status', 1)->count('id');

                    unset($business->businessCategory);
                    unset($business->businessSubCategory);
                    unset($business->countryName);
                    unset($business->stateName);
                    unset($business->cityName);
                    return $business;
                });

                $businessDetails[] = $data;
            }
        }

        $data = [
            'businessList' => $businessDetails,
        ];

        return response()->json(['success' => 'success', 'message' => 'Business save list.', 'data' => $data]);
    }

    // Business Rating store
    public function businessRating(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'business_id' => 'required|exists:t_businesses,id',
            'rating_star' => 'required|integer|min:1|max:5',
            'description' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            $errors = collect($validator->errors()->toArray())->map(fn($messages) => $messages[0]);
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
                'errors' => $errors,
            ], 422);
        }

        $findBusinessUserId =  TBusiness::find($request->business_id)->businessOwnerInfos['0']->user_id;

        if ($findBusinessUserId == auth()->id()) {
            return response()->json(['status' => 'failed', 'message' => 'You can not review your own business.'], 400);
        } else {

            $imagePath = [];

            if ($request->file('image')) {
                foreach ($request->file('image') as $key => $images) {
                    // $file = $request->file('image');
                    $ratingImage = ++$key . time() . '.' . $images->getClientOriginalExtension();
                    $images->move(public_path('images/business/rating'), $ratingImage);
                    $imagePath[] = 'images/business/rating/' . $ratingImage;
                }
            }

            $ratingData = TBusinessRating::where('user_id', auth()->id())->where('business_id', $request->business_id)->where('status', 1)->get()->first();

            if ($ratingData) {
                $rating = TBusinessRating::find($ratingData->id);
                $rating->status = 0;
                $rating->save();

                $previousImages = json_decode($ratingData->image, true) ?? [];
                $mergedImages = array_merge($previousImages, $imagePath);

                $rating = new TBusinessRating();
                $rating->user_id = auth()->id();
                $rating->business_id = $request->business_id;
                $rating->rating_star = $request->rating_star;
                $rating->description = $request->description;
                $rating->image = json_encode($mergedImages);
                $rating->status = 1;
                $rating->save();
            } else {
                $rating = new TBusinessRating();
                $rating->user_id = auth()->id();
                $rating->business_id = $request->business_id;
                $rating->rating_star = $request->rating_star;
                $rating->description = $request->description;
                $rating->image = json_encode($imagePath) ?? 'null';
                $rating->status = 1;
                $rating->save();
            }

            $business_profile = TBusiness::with(['businessOwnerInfos', 'operationData:id,business_id,day,open_time,closed_time', 'ratings', 'ratings.user:id,name,first_name,last_name,avatar', 'galleryData:id,business_id,business_gallery_image'])->select([
                'id',
                'business_name',
                'business_profile_image',
                'business_type_id',
                'business_category_id',
                'business_subcategory_id',
                'creed_tags_id',
                'address',
                'country',
                'state',
                'city',
                'zip_code',
                'lat',
                'long',
                'service_area',
                'business_phone_number',
                'business_email',
                'business_website',
                'affiliation_id',
                'customer_hotline',
                'customer_email_leads',
                'description',
                'restaurant_id',
                'halal_certificate',
                'handcut_text',
                'handcut_certificate',
                'discount_code_description',
                'discount_code',
                'status'
            ])

                ->where('id', $request->business_id)

                ->get()

                ->makeHidden(['business_type_id', 'business_category_id', 'business_subcategory_id', 'creed_tags_id', 'affiliation_id', 'country', 'state', 'city', 'created_at', 'updated_at', 'deleted_at']);


            $business_profile = $business_profile->map(function ($business) {

                $business->business_type_name = $business->businessTypeName ?? '';
                $business->business_category_name = $business->businessCategory->name ?? '';
                $business->business_subcategory_name = $business->businessSubCategoryNames ?? '';
                $business->business_creed_name = $business->creedTagsName ?? '';
                $business->restaurant_id = $business->RestaurantName ?? '';
                $business->affiliation_name = $business->affiliationName ?? '';
                $business->country_name = $business->countryName->name ?? '';
                $business->state_name = $business->stateName->name ?? '';
                $business->city_name = $business->cityName->name ?? '';
                $business->average_rating = round((float)$business->averageRating(), 2) ?? '';
                $business->rating_count = TBusinessRating::where('business_id', $business->id)->count('id');
                $business->ratings = $business->ratings->map(function ($rating) {
                    $rating->image = json_decode($rating->image, true) ?? []; // Decode the image field into an array
                    return $rating;
                });

                // each star count and make percentage start
                $totalRatings = TBusinessRating::where('business_id', $business->id)->where('status', 1)->count();
                $eachRatingsPercentage = TBusinessRating::select(DB::raw('rating_star, COUNT(*) as count'))->where('business_id', $business->id)->where('status', 1)->groupBy('rating_star')->pluck('count', 'rating_star'); // [5 => 20, 4 => 10, ...]
                $star_percentages = [];
                foreach (range(5, 1) as $star) {
                    $count = $eachRatingsPercentage[$star] ?? 0;
                    $star_percentages[$star] = $totalRatings > 0 ? round(($count / $totalRatings) * 100, 2) : 0;
                }
                $business->each_star_percentages = $star_percentages;
                // end

                unset($business->businessCategory);
                unset($business->businessSubCategory);
                unset($business->countryName);
                unset($business->stateName);
                unset($business->cityName);
                return $business;
            });

            return response()->json(['success' => 'success', 'message' => 'Rating submit successful.', 'data' => $business_profile]);
        }
    }

    // Business Rating view
    public function ratingView(Request $request)
    {

        $ratingData = TBusinessRating::select(['user_id', 'business_id', 'rating_star', 'description', 'image', 'status'])->where('user_id', $request->user()->id)->where('business_id', $request->business_id)->where('status', 1)->get()->first();

        $ratingDataCount = TBusiness::withCount('ratings')->findOrFail($request->business_id);
        $ratingData['average_rating'] = $ratingDataCount->averageRating();

        return response()->json(['success' => 'success', 'message' => 'View Rating.', 'Data' => $ratingData]);
    }

    // Business Rating delete
    public function ratingDelete(Request $request)
    {
        $ratingData = TBusinessRating::where('user_id', $request->user()->id)->where('business_id', $request->business_id)->where('status', 1)->get()->first();

        $ratingDeleted = TBusinessRating::find($ratingData->id);
        $ratingDeleted->status = 0;
        $ratingDeleted->delete(); //forceDelete();

        return response()->json(['success' => 'success', 'message' => 'Rating deleted successfully.']);
    }

    public function userDetails(Request $request)
    {

        $flag = $request->status;

        if ($request->business_owner_id != 'null') {

            $user = '';
            $businessOwnerInfo = TBusinessOwnerInfo::with('business', 'business.galleryData', 'business.operationData', 'business.ratings')->find($request->business_owner_id);

            if ($businessOwnerInfo->business && $businessOwnerInfo->business->status != 7 && $flag == 0) {

                $data1 = json_decode($businessOwnerInfo->business, true);
                $data1['business_type_id'] = json_decode($data1['business_type_id']);
                $data1['affiliation_id'] = json_decode($data1['affiliation_id']) == "" ? [] : json_decode($data1['affiliation_id']);
                $data1['creed_tags_id'] = json_decode($data1['creed_tags_id']);
                $data1['restaurant_id'] = json_decode($data1['restaurant_id']);
                $data1['service_area'] = json_decode($data1['service_area']);
                $data1['country'] = $businessOwnerInfo->business->countryName->name ?? '';
                $data1['state'] = $businessOwnerInfo->business->stateName->name ?? '';
                $data1['city'] = $businessOwnerInfo->business->cityName->name ?? '';
                $data1['countryName'] = $businessOwnerInfo->business->countryName->name ?? '';
                $businessOwnerInfo['businessess'] =  $data1;
                unset($businessOwnerInfo->business);
            } elseif ($businessOwnerInfo->business && $flag == 1) {

                $data1 = json_decode($businessOwnerInfo->business, true);
                $data1['business_type_id'] = json_decode($data1['business_type_id']);
                $data1['affiliation_id'] = json_decode($data1['affiliation_id']) == "" ? [] : json_decode($data1['affiliation_id']);
                $data1['creed_tags_id'] = json_decode($data1['creed_tags_id']);
                $data1['restaurant_id'] = json_decode($data1['restaurant_id']);
                $data1['service_area'] = json_decode($data1['service_area']);
                $data1['country'] = $businessOwnerInfo->business->countryName->name ?? '';
                $data1['state'] = $businessOwnerInfo->business->stateName->name ?? '';
                $data1['city'] = $businessOwnerInfo->business->cityName->name ?? '';
                $data1['countryName'] = $businessOwnerInfo->business->countryName->name ?? '';
                $businessOwnerInfo['businessess'] =  $data1;
                unset($businessOwnerInfo->business);
            } elseif ($businessOwnerInfo && $businessOwnerInfo->business == NULL && $flag == 0) {

                $user = '';
                $businessOwnerInfo = TBusinessOwnerInfo::with('business', 'business.galleryData', 'business.operationData', 'business.ratings')->find($request->business_owner_id);
            } elseif ($businessOwnerInfo && $businessOwnerInfo->business != NULL && $businessOwnerInfo->business->status == 7 && $flag == 0) {

                $user = '';
                $businessOwnerInfo = null;
            } else {

                $user = null;
                $businessOwnerInfo = null;
            }
        } else {

            $user = null;
            $businessOwnerInfo = null;
        }

        $data = [
            'user_info' => $user,
            'businessOwnerInfo' => $businessOwnerInfo,
        ];

        $owner_info_page = TAdminNote::select('owner_info_page')->where('status', 1)->get()->first();
        $business_info_step_1 = TAdminNote::select('business_info_step_1')->where('status', 1)->get()->first();
        $business_info_step_2 = TAdminNote::select('business_info_step_2')->where('status', 1)->get()->first();
        $business_info_step_3 = TAdminNote::select('business_info_step_3')->where('status', 1)->get()->first();
        $business_info_step_4 = TAdminNote::select('business_info_step_4')->where('status', 1)->get()->first();
        $business_info_step_5 = TAdminNote::select('business_info_step_5')->where('status', 1)->get()->first();
        $business_info_step_6 = TAdminNote::select('business_info_step_6')->where('status', 1)->get()->first();
        $business_info_step_7 = TAdminNote::select('business_info_step_7')->where('status', 1)->get()->first();

        $owner_info_page_value = $owner_info_page ? $owner_info_page->owner_info_page : null;
        $business_info_step_1_value = $business_info_step_1 ? $business_info_step_1->business_info_step_1 : null;
        $business_info_step_2_value = $business_info_step_2 ? $business_info_step_2->business_info_step_2 : null;
        $business_info_step_3_value = $business_info_step_3 ? $business_info_step_3->business_info_step_3 : null;
        $business_info_step_4_value = $business_info_step_4 ? $business_info_step_4->business_info_step_4 : null;
        $business_info_step_5_value = $business_info_step_5 ? $business_info_step_5->business_info_step_5 : null;
        $business_info_step_6_value = $business_info_step_6 ? $business_info_step_6->business_info_step_6 : null;
        $business_info_step_7_value = $business_info_step_7 ? $business_info_step_7->business_info_step_7 : null;

        // Prepare the data to return
        return response()->json([
            'success' => 'success',
            'message' => 'User details:',
            'owner_info_page' => $owner_info_page_value,
            'business_info_step_1' => $business_info_step_1_value,
            'business_info_step_2' => $business_info_step_2_value,
            'business_info_step_3' => $business_info_step_3_value,
            'business_info_step_4' => $business_info_step_4_value,
            'business_info_step_5' => $business_info_step_5_value,
            'business_info_step_6' => $business_info_step_6_value,
            'business_info_step_7' => $business_info_step_7_value,
            'data' => $data // Ensure $data is defined earlier in your code
        ]);
    }

    // Gallery Image/File Delete
    public function imageDelete(Request $request)
    {
        $business_id = TBusinessOwnerInfo::where('id', $request->owner_id)->get()->pluck('business_id')->first();

        if ($request->business_profile_image != '') {

            $id = TBusiness::where('id', $business_id)->where('business_profile_image', $request->business_profile_image)->get()->pluck('id')->first();
            if ($id) {

                $tBusiness = TBusiness::find($id);
                $tBusiness->business_profile_image = NULL;
                $tBusiness->save();
                $filePath = $request->business_profile_image;
                if (file_exists($filePath)) {
                    if (unlink($filePath)) {
                        return response()->json(['success' => 'success', 'message' => 'Business profile image deleted successfully']);
                    } else {
                        return response()->json(['success' => 'failed', 'message' => 'Failed to delete the Business profile image from the server.']);
                    }
                } else {
                    return response()->json(['success' => 'failed', 'message' => 'Business profile image does not exist.']);
                }
            } else {
                return response()->json(['success' => 'failed', 'message' => 'This Business profile image already empty.']);
            }
        } elseif ($request->business_gallery_image != '') {

            $id = TBusinessGallery::where('business_id', $business_id)->where('business_gallery_image', $request->business_gallery_image)->get()->pluck('id')->first();
            if ($id) {
                $galleryData = TBusinessGallery::find($id);
                $galleryData->delete();

                $filePath = $request->business_gallery_image;

                if (file_exists($filePath)) {
                    if (unlink($filePath)) {
                        return response()->json(['success' => 'success', 'message' => 'Selected image deleted successfully']);
                    } else {
                        return response()->json(['success' => 'failed', 'message' => 'Failed to delete the Selected image from the server.']);
                    }
                } else {
                    return response()->json(['success' => 'failed', 'message' => 'Selected image does not exist.']);
                }
            } else {
                return response()->json(['success' => 'failed', 'message' => 'Selected image already empty.']);
            }
        } elseif ($request->halal_certificate != '') {

            $id = THalalCertificateData::where('business_id', $business_id)->where('halal_certificate', $request->halal_certificate)->get()->pluck('id')->first();
            if ($id) {
                $tBusiness = THalalCertificateData::find($id);
                $tBusiness->delete();
                $filePath = $request->halal_certificate;
                if (file_exists($filePath)) {
                    if (unlink($filePath)) {
                        return response()->json(['success' => 'success', 'message' => 'Selected image deleted successfully']);
                    } else {
                        return response()->json(['success' => 'failed', 'message' => 'Failed to delete Selected image from the server.']);
                    }
                } else {
                    return response()->json(['success' => 'failed', 'message' => 'The Selected image does not exist.']);
                }
            } else {
                return response()->json(['success' => 'failed', 'message' => 'Selected image already empty.']);
            }
        }
    }

    // store dashboard todo list
    public function dashboardTodoListStore(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'account_type'                   => 'required|in:personal,business',
            'todo_lists'                     => 'required|array',
            'todo_lists.*.todo_title'        => 'required|string',
            'todo_lists.*.checkbox_status'   => 'required|boolean',
            'status'                         => 'required|boolean',
        ]);


        if ($validator->fails()) {
            return response()->json(['success' => 'failed', 'message' => $validator->errors()->first()], 422);
        }

        foreach ($request->todo_lists as $todo) {
            $todoList = new TDashboardTodoList();
            $todoList->account_type = $request->account_type;
            $todoList->todo_title = $todo['todo_title'];
            $todoList->checkbox_status = $todo['checkbox_status'];
            $todoList->status = $request->status;
            $todoList->save();
        }

        return response()->json(['success' => 'success', 'message' => 'Todo list added successfully.']);
    }

    // Personal Profile
    public function personalProfile(Request $request)
    {
        $userId = $request->user()->id;
        $users = User::find($userId)->account_type;

        // Define time ranges
        $now = Carbon::now();
        $startOfDay = $now->copy()->startOfDay();
        $startOfWeek = $now->copy()->startOfWeek();
        $startOfMonth = $now->copy()->startOfMonth();
        $startOfYear = $now->copy()->startOfYear();

        $saveList = TSaveBusiness::where('user_id', $userId)->get();
        $reviews = TBusinessrating::where('user_id', $userId)->where('status', 1)->get();

        $countInRange = function ($list, $startTime) {
            return collect($list)->filter(function ($item) use ($startTime) {
                return isset($item['created_at']) && Carbon::parse($item['created_at'])->gte($startTime);
            })->count();
        };

        $businessList = TSaveBusiness::where('user_id', $request->user()->id)->get();
        $businessDetails = [];

        if ($businessList) {
            foreach ($businessList as $value) {

                $data = \App\Models\Api\TBusiness::with('operationData:id,business_id,day,open_time,closed_time', 'ratings', 'galleryData:id,business_id,business_gallery_image')->where('id', $value->business_id)->get()
                    ->makeHidden(['business_type_id', 'business_category_id', 'business_subcategory_id', 'creed_tags_id', 'affiliation_id', 'country', 'state', 'city']);

                $data = $data->map(function ($business) {

                    $business->business_type_name = $business->businessTypeName ?? '';
                    $business->business_category_name = $business->businessCategory->name ?? '';
                    $business->business_subcategory_name = $business->businessSubCategoryNames ?? '';
                    $business->business_creed_name = $business->creedTagsName ?? '';
                    $business->affiliation_name = $business->affiliationName ?? '';
                    $business->country_name = $business->countryName->name ?? '';
                    $business->state_name = $business->stateName->name ?? '';
                    $business->city_name = $business->cityName->name ?? '';
                    $business->average_rating = round((float) $business->averageRating(), 2) ?? '';
                    $business->rating_count = TBusinessRating::where('business_id', $business->id)->where('status', 1)->count('id');

                    unset($business->businessCategory);
                    unset($business->businessSubCategory);
                    unset($business->countryName);
                    unset($business->stateName);
                    unset($business->cityName);
                    return $business;
                });

                $businessDetails[] = $data;
            }
        }

        // Calculate counts for saveList
        $saveListCounts = [
            [
                "day" => "1d",
                "count" => $countInRange($saveList, $startOfDay),
            ],
            [
                "day" => "1w",
                "count" => $countInRange($saveList, $startOfWeek),
            ],
            [
                "day" => "1m",
                "count" => $countInRange($saveList, $startOfMonth),
            ],
            [
                "day" => "1y",
                "count" => $countInRange($saveList, $startOfYear),
            ],
        ];

        // Calculate counts for reviews
        $reviewCounts = [
            [
                "day" => "1d",
                "count" => $countInRange($reviews, $startOfDay),
            ],
            [
                "day" => "1w",
                "count" => $countInRange($reviews, $startOfWeek),
            ],
            [
                "day" => "1m",
                "count" => $countInRange($reviews, $startOfMonth),
            ],
            [
                "day" => "1y",
                "count" => $countInRange($reviews, $startOfYear),
            ],
        ];

        // todo list for personal profile

        $todoLists = TDashboardTodoList::select(['id', 'todo_title', 'checkbox_status'])->where('account_type', 'personal')
            ->get();

        $data = [
            'todo_lists'            => $todoLists,
            'account_type'          => $users,
            'saveList'              => $saveListCounts,
            'reviews'               => $reviewCounts,
            'save_business_list'    => $businessDetails,

        ];

        return response()->json(['success' => 'success', 'message' => 'Personal profile data load:', 'data' => $data]);
    }

    // Business Profile
    public function businessProfile(Request $request)
    {
        $userId = $request->user()->id;
        $ownerInfo = TBusinessOwnerInfo::where('user_id', $userId)->get();
        if ($ownerInfo->count() > 0) {
            $flag = true;
        } else {
            $flag = false;
        }
        $businessList = TBusinessOwnerInfo::where('user_id', $userId)->where('status', 8)->get();
        $incomplete_id = TBusinessOwnerInfo::where('user_id', $userId)->where('status', '!=', 7)->get()->pluck('id')->first();
        // Define time ranges
        $now = Carbon::now();
        $startOfDay = $now->copy()->startOfDay();
        $startOfWeek = $now->copy()->startOfWeek();
        $startOfMonth = $now->copy()->startOfMonth();
        $startOfYear = $now->copy()->startOfYear();

        $creedVisitorList = TCreedVisitor::get();
        if ($businessList->isNOtEmpty()) {
            foreach ($businessList as $value) {
                $businessProfileVisitorList = TBusinessProfileVisitor::where('business_id', $value->business_id ?? '')->get();
            }
        } else {
            $businessProfileVisitorList = Null;
        }

        $countInRange = function ($list, $startTime) {
            return collect($list)->filter(function ($item) use ($startTime) {
                return isset($item['created_at']) && Carbon::parse($item['created_at'])->gte($startTime);
            })->count();
        };

        // $businessList = TBusiness::where('business_owner_id', $businessId)->get();
        $businessDetails = [];

        if ($businessList) {
            foreach ($businessList as $value) {
                if ($value->business_id != NULL) {
                    $data = \App\Models\Api\TBusiness::with('operationData:id,business_id,day,open_time,closed_time', 'ratings', 'galleryData:id,business_id,business_gallery_image')->where('id', $value->business_id)->where('status', 8)->get()
                        ->makeHidden(['business_type_id', 'business_category_id', 'business_subcategory_id', 'creed_tags_id', 'affiliation_id', 'country', 'state', 'city']);

                    $data = $data->map(function ($business) {

                        $business->business_type_name = $business->businessTypeName ?? '';
                        $business->business_category_name = $business->businessCategory->name ?? '';
                        $business->business_subcategory_name = $business->businessSubCategoryNames ?? '';
                        $business->business_creed_name = $business->creedTagsName ?? '';
                        $business->affiliation_name = $business->affiliationName ?? '';
                        $business->country_name = $business->countryName->name ?? '';
                        $business->state_name = $business->stateName->name ?? '';
                        $business->city_name = $business->cityName->name ?? '';
                        $business->average_rating = round((float) $business->averageRating(), 2) ?? '';
                        $business->rating_count = TBusinessRating::where('business_id', $business->id)->where('status', 1)->count('id');

                        unset($business->businessCategory);
                        unset($business->businessSubCategory);
                        unset($business->countryName);
                        unset($business->stateName);
                        unset($business->cityName);
                        return $business;
                    });

                    $businessDetails[] = $data;
                }
            }
        }

        // Calculate counts for creedVisitorList
        $creedVisitorListCounts = [
            [
                "day" => "1d",
                "count" => $countInRange($creedVisitorList, $startOfDay),
            ],
            [
                "day" => "1w",
                "count" => $countInRange($creedVisitorList, $startOfWeek),
            ],
            [
                "day" => "1m",
                "count" => $countInRange($creedVisitorList, $startOfMonth),
            ],
            [
                "day" => "1y",
                "count" => $countInRange($creedVisitorList, $startOfYear),
            ],
        ];

        // Calculate counts for businessProfileVisitorList
        $businessProfileVisitorListCounts = [
            [
                "day" => "1d",
                "count" => $countInRange($businessProfileVisitorList, $startOfDay),
            ],
            [
                "day" => "1w",
                "count" => $countInRange($businessProfileVisitorList, $startOfWeek),
            ],
            [
                "day" => "1m",
                "count" => $countInRange($businessProfileVisitorList, $startOfMonth),
            ],
            [
                "day" => "1y",
                "count" => $countInRange($businessProfileVisitorList, $startOfYear),
            ],
        ];

        // todo list for business profile
        $todoLists = TDashboardTodoList::select(['id', 'todo_title', 'checkbox_status'])->where('account_type', 'business')
            ->get();

        $data = [
            'todo_lists'                        => $todoLists,
            'creedVisitorListCounts'            => $creedVisitorListCounts,
            'businessProfileVisitorListCounts'  => $businessProfileVisitorListCounts,
            'businessList'                      => $businessDetails,
        ];

        return response()->json(['success' => 'success', 'message' => 'Business profile data load:', 'incomplete_id' => $incomplete_id, 'flag' => $flag, 'owner_info' => $ownerInfo->first(), 'data' => $data]);
    }

    // Callme inside Business Details pages
    public function callMe(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [

                'user_id' => 'nullable',
                'name' => 'nullable|string',
                'email' => 'required|email',
                'country_code' => 'nullable|string',
                'phone_number' => 'nullable|string',
            ]);

            if ($validator->fails()) {
                $errors = collect($validator->errors()->toArray())->map(fn($messages) => $messages[0]);
                return response()->json([
                    'status' => 'error',
                    'message' => $errors,
                    'errors' => $errors,
                ], 422);
            }

            $tcallMeData = new TCallMe();
            $tcallMeData->user_id = $request->user_id;
            $tcallMeData->name = $request->name;
            $tcallMeData->email = $request->email;
            $tcallMeData->country_code = $request->country_code;
            $tcallMeData->phone_number = $request->phone_number;
            $tcallMeData->save();

            return response()->json([
                'status' => 'success',
                'message' => 'Call me data successfully saved.',
                'tcallMeData' => $tcallMeData->makeHidden(['status', 'created_at', 'updated_at', 'deleted_at']),
            ], 201);
        } catch (\Exception $e) {

            \Log::error('Database error: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => 'Database error: Unable to submit data!',
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // Quote inside Business Details pages
    public function quote(Request $request)
    {

        try {
            $validator = Validator::make($request->all(), [

                'user_id' => 'nullable',
                'name' => 'nullable|string',
                'email' => 'required|email',
                'country_code' => 'nullable|string',
                'phone_number' => 'nullable|string',
                'address' => 'nullable|string',
                'lat' => 'nullable',
                'long' => 'nullable',
            ]);

            if ($validator->fails()) {
                $errors = collect($validator->errors()->toArray())->map(fn($messages) => $messages[0]);
                return response()->json([
                    'status' => 'error',
                    'message' => $errors,
                    'errors' => $errors,
                ], 422);
            }

            $tQuoteData = new TQuote();
            $tQuoteData->user_id = $request->user_id;
            $tQuoteData->name = $request->name;
            $tQuoteData->email = $request->email;
            $tQuoteData->country_code = $request->country_code;
            $tQuoteData->phone_number = $request->phone_number;
            $tQuoteData->address = $request->address;
            $tQuoteData->lat = $request->lat;
            $tQuoteData->long = $request->long;
            $tQuoteData->save();

            return response()->json([
                'status' => 'success',
                'message' => 'Quote data successfully saved.',
                'tQuoteData' => $tQuoteData->makeHidden(['status', 'created_at', 'updated_at', 'deleted_at']),
            ], 201);
        } catch (\Exception $e) {

            \Log::error('Database error: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => 'Database error: Unable to submit data!',
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // Creed visitor data store
    public function creedVisitorStore(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [

                'device_id' => 'required|string',
                'model_id' => 'nullable|string',
                'brand' => 'nullable|string',
                'ip_address' => 'nullable|string',
                'mac_address' => 'nullable|string',
            ]);

            if ($validator->fails()) {
                $errors = collect($validator->errors()->toArray())->map(fn($messages) => $messages[0]);
                return response()->json([
                    'status' => 'error',
                    'message' => 'Validation failed.',
                    'errors' => $errors,
                ], 422);
            }

            $deviceId = TCreedVisitor::where('device_id', $request->device_id)->get()->first();
            if ($deviceId) {
                $tCreedVisitorData = TCreedVisitor::find($deviceId->id);
            } else {
                $tCreedVisitorData = new TCreedVisitor();
            }
            $tCreedVisitorData->device_id = $request->device_id;
            $tCreedVisitorData->model_id = $request->model_id;
            $tCreedVisitorData->brand = $request->brand;
            $tCreedVisitorData->ip_address = $request->ip_address;
            $tCreedVisitorData->mac_address = $request->mac_address;
            $tCreedVisitorData->status = 1;
            $tCreedVisitorData->save();

            return response()->json([
                'status' => 'success',
                'message' => 'Creed visitor data successfully saved.',
                'tCreedVisitorData' => $tCreedVisitorData->makeHidden(['created_at', 'updated_at']),
            ], 201);
        } catch (\Exception $e) {

            \Log::error('Database error: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => 'Database error: Unable to submit data!',
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // Business profile visitor data store
    public function businessProfileVisitorStore(Request $request)
    {

        try {
            $validator = Validator::make($request->all(), [

                'device_id' => 'required|string',
                'business_id' => 'required',
                'model_id' => 'nullable|string',
                'brand' => 'nullable|string',
                'ip_address' => 'nullable|string',
                'mac_address' => 'nullable|string',
            ]);

            if ($validator->fails()) {
                $errors = collect($validator->errors()->toArray())->map(fn($messages) => $messages[0]);
                return response()->json([
                    'status' => 'error',
                    'message' => 'Validation failed.',
                    'errors' => $errors,
                ], 422);
            }

            $deviceId = TBusinessProfileVisitor::where('device_id', $request->device_id)->where('business_id', $request->business_id)->get()->first();
            if ($deviceId) {
                $tBusinessProfileVisitorData = TBusinessProfileVisitor::find($deviceId->id);
            } else {
                $tBusinessProfileVisitorData = new TBusinessProfileVisitor();
            }

            $tBusinessProfileVisitorData->device_id = $request->device_id;
            $tBusinessProfileVisitorData->business_id = $request->business_id;
            $tBusinessProfileVisitorData->model_id = $request->model_id;
            $tBusinessProfileVisitorData->brand = $request->brand;
            $tBusinessProfileVisitorData->ip_address = $request->ip_address;
            $tBusinessProfileVisitorData->mac_address = $request->mac_address;
            $tBusinessProfileVisitorData->status = 1;
            $tBusinessProfileVisitorData->save();

            return response()->json([
                'status' => 'success',
                'message' => 'Business profile visitor data successfully saved.',
                'tBusinessProfileVisitorData' => $tBusinessProfileVisitorData->makeHidden(['created_at', 'updated_at']),
            ], 201);
        } catch (\Exception $e) {

            \Log::error('Database error: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => 'Database error: Unable to submit data!',
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // checkout text data
    public function checkoutTextData()
    {

        $data = TCheckoutTextData::where('status', 1)->get()->first()->makeHidden(['status', 'created_by', 'updated_by', 'created_at', 'updated_at']);
        $data['list'] = json_decode($data->list);

        return response()->json(['success' => 'success', 'message' => 'Checkout text data:', 'data' => $data]);
    }

    // edit-ptofile
    public function editProfile(Request $request)
    {

        if ($request->all() == []) {
            return response()->json([
                'status' => 'success',
                'user' => $request->user()->makeHidden(['id', 'created_at', 'updated_at', 'deleted_at']),
            ], 200);
        }
        try {
            $validator = Validator::make($request->all(), [
                'user_id' => 'nullable',
                'first_name' => 'nullable|string',
                'last_name' => 'nullable|string',
                'country_short_code' => 'nullable|string',
                'country_code' => 'nullable|string',
                'phone_number' => 'nullable|string',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => 'error',
                    'message' => $validator->errors()->first(),
                    'errors' => $validator->errors(),
                ], 422);
            }

            if ($request->file('avatar')) {

                $file = $request->file('avatar');
                $profile = time() . '.' . $file->getClientOriginalExtension();
                $file->move(public_path('images/customerProfile'), $profile);
                $imagePath = 'images/customerProfile/' . $profile;
            } else {
                $imagePath = User::where('id', $request->user()->id)->get()->pluck('avatar')->first();
            }

            $userId = $request->user()->id;
            $user = User::find($userId);
            $user->first_name = $request->first_name;
            $user->last_name = $request->last_name;
            $user->name = $request->first_name . ' ' . $request->last_name;
            $user->country_short_code = $request->country_short_code;
            $user->country_code = $request->country_code;
            $user->phone_number = $request->phone_number;
            $user->avatar = $imagePath;
            $user->save();

            $tDashboard_todo = TDashboardTodoList::find(5);
            $tDashboard_todo->checkbox_status = 1;
            $tDashboard_todo->save();

            return response()->json([
                'status' => 'success',
                'message' => 'Profile edit successful.',
                'user' => $user->makeHidden(['id', 'created_at', 'updated_at', 'deleted_at']),
            ], 200);
        } catch (\Exception $e) {

            \Log::error('Profile edit failed: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => 'Profile edit failed. Please try again later.',
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // company-info
    public function companyInfo()
    {
        $data = TCompanyInfo::select(['system_name', 'owner_name', 'email', 'phone_number', 'business_identification_no', 'address', 'country_id', 'state_id', 'city_id', 'zip_code', 'lat', 'long', 'logo', 'favicon_icon', 'website_link', 'facebook_id', 'linkedIn_id', 'youtube_link'])->where('status', 1)->first();
        return response()->json(['success' => 'success', 'message' => 'Company info data:', 'data' => $data]);
    }

    // getversion
    public function getVersion()
    {
        $data = TAdminVersion::select('version')->where('status', 1)->first();
        return response()->json(['success' => 'success', 'message' => 'Version data:', 'data' => $data], 200);
    }

    // contact-creed-store
    public function contactCreedDataStore(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'first_name' => 'required|string',
                'last_name' => 'required|string',
                'address' => 'required|string',
                'country_short_code' => 'nullable|string',
                'country_code' => 'nullable|string',
                'phone_number' => 'required|string',
                'email' => 'required|email',
                'description' => 'required|string',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => 'error',
                    'message' => $validator->errors()->first(),
                    'errors' => $validator->errors(),
                ], 422);
            }

            $data = new TContactCreed();
            $data->first_name = $request->first_name;
            $data->last_name = $request->last_name;
            $data->address = $request->address;
            $data->country_short_code = $request->country_short_code;
            $data->country_code = $request->country_code;
            $data->phone_number = $request->phone_number;
            $data->email = $request->email;
            $data->description = $request->description;
            $data->save();

            Mail::send('emails.contact-form', ['data' => $data], function ($message) use ($data) {
                $message->from($data->email, $data->email);
                $message->to('Creedsocialmanager@gmail.com')
                    // $message->to(env('MAIL_FROM_ADDRESS'))
                    ->subject('New Contact Form Submission');
            });

            return response()->json([
                'status' => 'success',
                'message' => 'Submit successful.',
                'data' => $data->makeHidden(['id', 'created_at', 'updated_at', 'deleted_at']),
            ], 200);
        } catch (\Exception $e) {

            \Log::error('Contact CREED failed: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => 'Contact CREED failed. Please try again later.',
                'errors' => $e->getMessage(),
            ], 500);
        }
    }

    // contact-creed-list
    public function getContactCreedList()
    {
        $data = TContactCreed::where('status', 1)->first()->makeHidden(['id', 'status', 'created_at', 'updated_at']);
        return response()->json(['success' => 'success', 'message' => 'Contact Creed list:', 'data' => $data]);
    }

    // getBusinessNote
    public function getBusinessNote()
    {
        $data = TAdminNote::where('status', 1)->get();
        return response()->json(['success' => 'success', 'message' => 'Business note data:', 'data' => $data], 200);
    }

    // delete-user-aacount
    public function deleteUserAccount(Request $request)
    {
        $id = $request->user()->id;
        $users = User::with(['businessOwnerInfos', 'businessOwnerInfos.business', 'businessOwnerInfos.business.galleryData', 'businessOwnerInfos.business.operationData', 'businessOwnerInfos.business.ratings', 'businessOwnerInfos.business.halalCertificateData', 'businessOwnerInfos.business.businessProfileVisitors', 'businessOwnerInfos.business.saveBusinessLists'])->find($id);

        foreach ($users->businessOwnerInfos as $value) {

            $ownerInfo = TBusinessOwnerInfo::with(['business', 'business.galleryData', 'business.operationData', 'business.ratings'])->find($value->id);

            if (!empty($ownerInfo->business)) {
      
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

        $ratings = TBusinessRating::where('user_id', $id)->get();
        if ($ratings->count() > 0) {
            foreach ($ratings as $rating) {
                $rating->status = 0;
                $rating->delete();
            }
        }

        $randomNumber = str_pad(rand(0, 9999), 4, '0', STR_PAD_LEFT);

        $users->update([
            'email' => 'd_'. $randomNumber . '_' . $users->email,
        ]);

        $users->delete();

        return response()->json(['success' => 'success', 'message' => 'Account deleted successful.'], 200);
    }

    // deactive-business
    public function deactiveBusiness(Request $request)
    {
        $id = $request->business_id;
        // $business = TBusinessOwnerInfo::with(['business', 'business.galleryData', 'business.operationData', 'business.ratings'])->find($id);

        // if (!empty($business->business)) {
        //     $business->business->galleryData()->delete();
        //     $business->business->operationData()->delete();
        //     $business->business->ratings()->delete();
        // }

        // $business->business()->delete();

        $business = TBusiness::find($id);

        // checking if business payment expired
        $paymentInfo = TPayment::where('business_id', $business->id)->first();

        if (!empty($paymentInfo)) {
            if ($paymentInfo->subscription_expired_date < Carbon::now()) {
                return response()->json(['success' => 'error', 'message' => 'Subscription Already Expired. Please renew your subscription.', 'expired' => 1], 200);
            }
        }

        if ($business->onboard_status == 1) {
            $business->onboard_status = 0;
        } else {
            $business->onboard_status = 1;
        }
        $business->save();

        // $business->galleryData()->delete();
        // $business->operationData()->delete();
        // $business->ratings()->delete();
        // $business->delete();

        return response()->json(['success' => 'success', 'message' => 'Business status updated successful.', 'expired' => 0], 200);
    }

    // delete-business
    public function deleteBusiness(Request $request)
    {
        $id = $request->business_id;
        $business = TBusiness::find($id);

        if (empty($business)) {
            return response()->json(['success' => 'error', 'message' => 'Already Deleted'], 404);
        }

        $business->businessOwnerInfos()->delete();
        $business->galleryData()->delete();
        $business->operationData()->delete();
        $business->ratings()->delete();
        $business->halalCertificateData()->delete();
        $business->businessProfileVisitors()->delete();
        $business->saveBusinessLists()->delete();
        $business->delete();

        return response()->json(['success' => 'success', 'message' => 'Business Account Delete successful.'], 200);
    }

    // Mosque list pull from google map api and dstore in database table
    // public function mosqueStore(Request $request){
    //     $response = Http::get('https://maps.googleapis.com/maps/api/place/textsearch/json', [
    //         'query' => 'mosque in Canada',
    //         'key'   => env('GOOGLE_MAP_API_KEY'),
    //     ]);

    //     if ($response->successful()) {
    //         $results = $response->json('results');

    //         foreach ($results as $place) {
    //             $placeId = $place['place_id'] ?? null;
    //             if (!$placeId) continue;

    //             // Get detailed data
    //             $detailsResponse = Http::get('https://maps.googleapis.com/maps/api/place/details/json', [
    //                 'place_id' => $placeId,
    //                 'key'      => env('GOOGLE_MAP_API_KEY'),
    //             ]);

    //             if (!$detailsResponse->successful()) continue;

    //             $details = $detailsResponse->json('result');

    //             // ===== Save photo_reference image =====
    //             $photoReferences = $details['photos'] ?? [];
    //             $localPhotoPaths = [];

    //             foreach ($photoReferences as $photo) {
    //                 $photoReference = $photo['photo_reference'] ?? null;

    //                 if ($photoReference) {
    //                     $photoResponse = Http::get('https://maps.googleapis.com/maps/api/place/photo', [
    //                         'maxwidth'        => 800,
    //                         'photo_reference' => $photoReference,
    //                         'key'             => env('GOOGLE_MAP_API_KEY'),
    //                     ]);

    //                     if ($photoResponse->successful()) {
    //                         $imageName = time() . '-' . Str::uuid() . '.jpg';
    //                         $relativePath = 'images/mosques/' . $imageName;
    //                         $fullPath = public_path($relativePath);

    //                         if (!file_exists(dirname($fullPath))) {
    //                             mkdir(dirname($fullPath), 0775, true);
    //                         }

    //                         file_put_contents($fullPath, $photoResponse->body());
    //                         $localPhotoPaths[] = $relativePath;
    //                     }
    //                 }
    //             }

    //             // Convert to JSON for DB
    //             $photosJson = !empty($localPhotoPaths) ? json_encode($localPhotoPaths) : null;

    //             // ===== Save icon image =====
    //             $iconUrl = $details['icon'] ?? null;
    //             $localIconPath = null;

    //             if ($iconUrl) {
    //                 $iconResponse = Http::get($iconUrl);

    //                 if ($iconResponse->successful()) {
    //                     $ext = pathinfo(parse_url($iconUrl, PHP_URL_PATH), PATHINFO_EXTENSION) ?: 'png';
    //                     $iconName = time() . '-' . Str::uuid() . '.' . $ext;
    //                     $relativeIconPath = 'images/mosques/icons/' . $iconName;
    //                     $fullIconPath = public_path($relativeIconPath);

    //                     if (!file_exists(dirname($fullIconPath))) {
    //                         mkdir(dirname($fullIconPath), 0775, true);
    //                     }

    //                     file_put_contents($fullIconPath, $iconResponse->body());
    //                     $localIconPath = $relativeIconPath;
    //                 }
    //             }

    //             // ===== Save to DB =====
    //             TAdminMosqueData::create([
    //                 'name'        => $details['name'] ?? null,
    //                 'address'     => $details['formatted_address'] ?? null,
    //                 'lat'         => $details['geometry']['location']['lat'] ?? null,
    //                 'lng'         => $details['geometry']['location']['lng'] ?? null,
    //                 'place_id'    => $details['place_id'] ?? null,
    //                 'photos'      => $photosJson,
    //                 'icon'        => $localIconPath,
    //                 'phone'       => $details['formatted_phone_number'] ?? null,
    //                 'website'     => $details['website'] ?? null,
    //                 'rating'      => $details['rating'] ?? null,
    //                 'opening_hour' => isset($details['opening_hours']['weekday_text'])
    //                     ? json_encode($details['opening_hours']['weekday_text'])
    //                     : null,
    //             ]);
    //         }

    //         return response()->json(['message' => 'Mosques data stored successfully.']);

    //     }else {
    //         return response()->json(['message' => 'Failed to fetch mosque data.'], 500);
    //     }
    // }

    public function mosqueStore(Request $request)
    {
        ImportMosquesFromGoogle::dispatch();

        return response()->json(['message' => 'Mosque import started in background.']);
    }


    // get mosque list
    public function getMosqueList(Request $request)
    {
        $mosqueList = TAdminMosqueData::all();
        return response()->json(['success' => 'success', 'message' => 'Mosque list:', 'data' => $mosqueList]);
    }
}
