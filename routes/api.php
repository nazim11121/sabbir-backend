<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\UserBusinessOwnerInfoCo;
use App\Http\Controllers\API\Auth\UserSocialAuthCo;

/*sign-up and sign-in endpoints*/
// test google-Social login endpoints start
// Route::get('google', [UserSocialAuthCo::class, 'redirectToGoogle'])->name('google.login');
// Route::get('google/callback', [UserSocialAuthCo::class, 'handleGoogleCallback'])->name('google.callback');
// test google-Social login endpoints end
Route::prefix('auth')->group(function () {
Route::post('google', [UserSocialAuthCo::class, 'googleDataStore'])->name('google.data.store');
Route::get('apple', [UserSocialAuthCo::class, 'redirectToApple']);
Route::get('apple/callback', [UserSocialAuthCo::class, 'handleAppleCallback']);
Route::post('/manual/sign-up', [UserSocialAuthCo::class, 'manualsignUp']);
Route::post('/manual/sign-in', [UserSocialAuthCo::class, 'manualLogin']);
Route::post('/send-otp', [UserSocialAuthCo::class, 'sendOtp']);
Route::post('/verify-otp', [UserSocialAuthCo::class, 'verifyOtp']);
Route::post('/reset-password', [UserSocialAuthCo::class, 'resetPassword']);
Route::post('/logout', [UserSocialAuthCo::class, 'logout'])->middleware('auth:sanctum');
});

// Users Authentication endpoints
Route::middleware(['auth:sanctum', 'throttle:60,1'])->group(function () {
    /*Business Account Create or Updated endpoints*/ 
    Route::get('/user-details', [UserBusinessOwnerInfoCo::class, 'userDetails'])->name('user.profile.details');
    Route::get('/business-owner-info/get',[UserBusinessOwnerInfoCo::class, 'businessOwnerInfoGet'])->name('businessOwnerInfo.get');
    Route::post('/business-owner-info/store',[UserBusinessOwnerInfoCo::class, 'businessOwnerInfoStore'])->name('businessOwnerInfo.store');
    Route::get('/business-info/get/step1',[UserBusinessOwnerInfoCo::class, 'businessInfoStore1Get'])->name('businessInfoStore.get.step1');
    Route::post('/business-info/store/step1',[UserBusinessOwnerInfoCo::class, 'businessInfoStore1'])->name('businessInfo.store.step1');
    Route::get('/business-info/get/step2',[UserBusinessOwnerInfoCo::class, 'businessInfoStore2Get'])->name('businessInfoStore.get.step2');
    Route::post('/business-info/store/step2',[UserBusinessOwnerInfoCo::class, 'businessInfoStore2'])->name('businessInfo.store.step2');
    Route::get('/business-info/get/step3',[UserBusinessOwnerInfoCo::class, 'businessInfoStore3Get'])->name('businessInfoStore.get.step3');
    Route::post('/business-info/store/step3',[UserBusinessOwnerInfoCo::class, 'businessInfoStore3'])->name('businessInfo.store.step3');
    Route::get('/business-info/get/step4',[UserBusinessOwnerInfoCo::class, 'businessInfoStore4Get'])->name('businessInfoStore.get.step4');
    Route::post('/business-info/store/step4',[UserBusinessOwnerInfoCo::class, 'businessInfoStore4'])->name('businessInfo.store.step4');
    Route::get('/business-info/get/step5',[UserBusinessOwnerInfoCo::class, 'businessInfoStore5Get'])->name('businessInfoStore.get.step5');
    Route::post('/business-info/store/step5',[UserBusinessOwnerInfoCo::class, 'businessInfoStore5'])->name('businessInfo.store.step5');
    Route::get('/business-info/get/step6',[UserBusinessOwnerInfoCo::class, 'businessInfoStore6Get'])->name('businessInfoStore.get.step6');
    Route::post('/business-info/store/step6',[UserBusinessOwnerInfoCo::class, 'businessInfoStore6'])->name('businessInfo.store.step6');
 
    /*image delete endpoints*/
    Route::post('/business-info/image-delete', [UserBusinessOwnerInfoCo::class, 'imageDelete'])->name('business-info.image-delete');

    /*Business List Save/show By Users endpoints*/ 
    Route::post('/save-business-list',[UserBusinessOwnerInfoCo::class, 'saveBusinessList'])->name('save-business-list');
    Route::get('/save-business-list/show',[UserBusinessOwnerInfoCo::class, 'saveBusinessListShow'])->name('save-business-list.show');

    /*Reviews-Rating management endpoints*/ 
    Route::post('/business-rating', [UserBusinessOwnerInfoCo::class, 'businessRating'])->name('business.rating');
    Route::get('/business-rating/delete', [UserBusinessOwnerInfoCo::class, 'ratingDelete'])->name('business.rating.delete');
    Route::get('/business-rating-view', [UserBusinessOwnerInfoCo::class, 'ratingView'])->name('business.rating.view');

    /*Profile related endpoints*/ 
    Route::post('/dashboard/todo_list', [UserBusinessOwnerInfoCo::class, 'dashboardTodoListStore'])->name('dashboard.todo.list');
    Route::get('/personal-profile', [UserBusinessOwnerInfoCo::class, 'personalProfile'])->name('user.personal-profile');
    Route::get('/business-profile', [UserBusinessOwnerInfoCo::class, 'businessProfile'])->name('user.business-profile');
    Route::post('/user/profile/edit', [UserBusinessOwnerInfoCo::class, 'editProfile'])->name('user.profile.edit');
 
    /*delete-user-account endpoints*/ 
    Route::post('/delete-user', [UserBusinessOwnerInfoCo::class, 'deleteUserAccount'])->name('delete-user');

    /*deactive-business endpoints*/ 
    Route::post('/deactive-business', [UserBusinessOwnerInfoCo::class, 'deactiveBusiness'])->name('deactive-business');
    Route::post('/delete-business', [UserBusinessOwnerInfoCo::class, 'deleteBusiness'])->name('delete-business');
});

Route::get('/business-info/payment-success', [UserBusinessOwnerInfoCo::class, 'paymentSuccess'])->name('businessInfo.payment-success');
Route::get('/business-info/payment-cancel', [UserBusinessOwnerInfoCo::class, 'paymentCancel'])->name('businessInfo.payment-cancel');
Route::post('/business-info/checkout', [UserBusinessOwnerInfoCo::class, 'checkout'])->name('businessInfo.checkout');

/*strip-price-table endpoints*/
Route::get('/business-info/stripe-price-table', [UserBusinessOwnerInfoCo::class, 'stripePriceTable'])->name('businessInfo.stripe-price-table');
Route::get('/business/get-category-wise-subcategory', [UserBusinessOwnerInfoCo::class, 'getSubCategoryByCategory'])->name('business.get-category-wise-subcategory');
/*Drop-down List endpoints*/
Route::get('/business/all-dropDown-list', [UserBusinessOwnerInfoCo::class, 'allDropDown'])->name('business.all_dropDown_list');
Route::get('/business/creed-tags', [UserBusinessOwnerInfoCo::class, 'creedTags'])->name('creed.tags');
Route::get('/business-type', [UserBusinessOwnerInfoCo::class, 'businessType'])->name('business.type');
Route::get('/business-category', [UserBusinessOwnerInfoCo::class, 'businessCategory'])->name('business.category');
Route::get('/business-subcategory', [UserBusinessOwnerInfoCo::class, 'businessSubCategory'])->name('business.subcategory');
Route::get('/business-tags', [UserBusinessOwnerInfoCo::class, 'businessTags'])->name('business.tags');
Route::get('/restaurant-data-list', [UserBusinessOwnerInfoCo::class, 'restaurantDataList'])->name('restaurant.list');
Route::get('/country-list', [UserBusinessOwnerInfoCo::class, 'countryList'])->name('country.list');
Route::get('/state-list', [UserBusinessOwnerInfoCo::class, 'stateList'])->name('state.list');
Route::get('/city-list', [UserBusinessOwnerInfoCo::class, 'cityList'])->name('city.list');
Route::get('/days-list', [UserBusinessOwnerInfoCo::class, 'daysList'])->name('days.list');
Route::get('/affiliations-list', [UserBusinessOwnerInfoCo::class, 'affiliationList'])->name('affiliations.list');
Route::get('/pricing-plan-list', [UserBusinessOwnerInfoCo::class, 'pricingPlanList'])->name('pricing.plan.list');

/*Get Category with relational data endpoints*/ 
Route::get('/business/category-with-relations', [UserBusinessOwnerInfoCo::class, 'getCategoryRelation'])->name('business.category.relations');

/*Get SubCategory with relational data endpoints*/ 
Route::get('/business/subCategory-with-relations', [UserBusinessOwnerInfoCo::class, 'getSubCategoryRelation'])->name('business.subCategory.relations');

/*Landing pages related endpoints*/ 
Route::get('/business/nearby', [UserBusinessOwnerInfoCo::class, 'getNearByBusiness'])->name('business.nearby');
Route::get('/business/single-profile', [UserBusinessOwnerInfoCo::class, 'getBusinessProfile'])->name('business.singleProfile');
Route::get('/business/multi-list', [UserBusinessOwnerInfoCo::class, 'getMultiBusinessList'])->name('business.multiList');
Route::get('/user-list', [UserBusinessOwnerInfoCo::class, 'userList'])->name('user.list');

/*businessList search by Creed Tags endpoints*/ 
Route::post('/business/search-by-creedtags', [UserBusinessOwnerInfoCo::class, 'searchByCreedTags'])->name('business.search-by-creedtags');

/*businessList search by Business-Category-SubCategory-text endpoints*/ 
Route::get('/business/search-by-catSubCat', [UserBusinessOwnerInfoCo::class, 'searchByBusinessCatSubCategory'])->name('business.search-by-category');

/*Searchbox and businessList search by searchbox text endpoints*/ 
Route::get('/business/search-box', [UserBusinessOwnerInfoCo::class, 'searchBox'])->name('business.search-box');
Route::post('/business/search-searchbox-text', [UserBusinessOwnerInfoCo::class, 'searchBySearchBox'])->name('business.search-searchbox');

/*AboutUs endpoints*/ 
Route::get('/about-us', [UserBusinessOwnerInfoCo::class, 'aboutUs'])->name('aboutus');

/*Company-info endpoints*/ 
Route::get('/company-info', [UserBusinessOwnerInfoCo::class, 'companyInfo'])->name('company-info');

/*AppTermsAndConditions*/ 
Route::get('/app-termsAndConditions', [UserBusinessOwnerInfoCo::class, 'appTermsAndConditions'])->name('appTermsAndConditions');

/*PrivacyPolicy endpoints*/ 
Route::get('/privacy-policy', [UserBusinessOwnerInfoCo::class, 'getPrivacyPolicy'])->name('privacy-policy');

/*checkoutTextData endpoints*/ 
Route::get('/business-info/checkout-text', [UserBusinessOwnerInfoCo::class, 'checkoutTextData'])->name('checkoutTextData');

/*creed app & business-profile visitor store endpoints*/
Route::post('/creed-visitor/store', [UserBusinessOwnerInfoCo::class, 'creedVisitorStore'])->name('creed-visitor.store');
Route::post('/business-profile-visitor/store', [UserBusinessOwnerInfoCo::class, 'businessProfileVisitorStore'])->name('business-profile-visitor.store');

/*Filters endpoints*/ 
Route::post('/business/filter-screen', [UserBusinessOwnerInfoCo::class, 'filterScreen'])->name('business.filter-screen');

/*Business Pofile Details endpoints*/ 
Route::post('/business/call-me', [UserBusinessOwnerInfoCo::class, 'callMe'])->name('business.call-me');
Route::post('/business/quote', [UserBusinessOwnerInfoCo::class, 'quote'])->name('business.quote');
Route::get('/business/direction/{id}', [UserBusinessOwnerInfoCo::class, 'getBusinessDirection'])->name('business.direction');


/*Contact Creed endpoints*/ 
Route::get('/contact-creed/list', [UserBusinessOwnerInfoCo::class, 'getContactCreedList'])->name('contact-creed.list');
Route::post('/contact-creed/store', [UserBusinessOwnerInfoCo::class, 'contactCreedDataStore'])->name('contact-creed.list');

/*version 1.0.0 endpoints*/ 
Route::get('/version', [UserBusinessOwnerInfoCo::class, 'getVersion'])->name('version');

/*get business-note endpoints*/ 
Route::get('/business-note', [UserBusinessOwnerInfoCo::class, 'getBusinessNote'])->name('business-note');

/*privacy-policy endpoints*/ 
Route::get('/privacy-policy', function () {
    return view('frontend.privacyPolicy.privacyPolicy');
});

/*business terms and conditions endpoints*/ 
Route::get('/business-terms-and-conditions', function () {
    return view('frontend.businessTermsAndConditions.businessTermsAndConditions');
});
/*personal terms and conditions endpoints*/ 
Route::get('/personal-terms-and-conditions', function () {
    return view('frontend.personalTermsAndConditions.personalTermsAndConditions');
});

/*store mosques from google map api endpoints*/ 
Route::get('/mosques-store', [UserBusinessOwnerInfoCo::class, 'mosqueStore'])->name('mosque.store');
/*Mosque list endpoints*/ 
Route::get('/mosque-list', [UserBusinessOwnerInfoCo::class, 'getMosqueList'])->name('mosque.list');
/*ends*/ 
