<?php

use App\Http\Controllers\Admin\Aboutus\AdminAboutCo;
use App\Http\Controllers\Admin\AddListingFormManagement\AddListingFormManagementCo;
use App\Http\Controllers\Admin\CustomerManagement\CustomerManagementCo;
use App\Http\Controllers\Admin\AdminPricingPlan\AdminPricingPlanCo;
use App\Http\Controllers\Admin\AccountManagement\AccountLedgerCo;
use App\Http\Controllers\Admin\ContactCreed\AdminContactCreedCo;
use App\Http\Controllers\Admin\Dashboard\AdminDashboardTwoCo;
use App\Http\Controllers\Admin\Dashboard\AdminDashboardCo;
use App\Http\Controllers\Admin\Backup\AdminDatabaseCo;
use App\Http\Controllers\Admin\UserManagement\AdminPermissionUnderRoleCo;
use App\Http\Controllers\Admin\PrivacyPolicy\AdminPrivacyPolicyCo;
use App\Http\Controllers\Admin\UserManagement\AdminAssignRoleCo;
use App\Http\Controllers\Admin\UserManagement\AdminPermissionCo;
use App\Http\Controllers\Admin\UserManagement\AdminRoleCo;
use App\Http\Controllers\Admin\UserManagement\AdminUserCo;
use App\Http\Controllers\Admin\AdminBusinessSubCategoryCo;
use App\Http\Controllers\Admin\CategoryCo;
use App\Http\Controllers\Admin\PackageCo;
use App\Http\Controllers\Admin\SliderCo;
use App\Http\Controllers\Admin\NoticeCo;
use App\Http\Controllers\Admin\AdminBusinessCategoryCo;
use App\Http\Controllers\Admin\AppTermsAndConditionsCo;
use App\Http\Controllers\Admin\AdminAffiliationCo;
use App\Http\Controllers\Admin\AdminBusinessNoteCo;
use App\Http\Controllers\Admin\AdminBusinessTagsCo;
use App\Http\Controllers\Admin\AdminBusinessTypeCo;
use App\Http\Controllers\Admin\AdminCompanyInfoCo;
use App\Http\Controllers\Admin\AdminCreedTagsCo;
use App\Http\Controllers\Admin\AdminCsvImportCo;
use App\Http\Controllers\Admin\AdminLocationCo;
use App\Http\Controllers\Admin\AdminRestaurantCo;
use App\Http\Controllers\API\Auth\UserSocialAuthCo;
use App\Http\Controllers\Frontend\UserCo;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

Route::get('/', [UserCo::class, 'index'])->name('welcome');
// sicial login
Route::get('/api/auth/google', [UserSocialAuthCo::class, 'redirectToGoogle'])->name('google.login');
Route::get('/api/auth/google/callback', [UserSocialAuthCo::class, 'handleGoogleCallback']);
/*frontend login endpoint*/
Route::get('/login', function () {
    return view('frontend.login');
})->name('frontend.login');
Route::get('/register', function (Request $request) {
    $referralCode = $request->query('refer_code'); // Get referral code from query parameter
    return view('frontend.register', compact('referralCode')); // Pass it to the register view
})->name('frontend.register');
Route::post('/register/store', [UserCo::class, 'register'])->name('register.store');
/*users panel login endpoint*/
Route::post('/profile/login', [UserCo::class, 'manualLogin'])->name('profile.login');
/*admin panel login endpoint*/
Route::get('/admin/login', function () {
    return view('auth.login');
})->name('admin.login');

/*user delete policy endpoint*/
Route::get('/user/delete-policy', function () {
    return view('frontend.userDeletePolicyOld');
});

Route::get('/account-deletion', function () {
    return view('frontend.userDeletePolicy');
});
Route::get('/profile', [UserCo::class, 'userDashboard'])->name('frontend-dashboard');
Route::post('/logout/user', [UserCo::class, 'logoutUser'])->name('logout.user');
Route::post('/profile/update-photo', [UserCo::class, 'updatePhoto'])->name('profile.updatePhoto');

Route::get('/deposit-form', [UserCo::class, 'depositForm'])->name('deposit');

Route::post('/deposit-form/store', [UserCo::class, 'depositFormStore'])->name('deposit-form.store');
Route::post('/deposit-confirm/store', [UserCo::class, 'depositConfirm'])->name('deposit-confirm.store');

Route::post('/buy-package/funded', [UserCo::class, 'buyFundedPackage'])->name('buy-package.funded');

Route::post('/invest-form', [UserCo::class, 'investForm'])->name('frontend.invest');

Route::get('/withdraw-form', [UserCo::class, 'withdrawForm'])->name('withdraw');

Route::post('/withdraw-form/store', [UserCo::class, 'withdrawFormStore'])->name('withdraw-form.store');

Route::post('/invest/cancel', [UserCo::class, 'investCancel'])->name('invest.cancel');

Route::get('/user/forgot-password', function () {
    return view('frontend.forgotEmail');
})->name('frontend.forgot-password');
Route::post('/user/forgot-password-mail', [UserCo::class, 'forgotPasswordMail'])->name('frontend.forgot-password-mail');

Route::middleware(['auth', 'verified'])->group(function () {
    
    /*Dashboard*/ 
    Route::get('/dashboard', [AdminDashboardCo::class, 'index'])->name('dashboard');
    Route::get('/dashboard2', [AdminDashboardTwoCo::class, 'index'])->middleware(['auth', 'verified'])->name('dashboard2');

    /*Usermanagement with Role&Permission*/ 
    Route::resource('/user-management/users', AdminUserCo::class);
    Route::resource('/user-management/roles', AdminRoleCo::class);
    Route::resource('/permissions', AdminPermissionCo::class);
    Route::resource('/permission-under-role', AdminPermissionUnderRoleCo::class);

    Route::get('/deposit-list', [UserCo::class, 'depositList'])->name('deposit-list');
    Route::get('/deposit-accept/status/{id}/{id2}', [UserCo::class, 'depositConfirmStatus'])->name('deposit-accept.status');

    Route::get('/invest-list', [UserCo::class, 'investList'])->name('invest-list');
    Route::get('/invest-accept/status/{id}', [UserCo::class, 'investConfirmStatus'])->name('invest-accept.status');
    

    Route::get('/buy-packages-list', [UserCo::class, 'buyPackageList'])->name('buy-packages-list');
    Route::post('/buy-packages/todo-list', [UserCo::class, 'buyPackagesTodoList'])->name('buy-packages.todo-list');
    Route::get('/buy-packages/rules/{buy_id}', [UserCo::class, 'fetchRules'])->name('buy-packages.rules.fetch');
    Route::get('/buypackage-accept/status/{id}/{id2}', [UserCo::class, 'buypackageConfirmStatus'])->name('buypackage-accept.status');

    Route::get('/withdraw-request-list', [UserCo::class, 'withdrawRequestList'])->name('withdraw-request-list');
    Route::get('/withdraw-request-list/status/{id}/{id2}', [UserCo::class, 'withdrawConfirmStatus'])->name('withdraw-accept.status');

    Route::get('/commission-list', [UserCo::class, 'commissionList'])->name('commission.list');
    Route::get('/commission/create', [UserCo::class, 'commissionCreate'])->name('commission.create');
    Route::post('/commission/store', [UserCo::class, 'commissionStore'])->name('commission.store');
    Route::get('/commission/edit/{id}', [UserCo::class, 'commissionEdit'])->name('commission.edit');
    Route::match(['put','patch'],'/commission/update/{id}', [UserCo::class, 'commissionUpdate'])->name('commission.update');
    Route::get('/commission/delete/{id}', [UserCo::class, 'commissionDelete'])->name('commission.delete');

    Route::get('/review-list', [UserCo::class, 'reviewList'])->name('review.list');
    Route::get('/review/create', [UserCo::class, 'reviewCreate'])->name('review.create');
    Route::post('/review/store', [UserCo::class, 'reviewStore'])->name('review.store');
    Route::get('/review/edit/{id}', [UserCo::class, 'reviewEdit'])->name('review.edit');
    Route::match(['put','patch'],'/review/update/{id}', [UserCo::class, 'reviewUpdate'])->name('review.update');
    Route::delete('/review/delete/{id}', [UserCo::class, 'reviewDelete'])->name('review.delete');

    Route::resource('/category', CategoryCo::class);
    Route::resource('/package', PackageCo::class);
    Route::resource('/slider', SliderCo::class);
    Route::resource('/notice', NoticeCo::class);

    Route::group(['prefix'  => 'assign-role', 'as' => 'assign-role.'], function () {
        Route::controller(AdminAssignRoleCo::class)->group(function () {
            Route::get('/', 'index')->name('index');
            Route::post('/store', 'store')->name('store');
            Route::get('/create', 'create')->name('create');
            Route::get('/edit/{userId}', 'edit')->name('edit');
            Route::put('/update/{userId}', 'update')->name('update');
            Route::get('/destroy/{userId}', 'destroy')->name('destroy');
        });
    });


    /*account management*/ 
    Route::get('income', [AccountLedgerCo::class, 'index'])->name('income.index');

    /*ImportCSV*/
    Route::get('/import-csv', [AdminCsvImportCo::class, 'showForm'])->name('csv.form');
    Route::post('/import-csv', [AdminCsvImportCo::class, 'importCsv'])->name('csv.import');

    /*Business Settings*/ 
    Route::resource('/business/creed-tags', AdminCreedTagsCo::class);
    Route::post('/business/creed-tags/priority/{id}', [AdminCreedTagsCo::class, 'updatePriority']);
    Route::resource('/business/business-type', AdminBusinessTypeCo::class);
    Route::resource('/business/business-category', AdminBusinessCategoryCo::class);
    Route::resource('/business/business-subcategory', AdminBusinessSubCategoryCo::class);
    Route::resource('/business/business-tags', AdminBusinessTagsCo::class);
    Route::resource('/business/restaurant', AdminRestaurantCo::class);
    Route::resource('/business/affiliations', AdminAffiliationCo::class);
    Route::resource('/business/pricing-plan', AdminPricingPlanCo::class);

    /*Customer Management*/ 
    Route::get('/customers/list', [CustomerManagementCo::class, 'customerList'])->name('customers.list');
    Route::get('/customers-details/view/{id}', [CustomerManagementCo::class, 'customerDetailsView'])->name('customers-details.view');
    Route::post('/customers-profile/image', [CustomerManagementCo::class, 'profileImage'])->name('customers-profile.image');
    Route::get('/customers/create', [CustomerManagementCo::class, 'customerListCreate'])->name('customers.create');
    Route::post('/customers/store', [CustomerManagementCo::class, 'customerListStore'])->name('customers.store');
    Route::get('/customers-details/edit/{id}', [CustomerManagementCo::class, 'customerListEdit'])->name('customers-list.edit');
    Route::post('/customers-details/business/account/active-deactive', [CustomerManagementCo::class, 'businessAccountActiveDeactive'])->name('business.account.active-deactive');
    Route::delete('/customers-details/business/account/delete/{id}', [CustomerManagementCo::class, 'businessAccountDelete'])->name('business.account.delete');
    Route::match(['put','patch'],'/customers-details/update/{id}', [CustomerManagementCo::class, 'ownerInfoUpdate'])->name('customers-owner-details.update');
    Route::match(['put','patch'],'/customers-business-details/update/{id}', [CustomerManagementCo::class, 'businessInfoUpdate'])->name('customers-business-details.update');
    Route::post('/customers-list/active-deactive', [CustomerManagementCo::class, 'customerListActiveDeactive'])->name('customers-list.active-deactive');
    Route::delete('/customers-list/delete/{id}', [CustomerManagementCo::class, 'customerListDelete'])->name('customers-list.delete');
    Route::get('/customers/archive/list', [CustomerManagementCo::class, 'customerArchiveList'])->name('customers.archive.list');
    Route::get('/customers/archive/list/retrieve/{id}', [CustomerManagementCo::class, 'customerArchiveListRetrieve'])->name('customers.archive.list.retrieve');
    Route::get('/customers-details/business/account/retrieve/{id}', [CustomerManagementCo::class, 'businessAccountRestore'])->name('business.account.restore');
    Route::delete('/customers/archive/list/parmanent-delete/{id}', [CustomerManagementCo::class, 'customerArchiveListDelete'])->name('customers.archive.list.parmanent-delete');
    Route::get('/customers/business/list', [CustomerManagementCo::class, 'businessList'])->name('customers.business.list');
    Route::get('/customers/business/reviews/{id}', [CustomerManagementCo::class, 'reviews'])->name('customers.business.reviews');
    Route::delete('/customers/reviews/delete/{id}', [CustomerManagementCo::class, 'reviewsDelete'])->name('customers.reviews.delete');
    /*Usermanagement with Role&Permission*/ 
    Route::resource('/user-management/users', AdminUserCo::class);
    Route::resource('/user-management/roles', AdminRoleCo::class);
    /*addLitingFormManagement*/ 
    Route::resource('/add-listing-form-management', AddListingFormManagementCo::class);
    Route::post('/add-listing-form-management/field-status/{id}', [AddListingFormManagementCo::class, 'updateFieldStatus'])->name('field-status.update');

    /*Location*/ 
    Route::get('/states/{country_id}', [AdminLocationCo::class, 'getStates']);
    Route::get('/cities/{state_id}', [AdminLocationCo::class, 'getCities']);
    /*Company-Info*/ 
    Route::resource('/company-info', AdminCompanyInfoCo::class);
    /*about-us*/ 
    Route::resource('about-us', AdminAboutCo::class);
    /*privacy-policy*/ 
    Route::resource('privacy-policy', AdminPrivacyPolicyCo::class);
    /*database-backup*/ 
    Route::get('/backup', [AdminDatabaseCo::class, 'backup'])->name('backup');
    Route::get('/backup-database', [AdminDatabaseCo::class, 'backupDatabase'])->name('backup-database');
    Route::get('/backup-download/{file}', [AdminDatabaseCo::class, 'backupDownload'])->name('backup-download');
    Route::delete('/backup-delete/{file}', [AdminDatabaseCo::class, 'backupDelete'])->name('backup-delete');
    /*contact-creed-admin*/ 
    Route::get('/contact-creed-list', [AdminContactCreedCo::class, 'index'])->name('contact-creed.list');
    Route::delete('/contact-creed/delete/{id}', [AdminContactCreedCo::class, 'destroy'])->name('contact-creed.destroy');
    /*business-note*/ 
    Route::resource('/business-note', AdminBusinessNoteCo::class);
    Route::resource('/app-terms-and-conditions', AppTermsAndConditionsCo::class);
});
/*ends*/

Route::get('/app-profile', function () {
    return view('pages/app-profile');
})->middleware(['auth', 'verified'])->name('app-profile');

Route::get('/app-calender', function () {
    return view('pages/app-calender');
})->middleware(['auth', 'verified'])->name('app-calender');

Route::get('/email-compose', function () {
    return view('pages/email-compose');
})->middleware(['auth', 'verified'])->name('email-compose');

Route::get('/email-inbox', function () {
    return view('pages/email-inbox');
})->middleware(['auth', 'verified'])->name('email-inbox');

Route::get('/email-read', function () {
    return view('pages/email-read');
})->middleware(['auth', 'verified'])->name('email-read');

Route::get('/widget-basic', function () {
    return view('pages/widget-basic');
})->middleware(['auth', 'verified'])->name('widget-basic');

Route::get('/chart-flot', function () {
    return view('pages/chart-flot');
})->middleware(['auth', 'verified'])->name('chart-flot');

Route::get('/chart-morris', function () {
    return view('pages/chart-morris');
})->middleware(['auth', 'verified'])->name('chart-morris');

Route::get('/chart-chartjs', function () {
    return view('pages/chart-chartjs');
})->middleware(['auth', 'verified'])->name('chart-chartjs');

Route::get('/chart-chartist', function () {
    return view('pages/chart-chartist');
})->middleware(['auth', 'verified'])->name('chart-chartist');

Route::get('/chart-sparkline', function () {
    return view('pages/chart-sparkline');
})->middleware(['auth', 'verified'])->name('chart-sparkline');

Route::get('/chart-peity', function () {
    return view('pages/chart-peity');
})->middleware(['auth', 'verified'])->name('chart-peity');

Route::get('/form/form-element', function () {
    return view('pages/form-element');
})->middleware(['auth', 'verified'])->name('form-element');

Route::get('/form/form-wizard', function () {
    return view('pages/form-wizard');
})->middleware(['auth', 'verified'])->name('form-wizard');

Route::get('/form/form-editor-summernote', function () {
    return view('pages/form-editor-summernote');
})->middleware(['auth', 'verified'])->name('form-editor-summernote');

Route::get('/form/form-pickers', function () {
    return view('pages/form-pickers');
})->middleware(['auth', 'verified'])->name('form-pickers');

Route::get('/form/form-validation-jquery', function () {
    return view('pages/form-validation-jquery');
})->middleware(['auth', 'verified'])->name('form-validation-jquery');

Route::get('/table/table-bootstrap-basic', function () {
    return view('pages/table-bootstrap-basic');
})->middleware(['auth', 'verified'])->name('table-bootstrap-basic');

Route::get('/table/table-datatable-basic', function () {
    return view('pages/table-datatable-basic');
})->middleware(['auth', 'verified'])->name('table-datatable-basic');

Route::get('/page-register', function () {
    return view('pages/page-register');
})->middleware(['auth', 'verified'])->name('page-register');

// Route::get('/page-login', function () {
//     return view('pages/page-login');
// })->middleware(['auth', 'verified'])->name('page-login');

Route::get('/page-lock-screen', function () {
    return view('pages/page-lock-screen');
})->middleware(['auth', 'verified'])->name('page-lock-screen');

Route::get('/error/page-error-400', function () {
    return view('pages/page-error-400');
})->middleware(['auth', 'verified'])->name('page-error-400');

Route::get('/error/page-error-403', function () {
    return view('pages/page-error-403');
})->middleware(['auth', 'verified'])->name('page-error-403');

Route::get('/error/page-error-404', function () {
    return view('pages/page-error-404');
})->middleware(['auth', 'verified'])->name('page-error-404');

Route::get('/error/page-error-500', function () {
    return view('pages/page-error-500');
})->middleware(['auth', 'verified'])->name('page-error-500');

Route::get('/error/page-error-503', function () {
    return view('pages/page-error-503');
})->middleware(['auth', 'verified'])->name('page-error-503');

Route::get('/uc-select2', function () {
    return view('pages/uc-select2');
})->middleware(['auth', 'verified'])->name('uc-select2');

Route::get('/uc-nestable', function () {
    return view('pages/uc-nestable');
})->middleware(['auth', 'verified'])->name('uc-nestable');

Route::get('/uc-noui-slider', function () {
    return view('pages/uc-noui-slider');
})->middleware(['auth', 'verified'])->name('uc-noui-slider');

Route::get('/uc-sweetalert', function () {
    return view('pages/uc-sweetalert');
})->middleware(['auth', 'verified'])->name('uc-sweetalert');

Route::get('/uc-toastr', function () {
    return view('pages/uc-toastr');
})->middleware(['auth', 'verified'])->name('uc-toastr');

Route::get('/map-jqvmap', function () {
    return view('pages/map-jqvmap');
})->middleware(['auth', 'verified'])->name('map-jqvmap');

Route::get('/ui-accordion', function () {
    return view('pages/ui-accordion');
})->middleware(['auth', 'verified'])->name('ui-accordion');

Route::get('/ui-alert', function () {
    return view('pages/ui-alert');
})->middleware(['auth', 'verified'])->name('ui-alert');

Route::get('/ui-badge', function () {
    return view('pages/ui-badge');
})->middleware(['auth', 'verified'])->name('ui-badge');

Route::get('/ui-button', function () {
    return view('pages/ui-button');
})->middleware(['auth', 'verified'])->name('ui-button');

Route::get('/ui-button-group', function () {
    return view('pages/ui-button-group');
})->middleware(['auth', 'verified'])->name('ui-button-group');

Route::get('/ui-modal', function () {
    return view('pages/ui-modal');
})->middleware(['auth', 'verified'])->name('ui-modal');

Route::get('/ui-list-group', function () {
    return view('pages/ui-list-group');
})->middleware(['auth', 'verified'])->name('ui-list-group');

// Route::middleware('auth')->group(function () {
//     Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
//     Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
//     Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
// });

require __DIR__.'/auth.php';
