<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Admin\TAdminPricingPlan;

class TBusinessPricingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tAboutUs = TAdminPricingPlan::insert([
            [
                'type_name' => "Basic", 
                'pricing' => '$120', 
                'plan_duration' => 'Yearly',
                'key_tag' => NULL,
                'feature_title' => json_encode(["List your physical outlets or online stores.","Get discovered in your service areas.","Get public ratings and reviews.","Get a personalized business dashboard to track your growth.","Get verified by CREED badge!","Get customer leads over phone and email.","Get personalized promotional support from CREED team."]),
                'feature_status' => json_encode(["1","1","1","0","0","0","0"]),
                'description' => NULL,
                'created_by' => 1
            ],
            [
                'type_name' => "Growth", 
                'pricing' => '$180', 
                'plan_duration' => 'Yearly',
                'key_tag' => "Most Popular",
                'feature_title' => json_encode(["List your physical outlets or online stores.","Get discovered in your service areas.","Get public ratings and reviews.","Get a personalized business dashboard to track your growth.","Get verified by CREED badge!","Get customer leads over phone and email.","Get personalized promotional support from CREED team."]),
                'feature_status' => json_encode(["1","1","1","1","1","1","0"]),
                'description' => NULL,
                'created_by' => 1
            ],
            [
                'type_name' => "Enterprise", 
                'pricing' => "Let's talk!", 
                'plan_duration' => 'Yearly',
                'key_tag' => NULL,
                'feature_title' => json_encode(["List your physical outlets or online stores.","Get discovered in your service areas.","Get public ratings and reviews.","Get a personalized business dashboard to track your growth.","Get verified by CREED badge!","Get customer leads over phone and email.","Get personalized promotional support from CREED team."]),
                'feature_status' => json_encode(["1","1","1","1","1","1","1"]),
                'description' => NULL,
                'created_by' => 1
            ],
        ]);
    }
}
