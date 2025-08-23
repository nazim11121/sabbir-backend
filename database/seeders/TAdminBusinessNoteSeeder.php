<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Admin\TAdminNote;

class TAdminBusinessNoteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tAdminNote = TAdminNote::insert([
            [
                'owner_info_page' => 'Owner Information will not be part of the business listing.', 
                'business_info_step_1' => 'All information provided below will be part of your public business listing.',
                'business_info_step_2' => 'All information provided below will be part of your public business listing and visible to everyone.',
                'business_info_step_3' => 'All information provided below will be part of your public business listing and visible to everyone.', 
                'business_info_step_4' => 'All businesses on CREED are required to provide customers with a CREED Exclusive Promotion.',
                'business_info_step_5' => 'All information provided below will be part of your public business listing and visible to everyone.',
                'business_info_step_6' => 'All information provided below will be part of your public business listing and visible to everyone.',
                'business_info_step_7' => 'All information provided below will be part of your public business listing and visible to everyone.', 
                'created_by' => '1',
            ],
        ]);
    }
}
