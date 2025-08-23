<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Admin\TAdminPrivacyPolicy;

class TAdminPrivacyPolicySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = TAdminPrivacyPolicy::insert([
            'title' => NULL, 
            'description' => '<p>PRIVACY POLICY<br />
<br />
CREED: Commerce Platform &amp; Global Business Directory for the Muslim community<br />
Effective Date: 12/5/2024<br />
<br />
CREED (&quot;we,&quot; &quot;our,&quot; or &quot;us&quot;) values your privacy. This Privacy Policy outlines how we collect, use, and protect your personal information when you use our mobile application&nbsp;and website&nbsp;(the &quot;App&quot;). By using the App, you agree to the terms of this Privacy Policy.<br />
<br />
1. Information We Collect<br />
We collect information to provide and improve our services.<br />
<br />
a. Personal Information<br />
●&nbsp;When you install, use, register or interact with the App, we may collect your name, email address, phone number, and other contact information.<br />
●&nbsp;CREED uses webforms, which may require you to provide this&nbsp;personal contact information.<br />
<br />
b. Usage Information<br />
●&nbsp;Information about your interactions with the App, such as search history, clicks, and navigation patterns.<br />
<br />
●&nbsp;When you&rsquo;re not signed in to an account, we store the information we collect with unique identifiers tied to the browser, application, or device you&rsquo;re using.<br />
<br />
●&nbsp;When you&rsquo;re signed in, we also collect information that we store with your account, which we treat as personal information. Things you create or provide to us when you create an account, you provide us with personal information that includes your name and a password.<br />
<br />
●&nbsp;You can also choose to add a phone number, email or other forms of information to your account.<br />
<br />
●&nbsp;Even if you aren&rsquo;t signed in to an account, you might choose to provide us with information, like an email address to communicate with CREED or receive updates about our services.</p>', 
            'created_by' => 1, 
        ]);
    }
}
