<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Admin\TCreedTags;

class CreedTagsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tCreedTags = TCreedTags::insert([

            ['name' => 'Muslim Owned', 'priority' => '1', 'created_by' => '1'],
            ['name' => 'Muslim Operated', 'priority' => '2', 'created_by' => '1'],
            ['name' => 'Serving Muslim Community', 'priority' => '3', 'created_by' => '1']

        ]);
    }
}
