<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Admin\TBusinessCategory;
use App\Models\Admin\TBusinessCategoryKeyword;

class TBusinessCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tBusinessCategory = TBusinessCategory::insert([
            [
                'id'            => 1,
                'name'          => 'Halal Restaurant',
                'description'   => 'Halal Restaurant description',
                'created_by'    => '1',
            ],
            [
                'id'            => 2,
                'name'          => 'Technology',
                'description'   => 'Technology Consultant/Computers/Phones.',
                'created_by'    => '1',
            ],
            [
                'id'            => 3,
                'name'          => 'Medical',
                'description'   => 'Doctor/Dentist/Surgeon/Mental Health/Medical Services/Health & Well Being Facility.',
                'created_by'    => '1',
            ],
            [
                'id'            => 4,
                'name'          => 'Legal',
                'description'   => 'Lawyer/Law-Firm/Legal Expert/Legal Consultant.',
                'created_by'    => '1',
            ],
            [
                'id'            => 5,
                'name'          => 'Event Planning',
                'description'   => 'Event Planning description',
                'created_by'    => '1',
            ],
            [
                'id'            => 6,
                'name'          => 'Mosque',
                'description'   => 'Mosque description',
                'created_by'    => '1',
            ],
            [
                'id'            => 7,
                'name'          => 'Healthcare',
                'description'   => 'Healthcare description',
                'created_by'    => '1',
            ],

            [
                'id'            => 8,
                'name'          => 'Automobile',
                'description'   => 'Automobile description',
                'created_by'    => '1',
            ],

            [
                'id'            => 9,
                'name'          => 'Education',
                'description'   => 'Education description',
                'created_by'    => '1',
            ],

            [
                'id'            => 10,
                'name'          => 'Financial',
                'description'   => 'Financial description',
                'created_by'    => '1',
            ],

            [
                'id'            => 11,
                'name'          => 'Auto',
                'description'   => 'Auto description',
                'created_by'    => '1',
            ],

            [
                'id'            => 12,
                'name'          => 'Insurance',
                'description'   => 'Insurance description',
                'created_by'    => '1',
            ],

            [
                'id'            => 13,
                'name'          => 'Real Estate',
                'description'   => 'Real Estate description',
                'created_by'    => '1',
            ],

            [
                'id'            => 14,
                'name'          => 'Vacation Rental Property',
                'description'   => 'Vacation Rental Property description',
                'created_by'    => '1',
            ],

            [
                'id'            => 15,
                'name'          => 'Services',
                'description'   => 'Services description',
                'created_by'    => '1',
            ],

            [
                'id'            => 16,
                'name'          => 'Industrial',
                'description'   => 'Industrial description',
                'created_by'    => '1',
            ],

            [
                'id'            => 17,
                'name'          => 'Non-Profit Organizations',
                'description'   => 'Non-Profit Organizations description',
                'created_by'    => '1',
            ],

            [
                'id'            => 18,
                'name'          => 'Children Services',
                'description'   => 'Children Services description',
                'created_by'    => '1',
            ],


        ]);


        // insert into t_business_category_keywords table
        TBusinessCategoryKeyword::insert([
            [
                'id' => 1,
                'category_id' => 7,
                'name' => 'Doctor',
                'created_by' => 1
            ],
            [
                'id' => 2,
                'category_id' => 7,
                'name' => 'Physician',
                'created_by' => 1
            ],
            [
                'id' => 3,
                'category_id' => 7,
                'name' => 'Healthcare provider',
                'created_by' => 1
            ],
            [
                'id' => 4,
                'category_id' => 7,
                'name' => 'Consultant',
                'created_by' => 1
            ],
            [
                'id' => 5,
                'category_id' => 7,
                'name' => 'Family medicine',
                'created_by' => 1
            ],
            [
                'id' => 6,
                'category_id' => 7,
                'name' => 'Internal medicine',
                'created_by' => 1
            ],
            [
                'id' => 7,
                'category_id' => 7,
                'name' => 'Pediatrics',
                'created_by' => 1
            ],
            [
                'id' => 8,
                'category_id' => 7,
                'name' => 'Geriatrics',
                'created_by' => 1
            ],
            [
                'id' => 9,
                'category_id' => 7,
                'name' => 'General surgery',
                'created_by' => 1
            ],
            [
                'id' => 10,
                'category_id' => 7,
                'name' => 'Orthopedic surgery',
                'created_by' => 1
            ],
            [
                'id' => 11,
                'category_id' => 7,
                'name' => 'Neurosurgery',
                'created_by' => 1
            ],
            [
                'id' => 12,
                'category_id' => 7,
                'name' => 'Cardiology',
                'created_by' => 1
            ],
            [
                'id' => 13,
                'category_id' => 7,
                'name' => 'Dermatology',
                'created_by' => 1
            ],
            [
                'id' => 14,
                'category_id' => 7,
                'name' => 'Gastroenterology',
                'created_by' => 1
            ],
            [
                'id' => 15,
                'category_id' => 7,
                'name' => 'Endocrinology',
                'created_by' => 1
            ],
            [
                'id' => 16,
                'category_id' => 7,
                'name' => 'Pulmonology',
                'created_by' => 1
            ],
            [
                'id' => 17,
                'category_id' => 7,
                'name' => 'Oncology',
                'created_by' => 1
            ],
            [
                'id' => 18,
                'category_id' => 7,
                'name' => 'Psychiatry',
                'created_by' => 1
            ],
            [
                'id' => 19,
                'category_id' => 7,
                'name' => 'Neurology',
                'created_by' => 1
            ],
            [
                'id' => 20,
                'category_id' => 7,
                'name' => 'Radiology',
                'created_by' => 1
            ],
            [
                'id' => 21,
                'category_id' => 7,
                'name' => 'Pathology',
                'created_by' => 1
            ],
            [
                'id' => 22,
                'category_id' => 7,
                'name' => 'Infectious disease',
                'created_by' => 1
            ],
            [
                'id' => 23,
                'category_id' => 7,
                'name' => 'Allergy and immunology',
                'created_by' => 1
            ],
            [
                'id' => 24,
                'category_id' => 7,
                'name' => 'Rheumatology',
                'created_by' => 1
            ],
            [
                'id' => 25,
                'category_id' => 7,
                'name' => 'Ophthalmology',
                'created_by' => 1
            ],
            [
                'id' => 26,
                'category_id' => 7,
                'name' => 'ENT (ear, nose, throat)',
                'created_by' => 1
            ],
            [
                'id' => 27,
                'category_id' => 7,
                'name' => 'Emergency care',
                'created_by' => 1
            ],
            [
                'id' => 28,
                'category_id' => 7,
                'name' => 'Preventive care',
                'created_by' => 1
            ],
            [
                'id' => 29,
                'category_id' => 7,
                'name' => 'Chronic disease management',
                'created_by' => 1
            ],
            [
                'id' => 30,
                'category_id' => 7,
                'name' => 'Telemedicine',
                'created_by' => 1
            ],
            [
                'id' => 31,
                'category_id' => 7,
                'name' => 'Urgent care center',
                'created_by' => 1
            ],
            [
                'id' => 32,
                'category_id' => 4,
                'name' => 'Lawyer',
                'created_by' => 1
            ],
            [
                'id' => 33,
                'category_id' => 4,
                'name' => 'Attorney',
                'created_by' => 1
            ],
            [
                'id' => 34,
                'category_id' => 4,
                'name' => 'Legal counsel',
                'created_by' => 1
            ],
            [
                'id' => 35,
                'category_id' => 4,
                'name' => 'Law firm',
                'created_by' => 1
            ],
            [
                'id' => 36,
                'category_id' => 4,
                'name' => 'Criminal defense lawyer',
                'created_by' => 1
            ],
            [
                'id' => 37,
                'category_id' => 4,
                'name' => 'Personal injury lawyer',
                'created_by' => 1
            ],
            [
                'id' => 38,
                'category_id' => 4,
                'name' => 'Family lawyer',
                'created_by' => 1
            ],
            [
                'id' => 39,
                'category_id' => 4,
                'name' => 'Divorce lawyer',
                'created_by' => 1
            ],
            [
                'id' => 40,
                'category_id' => 4,
                'name' => 'Child custody lawyer',
                'created_by' => 1
            ],
            [
                'id' => 41,
                'category_id' => 4,
                'name' => 'Estate planning lawyer',
                'created_by' => 1
            ],
            [
                'id' => 42,
                'category_id' => 4,
                'name' => 'Probate lawyer',
                'created_by' => 1
            ],
            [
                'id' => 43,
                'category_id' => 4,
                'name' => 'Business lawyer',
                'created_by' => 1
            ],
            [
                'id' => 44,
                'category_id' => 4,
                'name' => 'Corporate lawyer',
                'created_by' => 1
            ],
            [
                'id' => 45,
                'category_id' => 4,
                'name' => 'Contract lawyer',
                'created_by' => 1
            ],
            [
                'id' => 46,
                'category_id' => 4,
                'name' => 'Employment lawyer',
                'created_by' => 1
            ],
            [
                'id' => 47,
                'category_id' => 4,
                'name' => 'Labor lawyer',
                'created_by' => 1
            ],
            [
                'id' => 48,
                'category_id' => 4,
                'name' => 'Immigration lawyer',
                'created_by' => 1
            ],
            [
                'id' => 49,
                'category_id' => 4,
                'name' => 'Bankruptcy lawyer',
                'created_by' => 1
            ],
            [
                'id' => 50,
                'category_id' => 4,
                'name' => 'Real estate lawyer',
                'created_by' => 1
            ],
            [
                'id' => 51,
                'category_id' => 4,
                'name' => 'Tax lawyer',
                'created_by' => 1
            ],
            [
                'id' => 52,
                'category_id' => 4,
                'name' => 'Intellectual property lawyer',
                'created_by' => 1
            ],
            [
                'id' => 53,
                'category_id' => 4,
                'name' => 'Patent lawyer',
                'created_by' => 1
            ],
            [
                'id' => 54,
                'category_id' => 4,
                'name' => 'Trademark lawyer',
                'created_by' => 1
            ],
            [
                'id' => 55,
                'category_id' => 4,
                'name' => 'Civil litigation lawyer',
                'created_by' => 1
            ],
            [
                'id' => 56,
                'category_id' => 4,
                'name' => 'Trial lawyer',
                'created_by' => 1
            ],
            [
                'id' => 57,
                'category_id' => 4,
                'name' => 'Defense attorney',
                'created_by' => 1
            ],
            [
                'id' => 58,
                'category_id' => 4,
                'name' => 'Prosecutor',
                'created_by' => 1
            ],
            [
                'id' => 59,
                'category_id' => 4,
                'name' => 'Legal advisor',
                'created_by' => 1
            ],
            [
                'id' => 60,
                'category_id' => 4,
                'name' => 'Legal consultation',
                'created_by' => 1
            ],
            [
                'id' => 61,
                'category_id' => 4,
                'name' => 'Lawsuit representation',
                'created_by' => 1
            ],
            [
                'id' => 62,
                'category_id' => 4,
                'name' => 'Mediation services',
                'created_by' => 1
            ],


            [
                'id' => 63,
                'category_id' => 8,
                'name' => 'Car',
                'created_by' => 1
            ],
            [
                'id' => 64,
                'category_id' => 8,
                'name' => 'Automobile',
                'created_by' => 1
            ],
            [
                'id' => 65,
                'category_id' => 8,
                'name' => 'Vehicle',
                'created_by' => 1
            ],
            [
                'id' => 66,
                'category_id' => 8,
                'name' => 'Car sales',
                'created_by' => 1
            ],
            [
                'id' => 67,
                'category_id' => 8,
                'name' => 'Car dealership',
                'created_by' => 1
            ],
            [
                'id' => 68,
                'category_id' => 8,
                'name' => 'Used cars',
                'created_by' => 1
            ],
            [
                'id' => 69,
                'category_id' => 8,
                'name' => 'New cars',
                'created_by' => 1
            ],
            [
                'id' => 70,
                'category_id' => 8,
                'name' => 'Car leasing',
                'created_by' => 1
            ],
            [
                'id' => 71,
                'category_id' => 8,
                'name' => 'Car financing',
                'created_by' => 1
            ],
            [
                'id' => 72,
                'category_id' => 8,
                'name' => 'Auto loan',
                'created_by' => 1
            ],
            [
                'id' => 73,
                'category_id' => 8,
                'name' => 'Car insurance',
                'created_by' => 1
            ],
            [
                'id' => 74,
                'category_id' => 8,
                'name' => 'Car repair',
                'created_by' => 1
            ],
            [
                'id' => 75,
                'category_id' => 8,
                'name' => 'Auto body repair',
                'created_by' => 1
            ],
            [
                'id' => 76,
                'category_id' => 8,
                'name' => 'Tire replacement',
                'created_by' => 1
            ],
            [
                'id' => 77,
                'category_id' => 8,
                'name' => 'Oil change',
                'created_by' => 1
            ],
            [
                'id' => 78,
                'category_id' => 8,
                'name' => 'Auto parts',
                'created_by' => 1
            ],
            [
                'id' => 79,
                'category_id' => 8,
                'name' => 'Car maintenance',
                'created_by' => 1
            ],
            [
                'id' => 80,
                'category_id' => 8,
                'name' => 'Car detailing',
                'created_by' => 1
            ],
            [
                'id' => 81,
                'category_id' => 8,
                'name' => 'Car accessories',
                'created_by' => 1
            ],
            [
                'id' => 82,
                'category_id' => 8,
                'name' => 'Car rental',
                'created_by' => 1
            ],
            [
                'id' => 83,
                'category_id' => 8,
                'name' => 'Auto services',
                'created_by' => 1
            ],
            [
                'id' => 84,
                'category_id' => 8,
                'name' => 'Car dealership near me',
                'created_by' => 1
            ],
            [
                'id' => 85,
                'category_id' => 8,
                'name' => 'Car for sale',
                'created_by' => 1
            ],
            [
                'id' => 86,
                'category_id' => 8,
                'name' => 'Buy a car',
                'created_by' => 1
            ],
            [
                'id' => 87,
                'category_id' => 8,
                'name' => 'Sell a car',
                'created_by' => 1
            ],
            [
                'id' => 88,
                'category_id' => 8,
                'name' => 'Car buying guide',
                'created_by' => 1
            ],
            [
                'id' => 89,
                'category_id' => 8,
                'name' => 'Car reviews',
                'created_by' => 1
            ],
            [
                'id' => 90,
                'category_id' => 8,
                'name' => 'Car models',
                'created_by' => 1
            ],
            [
                'id' => 91,
                'category_id' => 8,
                'name' => 'Electric vehicles',
                'created_by' => 1
            ],
            [
                'id' => 92,
                'category_id' => 8,
                'name' => 'Hybrid cars',
                'created_by' => 1
            ],


            [
                'id' => 93,
                'category_id' => 8,
                'name' => 'SUV',
                'created_by' => 1
            ],

            [
                'id' => 94,
                'category_id' => 9,
                'name' => 'Education',
                'created_by' => 1
            ],

            [
                'id' => 95,
                'category_id' => 9,
                'name' => 'Tutor',
                'created_by' => 1
            ],
            [
                'id' => 96,
                'category_id' => 9,
                'name' => 'School',
                'created_by' => 1
            ],
            [
                'id' => 97,
                'category_id' => 9,
                'name' => 'Private school',
                'created_by' => 1
            ],
            [
                'id' => 98,
                'category_id' => 9,
                'name' => 'Religious school',
                'created_by' => 1
            ],
            [
                'id' => 99,
                'category_id' => 9,
                'name' => 'Islamic school',
                'created_by' => 1
            ],
            [
                'id' => 100,
                'category_id' => 9,
                'name' => 'Muslim school',
                'created_by' => 1
            ],
            [
                'id' => 101,
                'category_id' => 9,
                'name' => 'Faith-based education',
                'created_by' => 1
            ],
            [
                'id' => 102,
                'category_id' => 9,
                'name' => 'Sunday school',
                'created_by' => 1
            ],
            [
                'id' => 103,
                'category_id' => 9,
                'name' => 'Weekend school',
                'created_by' => 1
            ],
            [
                'id' => 104,
                'category_id' => 9,
                'name' => 'Quran classes',
                'created_by' => 1
            ],
            [
                'id' => 105,
                'category_id' => 9,
                'name' => 'Arabic classes',
                'created_by' => 1
            ],
            [
                'id' => 106,
                'category_id' => 9,
                'name' => 'Islamic studies',
                'created_by' => 1
            ],


            [
                'id' => 107,
                'category_id' => 9,
                'name' => 'Online Islamic school',
                'created_by' => 1
            ],
            [
                'id' => 108,
                'category_id' => 9,
                'name' => 'Full-time Islamic school',
                'created_by' => 1
            ],
            [
                'id' => 109,
                'category_id' => 9,
                'name' => 'After-school program',
                'created_by' => 1
            ],
            [
                'id' => 110,
                'category_id' => 9,
                'name' => 'Homeschool support',
                'created_by' => 1
            ],
            [
                'id' => 111,
                'category_id' => 9,
                'name' => 'Preschool',
                'created_by' => 1
            ],
            [
                'id' => 112,
                'category_id' => 9,
                'name' => 'Elementary school',
                'created_by' => 1
            ],
            [
                'id' => 113,
                'category_id' => 9,
                'name' => 'Middle school',
                'created_by' => 1
            ],
            [
                'id' => 114,
                'category_id' => 9,
                'name' => 'High school',
                'created_by' => 1
            ],
            [
                'id' => 115,
                'category_id' => 9,
                'name' => 'K-12 education',
                'created_by' => 1
            ],
            [
                'id' => 116,
                'category_id' => 9,
                'name' => 'Academic tutoring',
                'created_by' => 1
            ],
            [
                'id' => 117,
                'category_id' => 9,
                'name' => 'Character education',
                'created_by' => 1
            ],
            [
                'id' => 118,
                'category_id' => 9,
                'name' => 'Moral education',
                'created_by' => 1
            ],
            [
                'id' => 119,
                'category_id' => 9,
                'name' => 'Religious education',
                'created_by' => 1
            ],
            [
                'id' => 120,
                'category_id' => 9,
                'name' => 'Islamic curriculum',
                'created_by' => 1
            ],
            [
                'id' => 121,
                'category_id' => 9,
                'name' => 'Islamic learning center',
                'created_by' => 1
            ],
            [
                'id' => 122,
                'category_id' => 9,
                'name' => 'Youth education programs',
                'created_by' => 1
            ],

            [
                'id' => 123,
                'category_id' => 9,
                'name' => 'Enrichment classes',
                'created_by' => 1
            ],



            [
                'id' => 124,
                'category_id' => 3,
                'name' => 'Doctor',
                'created_by' => 1
            ],
            [
                'id' => 125,
                'category_id' => 3,
                'name' => 'Physician',
                'created_by' => 1
            ],
            [
                'id' => 126,
                'category_id' => 3,
                'name' => 'Healthcare provider',
                'created_by' => 1
            ],
            [
                'id' => 127,
                'category_id' => 3,
                'name' => 'Consultant',
                'created_by' => 1
            ],
            [
                'id' => 128,
                'category_id' => 3,
                'name' => 'Family medicine',
                'created_by' => 1
            ],
            [
                'id' => 129,
                'category_id' => 3,
                'name' => 'Internal medicine',
                'created_by' => 1
            ],
            [
                'id' => 130,
                'category_id' => 3,
                'name' => 'Pediatrics',
                'created_by' => 1
            ],
            [
                'id' => 131,
                'category_id' => 3,
                'name' => 'Geriatrics',
                'created_by' => 1
            ],
            [
                'id' => 132,
                'category_id' => 3,
                'name' => 'General surgery',
                'created_by' => 1
            ],
            [
                'id' => 133,
                'category_id' => 3,
                'name' => 'Orthopedic surgery',
                'created_by' => 1
            ],
            [
                'id' => 134,
                'category_id' => 3,
                'name' => 'Neurosurgery',
                'created_by' => 1
            ],
            [
                'id' => 135,
                'category_id' => 3,
                'name' => 'Cardiology',
                'created_by' => 1
            ],
            [
                'id' => 136,
                'category_id' => 3,
                'name' => 'Dermatology',
                'created_by' => 1
            ],
            [
                'id' => 137,
                'category_id' => 3,
                'name' => 'Gastroenterology',
                'created_by' => 1
            ],
            [
                'id' => 138,
                'category_id' => 3,
                'name' => 'Endocrinology',
                'created_by' => 1
            ],


            [
                'id' => 139,
                'category_id' => 3,
                'name' => 'Pulmonology',
                'created_by' => 1
            ],
            [
                'id' => 140,
                'category_id' => 3,
                'name' => 'Oncology',
                'created_by' => 1
            ],
            [
                'id' => 141,
                'category_id' => 3,
                'name' => 'Psychiatry',
                'created_by' => 1
            ],
            [
                'id' => 142,
                'category_id' => 3,
                'name' => 'Neurology',
                'created_by' => 1
            ],
            [
                'id' => 143,
                'category_id' => 3,
                'name' => 'Radiology',
                'created_by' => 1
            ],
            [
                'id' => 144,
                'category_id' => 3,
                'name' => 'Pathology',
                'created_by' => 1
            ],
            [
                'id' => 145,
                'category_id' => 3,
                'name' => 'Infectious disease',
                'created_by' => 1
            ],
            [
                'id' => 146,
                'category_id' => 3,
                'name' => 'Allergy and immunology',
                'created_by' => 1
            ],
            [
                'id' => 147,
                'category_id' => 3,
                'name' => 'Rheumatology',
                'created_by' => 1
            ],


            [
                'id' => 148,
                'category_id' => 3,
                'name' => 'Ophthalmology',
                'created_by' => 1
            ],
            [
                'id' => 149,
                'category_id' => 3,
                'name' => 'ENT (ear, nose, throat)',
                'created_by' => 1
            ],
            [
                'id' => 150,
                'category_id' => 3,
                'name' => 'Emergency care',
                'created_by' => 1
            ],
            [
                'id' => 151,
                'category_id' => 3,
                'name' => 'Preventive care',
                'created_by' => 1
            ],
            [
                'id' => 152,
                'category_id' => 3,
                'name' => 'Chronic disease management',
                'created_by' => 1
            ],

            [
                'id' => 153,
                'category_id' => 3,
                'name' => 'Telemedicine',
                'created_by' => 1
            ],

            [
                'id' => 154,
                'category_id' => 3,
                'name' => 'Urgent care center',
                'created_by' => 1
            ],


            [
                'id' => 155,
                'category_id' => 10,
                'name' => 'Financial services',
                'created_by' => 1
            ],
            [
                'id' => 156,
                'category_id' => 10,
                'name' => 'Banking',
                'created_by' => 1
            ],
            [
                'id' => 157,
                'category_id' => 10,
                'name' => 'Personal finance',
                'created_by' => 1
            ],
            [
                'id' => 158,
                'category_id' => 10,
                'name' => 'Business finance',
                'created_by' => 1
            ],
            [
                'id' => 159,
                'category_id' => 10,
                'name' => 'Investment',
                'created_by' => 1
            ],
            [
                'id' => 160,
                'category_id' => 10,
                'name' => 'Wealth management',
                'created_by' => 1
            ],
            [
                'id' => 161,
                'category_id' => 10,
                'name' => 'Financial planning',
                'created_by' => 1
            ],
            [
                'id' => 162,
                'category_id' => 10,
                'name' => 'Financial advisor',
                'created_by' => 1
            ],
            [
                'id' => 163,
                'category_id' => 10,
                'name' => 'Equity financing',
                'created_by' => 1
            ],
            [
                'id' => 164,
                'category_id' => 10,
                'name' => 'Stocks and shares',
                'created_by' => 1
            ],
            [
                'id' => 165,
                'category_id' => 10,
                'name' => 'Mutual funds',
                'created_by' => 1
            ],
            [
                'id' => 166,
                'category_id' => 10,
                'name' => 'Retirement planning',
                'created_by' => 1
            ],
            [
                'id' => 167,
                'category_id' => 10,
                'name' => 'Insurance',
                'created_by' => 1
            ],


            [
                'id' => 168,
                'category_id' => 10,
                'name' => 'Life insurance',
                'created_by' => 1
            ],
            [
                'id' => 169,
                'category_id' => 10,
                'name' => 'Health insurance',
                'created_by' => 1
            ],
            [
                'id' => 170,
                'category_id' => 10,
                'name' => 'Auto insurance',
                'created_by' => 1
            ],
            [
                'id' => 171,
                'category_id' => 10,
                'name' => 'Home insurance',
                'created_by' => 1
            ],
            [
                'id' => 172,
                'category_id' => 10,
                'name' => 'Mortgage',
                'created_by' => 1
            ],
            [
                'id' => 173,
                'category_id' => 10,
                'name' => 'Home loan',
                'created_by' => 1
            ],
            [
                'id' => 174,
                'category_id' => 10,
                'name' => 'Halal mortgage',
                'created_by' => 1
            ],
            [
                'id' => 175,
                'category_id' => 10,
                'name' => 'Islamic financing',
                'created_by' => 1
            ],
            [
                'id' => 176,
                'category_id' => 10,
                'name' => 'Halal lending',
                'created_by' => 1
            ],
            [
                'id' => 177,
                'category_id' => 10,
                'name' => 'Sharia-compliant loan',
                'created_by' => 1
            ],
            [
                'id' => 178,
                'category_id' => 10,
                'name' => 'Interest-free loan',
                'created_by' => 1
            ],
            [
                'id' => 179,
                'category_id' => 10,
                'name' => 'Islamic banking',
                'created_by' => 1
            ],
            [
                'id' => 180,
                'category_id' => 10,
                'name' => 'Halal investment',
                'created_by' => 1
            ],
            [
                'id' => 181,
                'category_id' => 10,
                'name' => 'Credit union',
                'created_by' => 1
            ],
            [
                'id' => 182,
                'category_id' => 10,
                'name' => 'Loan services',
                'created_by' => 1
            ],
            [
                'id' => 183,
                'category_id' => 10,
                'name' => 'Debt consolidation',
                'created_by' => 1
            ],
            [
                'id' => 184,
                'category_id' => 10,
                'name' => 'Credit repair',
                'created_by' => 1
            ],
            [
                'id' => 185,
                'category_id' => 10,
                'name' => 'Budgeting services',
                'created_by' => 1
            ],


            [
                'id' => 186,
                'category_id' => 11,
                'name' => 'Car',
                'created_by' => 1
            ],
            [
                'id' => 187,
                'category_id' => 11,
                'name' => 'Mechanic',
                'created_by' => 1
            ],
            [
                'id' => 188,
                'category_id' => 11,
                'name' => 'Automobile',
                'created_by' => 1
            ],
            [
                'id' => 189,
                'category_id' => 11,
                'name' => 'Vehicle',
                'created_by' => 1
            ],
            [
                'id' => 190,
                'category_id' => 11,
                'name' => 'Car sales',
                'created_by' => 1
            ],
            [
                'id' => 191,
                'category_id' => 11,
                'name' => 'Car dealership',
                'created_by' => 1
            ],
            [
                'id' => 192,
                'category_id' => 11,
                'name' => 'Used cars',
                'created_by' => 1
            ],
            [
                'id' => 193,
                'category_id' => 11,
                'name' => 'New cars',
                'created_by' => 1
            ],
            [
                'id' => 194,
                'category_id' => 11,
                'name' => 'Car leasing',
                'created_by' => 1
            ],
            [
                'id' => 195,
                'category_id' => 11,
                'name' => 'Car financing',
                'created_by' => 1
            ],
            [
                'id' => 196,
                'category_id' => 11,
                'name' => 'Auto loan',
                'created_by' => 1
            ],
            [
                'id' => 197,
                'category_id' => 11,
                'name' => 'Car insurance',
                'created_by' => 1
            ],
            [
                'id' => 198,
                'category_id' => 11,
                'name' => 'Car repair',
                'created_by' => 1
            ],
            [
                'id' => 199,
                'category_id' => 11,
                'name' => 'Auto body repair',
                'created_by' => 1
            ],
            [
                'id' => 200,
                'category_id' => 11,
                'name' => 'Tire replacement',
                'created_by' => 1
            ],
            [
                'id' => 201,
                'category_id' => 11,
                'name' => 'Oil change',
                'created_by' => 1
            ],
            [
                'id' => 202,
                'category_id' => 11,
                'name' => 'Auto parts',
                'created_by' => 1
            ],
            [
                'id' => 203,
                'category_id' => 11,
                'name' => 'Car maintenance',
                'created_by' => 1
            ],


            [
                'id' => 204,
                'category_id' => 11,
                'name' => 'Car detailing',
                'created_by' => 1
            ],
            [
                'id' => 205,
                'category_id' => 11,
                'name' => 'Car accessories',
                'created_by' => 1
            ],
            [
                'id' => 206,
                'category_id' => 11,
                'name' => 'Car rental',
                'created_by' => 1
            ],
            [
                'id' => 207,
                'category_id' => 11,
                'name' => 'Auto services',
                'created_by' => 1
            ],
            [
                'id' => 208,
                'category_id' => 11,
                'name' => 'Car dealership near me',
                'created_by' => 1
            ],
            [
                'id' => 209,
                'category_id' => 11,
                'name' => 'Car for sale',
                'created_by' => 1
            ],
            [
                'id' => 210,
                'category_id' => 11,
                'name' => 'Buy a car',
                'created_by' => 1
            ],
            [
                'id' => 211,
                'category_id' => 11,
                'name' => 'Sell a car',
                'created_by' => 1
            ],
            [
                'id' => 212,
                'category_id' => 11,
                'name' => 'Car buying guide',
                'created_by' => 1
            ],
            [
                'id' => 213,
                'category_id' => 11,
                'name' => 'Car reviews',
                'created_by' => 1
            ],
            [
                'id' => 214,
                'category_id' => 11,
                'name' => 'Car models',
                'created_by' => 1
            ],
            [
                'id' => 215,
                'category_id' => 11,
                'name' => 'Electric vehicles',
                'created_by' => 1
            ],
            [
                'id' => 216,
                'category_id' => 11,
                'name' => 'Hybrid cars',
                'created_by' => 1
            ],


            [
                'id' => 217,
                'category_id' => 12,
                'name' => 'Insurance',
                'created_by' => 1
            ],
            [
                'id' => 218,
                'category_id' => 12,
                'name' => 'Home insurance',
                'created_by' => 1
            ],
            [
                'id' => 219,
                'category_id' => 12,
                'name' => 'Renters insurance',
                'created_by' => 1
            ],
            [
                'id' => 220,
                'category_id' => 12,
                'name' => 'Property insurance',
                'created_by' => 1
            ],
            [
                'id' => 221,
                'category_id' => 12,
                'name' => 'Auto insurance',
                'created_by' => 1
            ],
            [
                'id' => 222,
                'category_id' => 12,
                'name' => 'Car insurance',
                'created_by' => 1
            ],
            [
                'id' => 223,
                'category_id' => 12,
                'name' => 'Vehicle coverage',
                'created_by' => 1
            ],
            [
                'id' => 224,
                'category_id' => 12,
                'name' => 'Life insurance',
                'created_by' => 1
            ],
            [
                'id' => 225,
                'category_id' => 12,
                'name' => 'Term life insurance',
                'created_by' => 1
            ],
            [
                'id' => 226,
                'category_id' => 12,
                'name' => 'Whole life insurance',
                'created_by' => 1
            ],
            [
                'id' => 227,
                'category_id' => 12,
                'name' => 'Health insurance',
                'created_by' => 1
            ],
            [
                'id' => 228,
                'category_id' => 12,
                'name' => 'Medical insurance',
                'created_by' => 1
            ],
            [
                'id' => 229,
                'category_id' => 12,
                'name' => 'Dental insurance',
                'created_by' => 1
            ],

            [
                'id' => 230,
                'category_id' => 12,
                'name' => 'Vision insurance',
                'created_by' => 1
            ],
            [
                'id' => 231,
                'category_id' => 12,
                'name' => 'Travel insurance',
                'created_by' => 1
            ],
            [
                'id' => 232,
                'category_id' => 12,
                'name' => 'Business insurance',
                'created_by' => 1
            ],
            [
                'id' => 233,
                'category_id' => 12,
                'name' => 'Commercial insurance',
                'created_by' => 1
            ],
            [
                'id' => 234,
                'category_id' => 12,
                'name' => 'Liability insurance',
                'created_by' => 1
            ],
            [
                'id' => 235,
                'category_id' => 12,
                'name' => "Workers' compensation",
                'created_by' => 1
            ],
            [
                'id' => 236,
                'category_id' => 12,
                'name' => 'Flood insurance',
                'created_by' => 1
            ],
            [
                'id' => 237,
                'category_id' => 12,
                'name' => 'Fire insurance',
                'created_by' => 1
            ],
            [
                'id' => 238,
                'category_id' => 12,
                'name' => 'Umbrella insurance',
                'created_by' => 1
            ],

            [
                'id' => 239,
                'category_id' => 12,
                'name' => 'Insurance quote',
                'created_by' => 1
            ],
            [
                'id' => 240,
                'category_id' => 12,
                'name' => 'Affordable insurance',
                'created_by' => 1
            ],
            [
                'id' => 241,
                'category_id' => 12,
                'name' => 'Insurance agent',
                'created_by' => 1
            ],
            [
                'id' => 242,
                'category_id' => 12,
                'name' => 'Insurance broker',
                'created_by' => 1
            ],
            [
                'id' => 243,
                'category_id' => 12,
                'name' => 'Insurance policy',
                'created_by' => 1
            ],
            [
                'id' => 244,
                'category_id' => 12,
                'name' => 'Insurance coverage',
                'created_by' => 1
            ],
            [
                'id' => 245,
                'category_id' => 12,
                'name' => 'Compare insurance',
                'created_by' => 1
            ],
            [
                'id' => 246,
                'category_id' => 12,
                'name' => 'Online insurance',
                'created_by' => 1
            ],


            [
                'id' => 247,
                'category_id' => 2,
                'name' => 'Technology',
                'created_by' => 1
            ],
            [
                'id' => 248,
                'category_id' => 2,
                'name' => 'Tech consultant',
                'created_by' => 1
            ],
            [
                'id' => 249,
                'category_id' => 2,
                'name' => 'IT consultant',
                'created_by' => 1
            ],
            [
                'id' => 250,
                'category_id' => 2,
                'name' => 'Technology services',
                'created_by' => 1
            ],
            [
                'id' => 251,
                'category_id' => 2,
                'name' => 'Tech support',
                'created_by' => 1
            ],
            [
                'id' => 252,
                'category_id' => 2,
                'name' => 'Computer repair',
                'created_by' => 1
            ],
            [
                'id' => 253,
                'category_id' => 2,
                'name' => 'Laptop repair',
                'created_by' => 1
            ],
            [
                'id' => 254,
                'category_id' => 2,
                'name' => 'Desktop computer',
                'created_by' => 1
            ],
            [
                'id' => 255,
                'category_id' => 2,
                'name' => 'Business IT services',
                'created_by' => 1
            ],
            [
                'id' => 256,
                'category_id' => 2,
                'name' => 'Cloud services',
                'created_by' => 1
            ],
            [
                'id' => 257,
                'category_id' => 2,
                'name' => 'Network setup',
                'created_by' => 1
            ],
            [
                'id' => 258,
                'category_id' => 2,
                'name' => 'Cybersecurity',
                'created_by' => 1
            ],
            [
                'id' => 259,
                'category_id' => 2,
                'name' => 'Data recovery',
                'created_by' => 1
            ],
            [
                'id' => 260,
                'category_id' => 2,
                'name' => 'Managed IT services',
                'created_by' => 1
            ],
            [
                'id' => 261,
                'category_id' => 2,
                'name' => 'Software installation',
                'created_by' => 1
            ],
            [
                'id' => 262,
                'category_id' => 2,
                'name' => 'Hardware upgrades',
                'created_by' => 1
            ],
            [
                'id' => 263,
                'category_id' => 2,
                'name' => 'Mobile phones',
                'created_by' => 1
            ],
            [
                'id' => 264,
                'category_id' => 2,
                'name' => 'Smartphones',
                'created_by' => 1
            ],
            [
                'id' => 265,
                'category_id' => 2,
                'name' => 'iPhone',
                'created_by' => 1
            ],
            [
                'id' => 266,
                'category_id' => 2,
                'name' => 'Android phone',
                'created_by' => 1
            ],
            [
                'id' => 267,
                'category_id' => 2,
                'name' => 'Phone repair',
                'created_by' => 1
            ],
            [
                'id' => 268,
                'category_id' => 2,
                'name' => 'Screen replacement',
                'created_by' => 1
            ],
            [
                'id' => 269,
                'category_id' => 2,
                'name' => 'Tablet repair',
                'created_by' => 1
            ],
            [
                'id' => 270,
                'category_id' => 2,
                'name' => 'Tech accessories',
                'created_by' => 1
            ],
            [
                'id' => 271,
                'category_id' => 2,
                'name' => 'Computer store',
                'created_by' => 1
            ],
            [
                'id' => 272,
                'category_id' => 2,
                'name' => 'Phone store',
                'created_by' => 1
            ],
            [
                'id' => 273,
                'category_id' => 2,
                'name' => 'Electronics repair',
                'created_by' => 1
            ],
            [
                'id' => 274,
                'category_id' => 2,
                'name' => 'Tech solutions',
                'created_by' => 1
            ],
            [
                'id' => 275,
                'category_id' => 2,
                'name' => 'IT outsourcing',
                'created_by' => 1
            ],
            [
                'id' => 276,
                'category_id' => 2,
                'name' => 'Remote tech support',
                'created_by' => 1
            ],


            [
                'id' => 277,
                'category_id' => 13,
                'name' => 'Real estate',
                'created_by' => 1
            ],
            [
                'id' => 278,
                'category_id' => 13,
                'name' => 'Real estate agent',
                'created_by' => 1
            ],
            [
                'id' => 279,
                'category_id' => 13,
                'name' => 'Realtor',
                'created_by' => 1
            ],
            [
                'id' => 280,
                'category_id' => 13,
                'name' => 'Real estate broker',
                'created_by' => 1
            ],
            [
                'id' => 281,
                'category_id' => 13,
                'name' => 'Real estate agency',
                'created_by' => 1
            ],
            [
                'id' => 282,
                'category_id' => 13,
                'name' => 'Buy a home',
                'created_by' => 1
            ],
            [
                'id' => 283,
                'category_id' => 13,
                'name' => 'Sell a home',
                'created_by' => 1
            ],
            [
                'id' => 284,
                'category_id' => 13,
                'name' => 'Homes for sale',
                'created_by' => 1
            ],
            [
                'id' => 285,
                'category_id' => 13,
                'name' => 'Property for sale',
                'created_by' => 1
            ],
            [
                'id' => 286,
                'category_id' => 13,
                'name' => 'Real estate listings',
                'created_by' => 1
            ],
            [
                'id' => 287,
                'category_id' => 13,
                'name' => 'House listings',
                'created_by' => 1
            ],
            [
                'id' => 288,
                'category_id' => 13,
                'name' => 'Commercial property',
                'created_by' => 1
            ],
            [
                'id' => 289,
                'category_id' => 13,
                'name' => 'Residential property',
                'created_by' => 1
            ],
            [
                'id' => 290,
                'category_id' => 13,
                'name' => 'Investment property',
                'created_by' => 1
            ],
            [
                'id' => 291,
                'category_id' => 13,
                'name' => 'Luxury real estate',
                'created_by' => 1
            ],
            [
                'id' => 292,
                'category_id' => 13,
                'name' => 'First-time homebuyer',
                'created_by' => 1
            ],
            [
                'id' => 293,
                'category_id' => 13,
                'name' => 'Open houses',
                'created_by' => 1
            ],
            [
                'id' => 294,
                'category_id' => 13,
                'name' => 'Property search',
                'created_by' => 1
            ],
            [
                'id' => 295,
                'category_id' => 13,
                'name' => 'Local real estate agent',
                'created_by' => 1
            ],
            [
                'id' => 296,
                'category_id' => 13,
                'name' => 'Top realtors',
                'created_by' => 1
            ],
            [
                'id' => 297,
                'category_id' => 13,
                'name' => 'Real estate market',
                'created_by' => 1
            ],
            [
                'id' => 298,
                'category_id' => 13,
                'name' => 'Home valuation',
                'created_by' => 1
            ],
            [
                'id' => 299,
                'category_id' => 13,
                'name' => 'Property appraisal',
                'created_by' => 1
            ],
            [
                'id' => 300,
                'category_id' => 13,
                'name' => 'Real estate services',
                'created_by' => 1
            ],
            [
                'id' => 301,
                'category_id' => 13,
                'name' => 'Real estate near me',
                'created_by' => 1
            ],
            [
                'id' => 302,
                'category_id' => 13,
                'name' => 'Real estate office',
                'created_by' => 1
            ],
            [
                'id' => 303,
                'category_id' => 13,
                'name' => 'New homes',
                'created_by' => 1
            ],
            [
                'id' => 304,
                'category_id' => 13,
                'name' => 'Condos for sale',
                'created_by' => 1
            ],
            [
                'id' => 305,
                'category_id' => 13,
                'name' => 'Townhomes for sale',
                'created_by' => 1
            ],
            [
                'id' => 306,
                'category_id' => 13,
                'name' => 'Real estate consultation',
                'created_by' => 1
            ],
            [
                'id' => 307,
                'category_id' => 13,
                'name' => 'Real estate expert',
                'created_by' => 1
            ],


            [
                'id' => 308,
                'category_id' => 14,
                'name' => 'Vacation rental',
                'created_by' => 1
            ],
            [
                'id' => 309,
                'category_id' => 14,
                'name' => 'Short-term rental',
                'created_by' => 1
            ],
            [
                'id' => 310,
                'category_id' => 14,
                'name' => 'Rental property',
                'created_by' => 1
            ],
            [
                'id' => 311,
                'category_id' => 14,
                'name' => 'Beach house rental',
                'created_by' => 1
            ],
            [
                'id' => 312,
                'category_id' => 14,
                'name' => 'Lake house rental',
                'created_by' => 1
            ],
            [
                'id' => 313,
                'category_id' => 14,
                'name' => 'Mountain cabin rental',
                'created_by' => 1
            ],
            [
                'id' => 314,
                'category_id' => 14,
                'name' => 'Condo rental',
                'created_by' => 1
            ],
            [
                'id' => 315,
                'category_id' => 14,
                'name' => 'Apartment rental',
                'created_by' => 1
            ],
            [
                'id' => 316,
                'category_id' => 14,
                'name' => 'House rental',
                'created_by' => 1
            ],
            [
                'id' => 317,
                'category_id' => 14,
                'name' => 'Luxury rental',
                'created_by' => 1
            ],
            [
                'id' => 318,
                'category_id' => 14,
                'name' => 'Pet-friendly rental',
                'created_by' => 1
            ],
            [
                'id' => 319,
                'category_id' => 14,
                'name' => 'Family-friendly rental',
                'created_by' => 1
            ],
            [
                'id' => 320,
                'category_id' => 14,
                'name' => 'Group rental',
                'created_by' => 1
            ],
            [
                'id' => 321,
                'category_id' => 14,
                'name' => 'Weekend getaway',
                'created_by' => 1
            ],
            [
                'id' => 322,
                'category_id' => 14,
                'name' => 'Weekly rental',
                'created_by' => 1
            ],
            [
                'id' => 323,
                'category_id' => 14,
                'name' => 'Monthly rental',
                'created_by' => 1
            ],
            [
                'id' => 324,
                'category_id' => 14,
                'name' => 'Extended stay',
                'created_by' => 1
            ],
            [
                'id' => 325,
                'category_id' => 14,
                'name' => 'Furnished rental',
                'created_by' => 1
            ],
            [
                'id' => 326,
                'category_id' => 14,
                'name' => 'Airbnb',
                'created_by' => 1
            ],
            [
                'id' => 327,
                'category_id' => 14,
                'name' => 'Vrbo',
                'created_by' => 1
            ],
            [
                'id' => 328,
                'category_id' => 14,
                'name' => 'Vacation home',
                'created_by' => 1
            ],
            [
                'id' => 329,
                'category_id' => 14,
                'name' => 'Holiday rental',
                'created_by' => 1
            ],
            [
                'id' => 330,
                'category_id' => 14,
                'name' => 'Travel accommodation',
                'created_by' => 1
            ],
            [
                'id' => 331,
                'category_id' => 14,
                'name' => 'Rental near me',
                'created_by' => 1
            ],
            [
                'id' => 332,
                'category_id' => 14,
                'name' => 'Waterfront rental',
                'created_by' => 1
            ],
            [
                'id' => 333,
                'category_id' => 14,
                'name' => 'City rental',
                'created_by' => 1
            ],
            [
                'id' => 334,
                'category_id' => 14,
                'name' => 'Country retreat',
                'created_by' => 1
            ],
            [
                'id' => 335,
                'category_id' => 14,
                'name' => 'Remote rental',
                'created_by' => 1
            ],
            [
                'id' => 336,
                'category_id' => 14,
                'name' => 'Ski rental',
                'created_by' => 1
            ],
            [
                'id' => 337,
                'category_id' => 14,
                'name' => 'Summer rental',
                'created_by' => 1
            ],
            [
                'id' => 338,
                'category_id' => 14,
                'name' => 'Winter rental',
                'created_by' => 1
            ],


            [
                'id' => 339,
                'category_id' => 15,
                'name' => 'Graphic design',
                'created_by' => 1
            ],
            [
                'id' => 340,
                'category_id' => 15,
                'name' => 'Logo design',
                'created_by' => 1
            ],
            [
                'id' => 341,
                'category_id' => 15,
                'name' => 'Branding',
                'created_by' => 1
            ],
            [
                'id' => 342,
                'category_id' => 15,
                'name' => 'Business cards',
                'created_by' => 1
            ],
            [
                'id' => 343,
                'category_id' => 15,
                'name' => 'Brochure design',
                'created_by' => 1
            ],
            [
                'id' => 344,
                'category_id' => 15,
                'name' => 'Flyer design',
                'created_by' => 1
            ],
            [
                'id' => 345,
                'category_id' => 15,
                'name' => 'Poster design',
                'created_by' => 1
            ],
            [
                'id' => 346,
                'category_id' => 15,
                'name' => 'Print design',
                'created_by' => 1
            ],
            [
                'id' => 347,
                'category_id' => 15,
                'name' => 'Printing services',
                'created_by' => 1
            ],
            [
                'id' => 348,
                'category_id' => 15,
                'name' => 'Digital printing',
                'created_by' => 1
            ],
            [
                'id' => 349,
                'category_id' => 15,
                'name' => 'Large format printing',
                'created_by' => 1
            ],
            [
                'id' => 350,
                'category_id' => 15,
                'name' => 'Custom printing',
                'created_by' => 1
            ],
            [
                'id' => 351,
                'category_id' => 15,
                'name' => 'Signage',
                'created_by' => 1
            ],
            [
                'id' => 352,
                'category_id' => 15,
                'name' => 'Banner printing',
                'created_by' => 1
            ],
            [
                'id' => 353,
                'category_id' => 15,
                'name' => 'Marketing materials',
                'created_by' => 1
            ],
            [
                'id' => 354,
                'category_id' => 15,
                'name' => 'Advertising',
                'created_by' => 1
            ],
            [
                'id' => 355,
                'category_id' => 15,
                'name' => 'Digital advertising',
                'created_by' => 1
            ],
            [
                'id' => 356,
                'category_id' => 15,
                'name' => 'Print advertising',
                'created_by' => 1
            ],
            [
                'id' => 357,
                'category_id' => 15,
                'name' => 'Online ads',
                'created_by' => 1
            ],
            [
                'id' => 358,
                'category_id' => 15,
                'name' => 'Social media ads',
                'created_by' => 1
            ],
            [
                'id' => 359,
                'category_id' => 15,
                'name' => 'Google ads',
                'created_by' => 1
            ],
            [
                'id' => 360,
                'category_id' => 15,
                'name' => 'Ad design',
                'created_by' => 1
            ],
            [
                'id' => 361,
                'category_id' => 15,
                'name' => 'Promotional materials',
                'created_by' => 1
            ],
            [
                'id' => 362,
                'category_id' => 15,
                'name' => 'Creative services',
                'created_by' => 1
            ],
            [
                'id' => 363,
                'category_id' => 15,
                'name' => 'Visual design',
                'created_by' => 1
            ],
            [
                'id' => 364,
                'category_id' => 15,
                'name' => 'Design agency',
                'created_by' => 1
            ],
            [
                'id' => 365,
                'category_id' => 15,
                'name' => 'Print shop',
                'created_by' => 1
            ],
            [
                'id' => 366,
                'category_id' => 15,
                'name' => 'Advertising agency',
                'created_by' => 1
            ],
            [
                'id' => 367,
                'category_id' => 15,
                'name' => 'Marketing agency',
                'created_by' => 1
            ],
            [
                'id' => 368,
                'category_id' => 15,
                'name' => 'Custom graphics',
                'created_by' => 1
            ],

            [
                'id' => 369,
                'category_id' => 15,
                'name' => 'Package design',
                'created_by' => 1
            ],


            [
                'id' => 370,
                'category_id' => 16,
                'name' => 'Industrial manufacturing',
                'created_by' => 1
            ],
            [
                'id' => 371,
                'category_id' => 16,
                'name' => 'Fabrication services',
                'created_by' => 1
            ],
            [
                'id' => 372,
                'category_id' => 16,
                'name' => 'Custom fabrication',
                'created_by' => 1
            ],
            [
                'id' => 373,
                'category_id' => 16,
                'name' => 'Metal fabrication',
                'created_by' => 1
            ],
            [
                'id' => 374,
                'category_id' => 16,
                'name' => 'Steel fabrication',
                'created_by' => 1
            ],
            [
                'id' => 375,
                'category_id' => 16,
                'name' => 'Aluminum fabrication',
                'created_by' => 1
            ],
            [
                'id' => 376,
                'category_id' => 16,
                'name' => 'CNC machining',
                'created_by' => 1
            ],
            [
                'id' => 377,
                'category_id' => 16,
                'name' => 'Precision machining',
                'created_by' => 1
            ],
            [
                'id' => 378,
                'category_id' => 16,
                'name' => 'Welding services',
                'created_by' => 1
            ],
            [
                'id' => 379,
                'category_id' => 16,
                'name' => 'Sheet metal work',
                'created_by' => 1
            ],
            [
                'id' => 380,
                'category_id' => 16,
                'name' => 'Laser cutting',
                'created_by' => 1
            ],
            [
                'id' => 381,
                'category_id' => 16,
                'name' => 'Waterjet cutting',
                'created_by' => 1
            ],
            [
                'id' => 382,
                'category_id' => 16,
                'name' => 'Metal cutting',
                'created_by' => 1
            ],
            [
                'id' => 383,
                'category_id' => 16,
                'name' => 'Structural steel',
                'created_by' => 1
            ],
            [
                'id' => 384,
                'category_id' => 16,
                'name' => 'Metal forming',
                'created_by' => 1
            ],
            [
                'id' => 385,
                'category_id' => 16,
                'name' => 'Prototype manufacturing',
                'created_by' => 1
            ],
            [
                'id' => 386,
                'category_id' => 16,
                'name' => 'Production machining',
                'created_by' => 1
            ],
            [
                'id' => 387,
                'category_id' => 16,
                'name' => 'Assembly services',
                'created_by' => 1
            ],
            [
                'id' => 388,
                'category_id' => 16,
                'name' => 'Industrial welding',
                'created_by' => 1
            ],
            [
                'id' => 389,
                'category_id' => 16,
                'name' => 'Custom metalwork',
                'created_by' => 1
            ],
            [
                'id' => 390,
                'category_id' => 16,
                'name' => 'Machining services',
                'created_by' => 1
            ],
            [
                'id' => 391,
                'category_id' => 16,
                'name' => 'Manufacturing solutions',
                'created_by' => 1
            ],
            [
                'id' => 392,
                'category_id' => 16,
                'name' => 'Heavy fabrication',
                'created_by' => 1
            ],
            [
                'id' => 393,
                'category_id' => 16,
                'name' => 'Fabricated components',
                'created_by' => 1
            ],
            [
                'id' => 394,
                'category_id' => 16,
                'name' => 'Industrial parts',
                'created_by' => 1
            ],
            [
                'id' => 395,
                'category_id' => 16,
                'name' => 'Contract manufacturing',
                'created_by' => 1
            ],
            [
                'id' => 396,
                'category_id' => 16,
                'name' => 'OEM manufacturing',
                'created_by' => 1
            ],
            [
                'id' => 397,
                'category_id' => 16,
                'name' => 'Industrial engineering',
                'created_by' => 1
            ],
            [
                'id' => 398,
                'category_id' => 16,
                'name' => 'Custom parts production',
                'created_by' => 1
            ],

            [
                'id' => 399,
                'category_id' => 17,
                'name' => 'Non-profit organization',
                'created_by' => 1
            ],
            [
                'id' => 400,
                'category_id' => 17,
                'name' => 'NGO (Non-Governmental Organization)',
                'created_by' => 1
            ],
            [
                'id' => 401,
                'category_id' => 17,
                'name' => 'Charitable organization',
                'created_by' => 1
            ],
            [
                'id' => 402,
                'category_id' => 17,
                'name' => 'Aid organization',
                'created_by' => 1
            ],
            [
                'id' => 403,
                'category_id' => 17,
                'name' => 'Relief organization',
                'created_by' => 1
            ],
            [
                'id' => 404,
                'category_id' => 17,
                'name' => 'Humanitarian organization',
                'created_by' => 1
            ],
            [
                'id' => 405,
                'category_id' => 17,
                'name' => 'Non-profit services',
                'created_by' => 1
            ],
            [
                'id' => 406,
                'category_id' => 17,
                'name' => 'Social services',
                'created_by' => 1
            ],
            [
                'id' => 407,
                'category_id' => 17,
                'name' => 'Community outreach',
                'created_by' => 1
            ],
            [
                'id' => 408,
                'category_id' => 17,
                'name' => 'Volunteer organization',
                'created_by' => 1
            ],
            [
                'id' => 409,
                'category_id' => 17,
                'name' => 'Charity',
                'created_by' => 1
            ],
            [
                'id' => 410,
                'category_id' => 17,
                'name' => 'Donation-based organization',
                'created_by' => 1
            ],
            [
                'id' => 411,
                'category_id' => 17,
                'name' => 'Non-profit funding',
                'created_by' => 1
            ],
            [
                'id' => 412,
                'category_id' => 17,
                'name' => 'Crisis relief',
                'created_by' => 1
            ],
            [
                'id' => 413,
                'category_id' => 17,
                'name' => 'Disaster relief',
                'created_by' => 1
            ],
            [
                'id' => 414,
                'category_id' => 17,
                'name' => 'Emergency aid',
                'created_by' => 1
            ],
            [
                'id' => 415,
                'category_id' => 17,
                'name' => 'Poverty relief',
                'created_by' => 1
            ],
            [
                'id' => 416,
                'category_id' => 17,
                'name' => 'International aid',
                'created_by' => 1
            ],
            [
                'id' => 417,
                'category_id' => 17,
                'name' => 'Local aid',
                'created_by' => 1
            ],
            [
                'id' => 418,
                'category_id' => 17,
                'name' => 'Non-profit programs',
                'created_by' => 1
            ],
            [
                'id' => 419,
                'category_id' => 17,
                'name' => 'Social impact',
                'created_by' => 1
            ],
            [
                'id' => 420,
                'category_id' => 17,
                'name' => 'Philanthropy',
                'created_by' => 1
            ],
            [
                'id' => 421,
                'category_id' => 17,
                'name' => 'Advocacy group',
                'created_by' => 1
            ],
            [
                'id' => 422,
                'category_id' => 17,
                'name' => 'Non-profit initiatives',
                'created_by' => 1
            ],
            [
                'id' => 423,
                'category_id' => 17,
                'name' => 'Environmental charity',
                'created_by' => 1
            ],
            [
                'id' => 424,
                'category_id' => 17,
                'name' => 'Human rights organization',
                'created_by' => 1
            ],
            [
                'id' => 425,
                'category_id' => 17,
                'name' => 'Healthcare charity',
                'created_by' => 1
            ],
            [
                'id' => 426,
                'category_id' => 17,
                'name' => 'Education charity',
                'created_by' => 1
            ],
            [
                'id' => 427,
                'category_id' => 17,
                'name' => 'Homeless support',
                'created_by' => 1
            ],
            [
                'id' => 428,
                'category_id' => 17,
                'name' => 'Animal welfare organization',
                'created_by' => 1
            ],


            [
                'id' => 429,
                'category_id' => 18,
                'name' => 'Childcare',
                'created_by' => 1
            ],
            [
                'id' => 430,
                'category_id' => 18,
                'name' => 'Daycare',
                'created_by' => 1
            ],
            [
                'id' => 431,
                'category_id' => 18,
                'name' => 'Infant care',
                'created_by' => 1
            ],
            [
                'id' => 432,
                'category_id' => 18,
                'name' => 'Toddler care',
                'created_by' => 1
            ],
            [
                'id' => 433,
                'category_id' => 18,
                'name' => 'Preschool',
                'created_by' => 1
            ],
            [
                'id' => 434,
                'category_id' => 18,
                'name' => 'Early childhood education',
                'created_by' => 1
            ],
            [
                'id' => 435,
                'category_id' => 18,
                'name' => 'Pre-K',
                'created_by' => 1
            ],
            [
                'id' => 436,
                'category_id' => 18,
                'name' => 'Nursery',
                'created_by' => 1
            ],
            [
                'id' => 437,
                'category_id' => 18,
                'name' => 'Child development center',
                'created_by' => 1
            ],
            [
                'id' => 438,
                'category_id' => 18,
                'name' => 'Learning center',
                'created_by' => 1
            ],
            [
                'id' => 439,
                'category_id' => 18,
                'name' => 'Licensed daycare',
                'created_by' => 1
            ],
            [
                'id' => 440,
                'category_id' => 18,
                'name' => 'In-home daycare',
                'created_by' => 1
            ],
            [
                'id' => 441,
                'category_id' => 18,
                'name' => 'Montessori school',
                'created_by' => 1
            ],
            [
                'id' => 442,
                'category_id' => 18,
                'name' => 'Childcare near me',
                'created_by' => 1
            ],
            [
                'id' => 443,
                'category_id' => 18,
                'name' => 'Affordable daycare',
                'created_by' => 1
            ],
            [
                'id' => 444,
                'category_id' => 18,
                'name' => 'Full-time daycare',
                'created_by' => 1
            ],
            [
                'id' => 445,
                'category_id' => 18,
                'name' => 'Part-time daycare',
                'created_by' => 1
            ],
            [
                'id' => 446,
                'category_id' => 18,
                'name' => 'After-school care',
                'created_by' => 1
            ],
            [
                'id' => 447,
                'category_id' => 18,
                'name' => 'Before-school care',
                'created_by' => 1
            ],
            [
                'id' => 448,
                'category_id' => 18,
                'name' => 'Drop-in daycare',
                'created_by' => 1
            ],
            [
                'id' => 449,
                'category_id' => 18,
                'name' => 'Summer camp',
                'created_by' => 1
            ],
            [
                'id' => 450,
                'category_id' => 18,
                'name' => 'Kids program',
                'created_by' => 1
            ],
            [
                'id' => 451,
                'category_id' => 18,
                'name' => 'Enrichment activities',
                'created_by' => 1
            ],
            [
                'id' => 452,
                'category_id' => 18,
                'name' => 'Play-based learning',
                'created_by' => 1
            ],
            [
                'id' => 453,
                'category_id' => 18,
                'name' => 'Childcare services',
                'created_by' => 1
            ]




        ]);
    }
}
