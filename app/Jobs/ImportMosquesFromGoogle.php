<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use App\Models\Api\TAdminMosqueData;

class ImportMosquesFromGoogle implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public function handle(): void
    {
        $googleKey = env('GOOGLE_MAP_API_KEY');

        $citiesByProvince = [
            'Ontario' => ['Toronto', 'Ottawa', 'Mississauga', 'Hamilton', 'London'],
            'British Columbia' => ['Vancouver', 'Surrey', 'Burnaby', 'Kelowna'],
            'Alberta' => ['Calgary', 'Edmonton', 'Red Deer'],
            'Quebec' => ['Montreal', 'Quebec City', 'Laval'],
            'Manitoba' => ['Winnipeg', 'Brandon'],
            'Saskatchewan' => ['Regina', 'Saskatoon'],
            'Nova Scotia' => ['Halifax', 'Sydney'],
            'New Brunswick' => ['Fredericton', 'Moncton'],
            'Newfoundland and Labrador' => ['St. John\'s', 'Corner Brook'],
            'Prince Edward Island' => ['Charlottetown'],
            'Yukon' => ['Whitehorse'],
            'Northwest Territories' => ['Yellowknife'],
            'Nunavut' => ['Iqaluit'],
        ];

        foreach ($citiesByProvince as $province => $cities) {
            foreach ($cities as $city) {
                $nextPageToken = null;

                do {
                    $queryParams = [
                        'query' => 'mosque in ' . $city,
                        'key' => $googleKey,
                    ];

                    if ($nextPageToken) {
                        $queryParams['pagetoken'] = $nextPageToken;
                        sleep(2); // Wait for token to activate
                    }

                    $response = Http::get('https://maps.googleapis.com/maps/api/place/textsearch/json', $queryParams);

                    if (!$response->successful()) continue;

                    $results = $response->json('results');
                    $nextPageToken = $response->json('next_page_token') ?? null;

                    foreach ($results as $place) {
                        $placeId = $place['place_id'] ?? null;
                        if (!$placeId) continue;

                        $detailsResponse = Http::get('https://maps.googleapis.com/maps/api/place/details/json', [
                            'place_id' => $placeId,
                            'key' => $googleKey,
                        ]);

                        if (!$detailsResponse->successful()) continue;

                        $details = $detailsResponse->json('result');

                        // Photo download
                        $photoReferences = $details['photos'] ?? [];
                        $localPhotoPaths = [];

                        foreach (array_slice($photoReferences, 0, 3) as $photo) {
                            $photoReference = $photo['photo_reference'] ?? null;
                            if (!$photoReference) continue;

                            $photoResponse = Http::get('https://maps.googleapis.com/maps/api/place/photo', [
                                'maxwidth' => 800,
                                'photo_reference' => $photoReference,
                                'key' => $googleKey,
                            ]);

                            if ($photoResponse->successful()) {
                                $imageName = time() . '-' . Str::uuid() . '.jpg';
                                $relativePath = 'images/mosques/' . $imageName;
                                $fullPath = public_path($relativePath);

                                if (!file_exists(dirname($fullPath))) {
                                    mkdir(dirname($fullPath), 0775, true);
                                }

                                file_put_contents($fullPath, $photoResponse->body());
                                $localPhotoPaths[] = $relativePath;
                            }
                        }

                        // Icon
                        $iconUrl = $details['icon'] ?? null;
                        $localIconPath = null;

                        if ($iconUrl) {
                            $iconResponse = Http::get($iconUrl);

                            if ($iconResponse->successful()) {
                                $ext = pathinfo(parse_url($iconUrl, PHP_URL_PATH), PATHINFO_EXTENSION) ?: 'png';
                                $iconName = time() . '-' . Str::uuid() . '.' . $ext;
                                $relativeIconPath = 'images/mosques/icons/' . $iconName;
                                $fullIconPath = public_path($relativeIconPath);

                                if (!file_exists(dirname($fullIconPath))) {
                                    mkdir(dirname($fullIconPath), 0775, true);
                                }

                                file_put_contents($fullIconPath, $iconResponse->body());
                                $localIconPath = $relativeIconPath;
                            }
                        }

                        // Save to DB
                        TAdminMosqueData::updateOrCreate(
                            ['place_id' => $details['place_id']],
                            [
                                'name' => $details['name'] ?? null,
                                'address' => $details['formatted_address'] ?? null,
                                'lat' => $details['geometry']['location']['lat'] ?? null,
                                'lng' => $details['geometry']['location']['lng'] ?? null,
                                'place_id' => $details['place_id'] ?? null,
                                'photos' => !empty($localPhotoPaths) ? json_encode($localPhotoPaths) : null,
                                'icon' => $localIconPath,
                                'phone' => $details['formatted_phone_number'] ?? null,
                                'website' => $details['website'] ?? null,
                                'rating' => $details['rating'] ?? null,
                                'opening_hour' => isset($details['opening_hours']['weekday_text']) ? json_encode($details['opening_hours']['weekday_text']) : null,
                            ]
                        );
                    }

                } while ($nextPageToken);
            }
        }
    }
}
