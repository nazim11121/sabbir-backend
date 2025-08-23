<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TAdminRoleWisePermissionAssignSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $role_has_permissions = array(
            array(
                "permission_id" => 105,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 104,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 103,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 102,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 101,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 100,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 99,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 98,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 97,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 96,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 95,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 94,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 93,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 92,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 91,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 13,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 17,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 18,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 19,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 20,
                "role_id" => 1,
            ),
            // array(
            //     "permission_id" => 21,
            //     "role_id" => 1,
            // ),
            array(
                "permission_id" => 22,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 23,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 24,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 25,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 26,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 27,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 28,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 29,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 30,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 31,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 46,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 47,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 48,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 49,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 50,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 51,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 52,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 53,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 54,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 55,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 56,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 57,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 58,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 59,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 60,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 61,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 62,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 63,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 64,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 65,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 66,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 67,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 68,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 69,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 70,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 71,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 72,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 73,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 74,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 75,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 76,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 77,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 78,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 79,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 80,
                "role_id" => 1,
            ),

            array(
                "permission_id" => 82,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 83,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 84,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 85,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 86,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 87,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 88,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 89,
                "role_id" => 1,
            ),
            array(
                "permission_id" => 90,
                "role_id" => 1,
            ),
        );

        DB::table('role_has_permissions')->insert($role_has_permissions);
    }
}
