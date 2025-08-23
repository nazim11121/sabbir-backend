<?php

namespace App\Console\Commands;

use App\Models\Api\TBusiness;
use App\Models\Api\TBusinessOwnerInfo;
use App\Models\Api\TPayment;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class CheckExpiredSubscriptions extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'check:expired_subscriptions';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Check Expired Subscriptions';

    /**
     * Execute the console command.
     */
    public function handle()
    {
       $expiredSubscriptions = TPayment::select(['id', 'business_id', 'subscription_expired_date'])
       ->where('subscription_expired_date', '<', Carbon::now())
            ->get();

            foreach($expiredSubscriptions as $subscription) {
                $business = TBusiness::where('id', $subscription->business_id)->first();
                $business->update([
                    'onboard_status' => 0,
                ]);

                // $businessOwner =  TBusinessOwnerInfo::where('business_id', $business->id)->first();
                // $businessOwner->update([
                //     'onboard_status' => 0,
                // ]);
            }
    }
}
