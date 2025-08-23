<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Api\TAdminVersion;

class TAdminVersionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tAdminVersion = TAdminVersion::insert([
            [
                'version' => '1.0.0', 
            ],
        ]);
    }
}
