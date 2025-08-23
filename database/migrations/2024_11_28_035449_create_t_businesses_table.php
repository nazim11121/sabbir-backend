<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('t_businesses', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('business_owner_id');
            $table->unsignedBigInteger('payment_id')->nullable();
            $table->string('business_name', 191);
            $table->string('business_type_id', 60);
            $table->unsignedInteger('business_category_id');
            $table->string('business_subcategory_id', 60)->nullable();
            $table->string('creed_tags_id', 20)->nullable();
            $table->string('business_email')->nullable();
            $table->string('country_short_code', 60)->nullable();
            $table->string('country_code', 7)->nullable();
            $table->string('business_phone_number', 15)->nullable();
            $table->tinyInteger('same_as_owner_phone')->default(0)->comment('1=Yes, 0=No');
            $table->tinyInteger('same_as_owner_email')->default(0)->comment('1=Yes, 0=No');
            $table->string('business_website')->nullable();
            $table->mediumText('address'); 
            $table->string('country', 100)->nullable(); 
            $table->string('state', 100)->nullable(); 
            $table->string('city', 100)->nullable(); 
            $table->string('zip_code', 60)->nullable(); 
            $table->decimal('lat', 10, 7)->nullable()->comment('address latitude'); 
            $table->decimal('long', 10, 7)->nullable()->comment('address longitude'); 
            $table->string('service_area')->nullable(); 
            $table->mediumText('description')->nullable();
            $table->string('hotline_country_code', 7)->nullable();
            $table->string('customer_hotline', 15)->nullable();
            $table->string('customer_email_leads')->nullable();
            $table->string('business_profile_image')->nullable(); 
            $table->string('restaurant_id', '20')->nullable();
            $table->string('halal_certificate')->nullable();
            $table->string('handcut_text', 191)->nullable(); 
            $table->string('handcut_certificate')->nullable(); 
            $table->string('affiliation_id', 255)->nullable();
            $table->mediumText('discount_code_description')->nullable();
            $table->string('discount_code', 100)->nullable();
            $table->string('facebook_link', 191)->nullable();
            $table->string('instagram_link', 191)->nullable();
            $table->string('twitter_link', 191)->nullable();
            $table->string('tiktok_link', 191)->nullable();
            $table->unsignedInteger('status')->default(1)->comment('1=business_owner_info_complete, 2=business_info_step1_complete, 3=business_contact_info_step2_complete, 4=business_images_step3_complete, 5=hours&service_area_business_step4_complete, 6=your_creed_tags_business_step5_complete, 7=business_step6_complete_creed_exclusive_promo, 8=payment_success, 9=payment_failed');
            $table->unsignedInteger('approval_status')->default(0)->comment('1=approved, 0=pending');
            $table->unsignedInteger('onboard_status')->default(0)->comment('1=published, 0=unpublished');
            $table->unsignedInteger('is_active')->default(1)->comment('1=active, 0=inactive');
            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'))->comment('Stores the creation time of the record');
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'))->comment('Stores the last update time of the record');
            $table->softDeletes();
            // Foreign_key
            $table->foreign('business_owner_id')->references('id')->on('t_business_owner_infos')->onDelete('cascade');
            // $table->foreign('payment_id')->references('id')->on('t_payments')->onDelete('cascade');

            // Indexes
            $table->index('business_owner_id');
            $table->index('payment_id');
            $table->index('business_name');
            $table->index('business_category_id');
            $table->index('business_email');
            $table->index('business_phone_number');
            $table->index('lat');
            $table->index('long');
            $table->index('status');
            $table->index('created_at');
            $table->index('updated_at');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('t_businesses');
        $table->dropSoftDeletes();
    }
};
