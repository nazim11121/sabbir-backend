<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Admin\TAboutUs;

class TAboutUsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tAboutUs = TAboutUs::insert([
            [
                'individual_title' => NULL, 
                'business_title' => NULL, 
                'individual_description' => '<h1><span style="font-size:14px"><span style="color:#00801b"><strong>CREED is a Commerce Platform &amp; Global Business Directory Serving The Muslim Community</strong></span></span></h1>

<p><span style="font-size:14px"><span style="color:#00801b"><strong>Our mission is to:</strong></span></span></p>

<ul>
	<li>
	<p><span style="font-size:14px"><span style="color:#00801b">Connect Businesses to Muslims (B2C and B2B)</span></span></p>

	<ul>
		<li>
		<p><span style="font-size:14px"><span style="color:#00801b">Business to Consumer - Connect with your customer and grow your business!</span></span></p>
		</li>
		<li>
		<p><span style="font-size:14px"><span style="color:#00801b">Business to Business - Connect to our CREED B2B Ecosystem!</span></span></p>
		</li>
	</ul>
	</li>
	<li>
	<p><span style="font-size:14px"><span style="color:#00801b">Engage, empower, and serve the ummah</span></span></p>
	</li>
</ul>

<p><span style="font-size:14px"><span style="color:#00801b">Simply put, if you are a Muslim owned, Muslim operated, or a business that has a specific offering for the Muslim Community, your business should be on CREED</span></span></p>

<p><br />
<span style="font-size:14px"><span style="color:#00801b"><strong>The CREED Difference</strong></span></span></p>

<ul>
	<li>
	<p><span style="font-size:14px"><span style="color:#00801b">We only list businesses that serve the Muslim Community</span></span></p>
	</li>
	<li>
	<p><span style="font-size:14px"><span style="color:#00801b">We do not work with businesses whose main source of income does not align with Islamic principles</span></span></p>
	</li>
	<li>
	<p><span style="font-size:14px"><span style="color:#00801b">We aim to screen our listings to ensure that there is:</span></span></p>

	<ul>
		<li>
		<p><span style="font-size:14px"><span style="color:#00801b">No adult content</span></span></p>
		</li>
		<li>
		<p><span style="font-size:14px"><span style="color:#00801b">No usury/interest</span></span></p>
		</li>
		<li>
		<p><span style="font-size:14px"><span style="color:#00801b">No alcohol</span></span></p>
		</li>
		<li>
		<p><span style="font-size:14px"><span style="color:#00801b">No illegal drugs</span></span></p>
		</li>
		<li>
		<p><span style="font-size:14px"><span style="color:#00801b">No gambling</span></span></p>
		</li>
		<li>
		<p><span style="font-size:14px"><span style="color:#00801b">No explicitly stated Haram (forbidden) products or services</span></span></p>
		</li>
	</ul>
	</li>
	<li>
	<p><span style="font-size:14px"><span style="color:#00801b">Family friendly, easily accessible, and global: No matter where you are, easily find businesses serving you (the muslim consumer) at your fingertips</span></span></p>
	</li>
</ul>',
                'business_description' => NULL,                
                'individual_tab_description' => '<ul>
	<li style="list-style-type:disc"><span style="font-size:14px"><span style="color:#00801b"><span style="font-family:Arial,sans-serif">Search businesses that are serving the Muslim Community&nbsp;</span></span></span></li>
	<li style="list-style-type:disc"><span style="font-size:14px"><span style="color:#00801b"><span style="font-family:Arial,sans-serif">Filter search results based on your CREED Preferences (CREED Tags)</span></span></span>
	<ul>
		<li style="list-style-type:circle"><span style="font-size:14px"><span style="color:#00801b"><span style="font-family:Arial,sans-serif">Muslim Owned Businesses&nbsp;</span></span></span></li>
		<li style="list-style-type:circle"><span style="font-size:14px"><span style="color:#00801b"><span style="font-family:Arial,sans-serif">Muslim Operated Businesses&nbsp;</span></span></span></li>
		<li style="list-style-type:circle"><span style="font-size:14px"><span style="color:#00801b"><span style="font-family:Arial,sans-serif">Businesses Serving The Muslim Community</span></span></span></li>
		<li style="list-style-type:circle"><span style="font-size:14px"><span style="color:#00801b"><span style="font-family:Arial,sans-serif">For Restaurants, filter by</span></span></span>
		<ul>
			<li style="list-style-type:square"><span style="font-size:14px"><span style="color:#00801b"><span style="font-family:Arial,sans-serif">100% Halal&nbsp;</span></span></span></li>
			<li style="list-style-type:square"><span style="font-size:14px"><span style="color:#00801b"><span style="font-family:Arial,sans-serif">100% Handcut Halal&nbsp;</span></span></span></li>
			<li style="list-style-type:square"><span style="font-size:14px"><span style="color:#00801b"><span style="font-family:Arial,sans-serif">No Alcohol Served&nbsp;</span></span></span></li>
		</ul>
		</li>
	</ul>
	</li>
	<li style="list-style-type:disc"><span style="font-size:14px"><span style="color:#00801b"><span style="font-family:Arial,sans-serif">Find the perfect business that matches your CREED Preference</span></span></span></li>
	<li style="list-style-type:disc"><span style="font-size:14px"><span style="color:#00801b"><span style="font-family:Arial,sans-serif">Unlock CREED Exclusive discounts&nbsp;</span></span></span></li>
	<li style="list-style-type:disc"><span style="font-size:14px"><span style="color:#00801b"><span style="font-family:Arial,sans-serif">Save, Share, and Support Businesses Serving The Muslim Community</span></span></span></li>
</ul>',
                'business_tab_description' => '<ul>
	<li style="list-style-type:disc"><span style="font-size:14px"><span style="color:#00801b"><span style="font-family:Arial,sans-serif">Attract new customers, and expand your reach by listing your business on CREED: Muslim Commerce Platform and put your business on the map! We aim to serve approx 2 Billion Muslims globally</span></span></span></li>
	<li style="list-style-type:disc"><span style="font-size:14px"><span style="color:#00801b"><span style="font-family:Arial,sans-serif">Fuel your business growth with the help of our exclusive Business Dashboard&nbsp;</span></span></span></li>
	<li style="list-style-type:disc"><span style="font-size:14px"><span style="color:#00801b"><span style="font-family:Arial,sans-serif">Gain access to our powerful Business to Business (B2B) network to accelerate your business.&nbsp;</span></span></span></li>
	<li style="list-style-type:disc"><span style="font-size:14px"><span style="color:#00801b"><span style="font-family:Arial,sans-serif">Share, Create Promos, Marketing Campaigns and Grow Your Business!&nbsp;</span></span></span></li>
</ul>',
                'created_by' => '1',
            ],
        ]);
    }
}
