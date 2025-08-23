<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Admin\TAdminAddListingFormManagement;

class TAdminAddListingFormSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = TAdminAddListingFormManagement::insert([
            // owned-info
            ['field_category' => 'Owned Info', 'field_name' => 'first_name', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Owned Info', 'field_name' => 'last_name', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Owned Info', 'field_name' => 'email', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Owned Info', 'field_name' => 'phone_number', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Owned Info', 'field_name' => 'address', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Owned Info', 'field_name' => 'country_code', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Owned Info', 'field_name' => 'country_short_code', 'field_status' => 1, 'created_by' => 1],
            // business-info
            ['field_category' => 'Business Info', 'field_name' => 'business_name', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Business Info', 'field_name' => 'description', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Business Info', 'field_name' => 'business_type_id', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Business Info', 'field_name' => 'business_category_id', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Business Info', 'field_name' => 'business_sub_category_id', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Business Info', 'field_name' => 'address', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Business Info', 'field_name' => 'city', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Business Info', 'field_name' => 'state', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Business Info', 'field_name' => 'zip_code', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Business Info', 'field_name' => 'country', 'field_status' => 1, 'created_by' => 1],
            // Business Contact Info
            ['field_category' => 'Business Contact Info', 'field_name' => 'business_phone_number', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Business Contact Info', 'field_name' => 'business_country_code', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Business Contact Info', 'field_name' => 'business_email', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Business Contact Info', 'field_name' => 'website', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Business Contact Info', 'field_name' => 'affiliation_id', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Business Contact Info', 'field_name' => 'facebook_link', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Business Contact Info', 'field_name' => 'twitter_link', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Business Contact Info', 'field_name' => 'instagram_link', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Business Contact Info', 'field_name' => 'tiktok_link', 'field_status' => 1, 'created_by' => 1],
            // Add Business Images
            ['field_category' => 'Add Business Images', 'field_name' => 'business_profile_image', 'field_status' => 1, 'created_by' => 1],
            // Hours & Service Area
            ['field_category' => 'Hours & Service Area', 'field_name' => 'service_area', 'field_status' => 1, 'created_by' => 1],
            // Your Creed Tags
            ['field_category' => 'Your Creed Tags', 'field_name' => 'creed_tags_id', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Your Creed Tags', 'field_name' => 'restaurant_id', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Your Creed Tags', 'field_name' => 'handcut_text', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Your Creed Tags', 'field_name' => 'halal_certificate', 'field_status' => 1, 'created_by' => 1],
            // Creed Exclusive Promo
            ['field_category' => 'Creed Exclusive Promo', 'field_name' => 'discount_code_description', 'field_status' => 1, 'created_by' => 1],
            ['field_category' => 'Creed Exclusive Promo', 'field_name' => 'discount_code', 'field_status' => 1, 'created_by' => 1],
        ]);
    }
}
