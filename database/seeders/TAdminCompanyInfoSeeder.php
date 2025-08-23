<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Admin\TCompanyInfo;

class TAdminCompanyInfoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tCompanyInfo = TCompanyInfo::insert([
            [
                'system_name' => 'CREED',
                'owner_name'  => 'AnalyzenBD',
                'email'       => 'mail@analyzenbd.com', 
                'phone_number'=> '01713079712',
                'address'     => 'Level 1, House 1A, Road 16/A, Gulshan 1 Dhaka-1212, Bangladesh',
                'status'      => '1',
            ],
        ]);
    }
}
