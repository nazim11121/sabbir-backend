<?php

namespace Database\Seeders;

use App\Models\Api\TDashboardTodoList;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TDashboardTodoListSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        TDashboardTodoList::insert([
            [
                "id" => 1,
                "account_type" => "business",
                "todo_title" => "Complete your business profile (Profile 100% Complete)",
                "status" => 1,
                "checkbox_status" => 1,
            ],

            [
                "id" => 2,
                "account_type" => "business",
                "todo_title" => "Start a promotion campaign/Promote your business",
                "status" => 1,
                "checkbox_status" => 0,
            ],

            [
                "id" => 3,
                "account_type" => "business",
                "todo_title" => "Connect with other businesses in your industry (B2B)",
                "status" => 1,
                "checkbox_status" => 0,
            ],


            [
                "id" => 4,
                "account_type" => "business",
                "todo_title" => "other Items",
                "status" => 1,
                "checkbox_status" => 0,
            ],

            [
                "id" => 5,
                "account_type" => "personal",
                "todo_title" => "Complete your CREED profile (Profile 100% Complete)",
                "status" => 1,
                "checkbox_status" => 1,
            ],

            [
                "id" => 6,
                "account_type" => "personal",
                "todo_title" => "Select your CREED Badges",
                "status" => 1,
                "checkbox_status" => 0,
            ],

            [
                "id" => 7,
                "account_type" => "personal",
                "todo_title" => "Other Items",
                "status" => 1,
                "checkbox_status" => 0,
            ],

            [
                "id" => 8,
                "account_type" => "personal",
                "todo_title" => "other Items",
                "status" => 1,
                "checkbox_status" => 0,
            ]
        ]);
    }
}
