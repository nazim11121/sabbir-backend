<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Admin\TBusinessSubCategory;

class TBusinessSubCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tBusinessSubCategory = TBusinessSubCategory::insert([

            [
                'category_id' => '1',
                'name' => 'Coffee',
                'created_by' => '1',
            ],
            [
                'category_id' => '1',
                'name' => 'Burger',
                'created_by' => '1',
            ],
            [
                'category_id' => '1',
                'name' => 'Pizza',
                'created_by' => '1',
            ],

            [
                'category_id' => '2',
                'name' => 'Technology Consultant',
                'created_by' => '1',
            ],

            [
                'category_id' => '2',
                'name' => 'Computers',
                'created_by' => '1',
            ],

            [
                'category_id' => '2',
                'name' => 'Phones',
                'created_by' => '1',
            ],


            [
                'category_id' => '3',
                'name' => 'Doctor',
                'created_by' => '1',
            ],

            [
                'category_id' => '3',
                'name' => 'Dentist',
                'created_by' => '1',
            ],

            [
                'category_id' => '3',
                'name' => 'Surgeon',
                'created_by' => '1',
            ],

            [
                'category_id' => '3',
                'name' => 'Mental Health',
                'created_by' => '1',
            ],

            [
                'category_id' => '3',
                'name' => 'Medical Services',
                'created_by' => '1',
            ],

            [
                'category_id' => '3',
                'name' => 'Health & Well Being Facility',
                'created_by' => '1',
            ],


            [
                'category_id' => '4',
                'name' => 'Law Sub Cat',
                'created_by' => '1',
            ],
            [
                'category_id' => '5',
                'name' => 'SubCat1',
                'created_by' => '1',
            ],

            [
                'category_id' => '6',
                'name' => 'Mosque',
                'created_by' => '1',
            ],

            [
                'category_id' => '8',
                'name' => 'Car',
                'created_by' => '1',
            ],

            [
                'category_id' => '8',
                'name' => 'Mechanic',
                'created_by' => '1',
            ],

            [
                'category_id' => '9',
                'name' => 'Schools',
                'created_by' => '1',
            ],

            [
                'category_id' => '9',
                'name' => 'Islamic School',
                'created_by' => '1',
            ],

            [
                'category_id' => '9',
                'name' => 'Religious School',
                'created_by' => '1',
            ],

            [
                'category_id' => '9',
                'name' => 'Sunday School',
                'created_by' => '1',
            ],

            [
                'category_id' => '10',
                'name' => 'Banking',
                'created_by' => '1',
            ],

            [
                'category_id' => '10',
                'name' => 'Equity',
                'created_by' => '1',
            ],

            [
                'category_id' => '10',
                'name' => 'Finance',
                'created_by' => '1',
            ],

            [
                'category_id' => '10',
                'name' => 'Halal Mortgage',
                'created_by' => '1',
            ],

            [
                'category_id' => '10',
                'name' => 'Insurance',
                'created_by' => '1',
            ],

            [
                'category_id' => '10',
                'name' => 'Halal Lending',
                'created_by' => '1',
            ],

            [
                'category_id' => '10',
                'name' => 'Financial Services',
                'created_by' => '1',
            ],

            [
                'category_id' => '11',
                'name' => 'Mechanic',
                'created_by' => '1',
            ],

            [
                'category_id' => '11',
                'name' => 'Body Shop',
                'created_by' => '1',
            ],

            [
                'category_id' => '11',
                'name' => 'Car Repair',
                'created_by' => '1',
            ],

            [
                'category_id' => '12',
                'name' => 'Home',
                'created_by' => '1',
            ],

            [
                'category_id' => '12',
                'name' => 'Auto',
                'created_by' => '1',
            ],

            [
                'category_id' => '12',
                'name' => 'Life',
                'created_by' => '1',
            ],

            [
                'category_id' => '12',
                'name' => 'Medical',
                'created_by' => '1',
            ],

            [
                'category_id' => '12',
                'name' => 'Other Insurance',
                'created_by' => '1',
            ],

            [
                'category_id' => '13',
                'name' => 'Real Estate Agents ONLY (Lenders and mortgage brokers to be listed under financial)',
                'created_by' => '1',
            ],

            [
                'category_id' => '14',
                'name' => 'Short Term',
                'created_by' => '1',
            ],

            [
                'category_id' => '15',
                'name' => 'Design',
                'created_by' => '1',
            ],

            [
                'category_id' => '15',
                'name' => 'Print',
                'created_by' => '1',
            ],

            [
                'category_id' => '15',
                'name' => 'Advertising (please provide description on business details section below)',
                'created_by' => '1',
            ],

            [
                'category_id' => '16',
                'name' => 'Manufacturing',
                'created_by' => '1',
            ],

            [
                'category_id' => '16',
                'name' => 'Fabrication (please provide description on business details section below)',
                'created_by' => '1',
            ],

            [
                'category_id' => '17',
                'name' => 'Non-Profit',
                'created_by' => '1',
            ],

            [
                'category_id' => '17',
                'name' => 'Non-Government',
                'created_by' => '1',
            ],

            [
                'category_id' => '17',
                'name' => 'Aid',
                'created_by' => '1',
            ],

            [
                'category_id' => '17',
                'name' => 'Relief Organization',
                'created_by' => '1',
            ],

            [
                'category_id' => '18',
                'name' => 'Daycare',
                'created_by' => '1',
            ],



        ]);
    }
}
