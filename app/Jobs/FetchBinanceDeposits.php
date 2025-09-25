<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Support\Facades\Http;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Models\BinanceDeposit;
use Carbon\Carbon;

class FetchBinanceDeposits implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public function __construct()
    {
        //
    }

    public function handle()
    {
        $apiKey = env('BINANCE_API_KEY');
        $secretKey = env('BINANCE_API_SECRET');

        $timestamp = now()->timestamp * 1000;

        $query = http_build_query([
            'timestamp' => $timestamp,
        ]);

        $signature = hash_hmac('sha256', $query, $secretKey);

        $response = Http::withHeaders([
            'X-MBX-APIKEY' => $apiKey
        ])->timeout(20)->withOptions([
            'verify' => false
        ])->get("https://api.binance.com/sapi/v1/capital/deposit/hisrec?$query&signature=$signature");

        $deposits = collect($response->json())->filter(fn ($d) => $d['status'] == 1); // Confirmed only

        foreach ($deposits as $deposit) {
            BinanceDeposit::updateOrCreate(
                ['txId' => $deposit['txId']],
                [
                    'binance_id' => $deposit['id'],
                    'amount' => $deposit['amount'],
                    'coin' => $deposit['coin'],
                    'network' => $deposit['network'],
                    'binance_status' => $deposit['status'],
                    'address' => $deposit['address'],
                    'insertTime' => Carbon::createFromTimestampMs($deposit['insertTime']),
                    'completeTime' => Carbon::createFromTimestampMs($deposit['completeTime']),
                    'confirmTimes' => $deposit['confirmTimes'],
                    'status' => 'Confirmed',
                ]
            );
        }
    }
}
