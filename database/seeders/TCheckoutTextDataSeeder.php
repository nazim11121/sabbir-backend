<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Admin\TCheckoutTextData;

class TCheckoutTextDataSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tAboutUs = TCheckoutTextData::insert([
            [
                'title' => 'Creed', 
                'short_description' => 'Lorem ipsum dolor sit amet consectetur. Ultrices tincidunt.', 
                'list' => json_encode(['Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet']),
                'created_by' => '1',
            ],
        ]);
    }
}
