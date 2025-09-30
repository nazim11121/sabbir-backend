<?php

namespace App\Jobs;

use App\Models\User;
use App\Models\TInvest;
use App\Models\Commission;
use App\Models\Notification;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;
use DB;

class AddShareCommission implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public function handle(): void
    {
        // Fetch active (unpaid) investments
        $investments = TInvest::where('payment_status', 1)->get();

        foreach ($investments as $invest) {
            // Total 7days periods passed
            $daysPassed = intval($invest->created_at->timezone('Asia/Dhaka')->diffInDays(now('Asia/Dhaka')));
            if ($daysPassed <= 7) continue;

            // Per-7days rate based on type
            $rate = $invest->investment_type === 'flexible' ? 4 : 5;
            $commissionType = $invest->investment_type === 'flexible' ? 'flexible' : 'locked';

            // Total commission that *should* exist now
            $expectedTotal = $daysPassed * $invest->amount * $rate;

            // Already recorded commission
            $recordedTotal = Commission::where('user_id', $invest->user_id)
                ->where('commission_type', $commissionType)
                ->whereDate('created_at', '>=', $invest->created_at)
                ->sum('amount');

            // Only insert the difference
            $pending = $expectedTotal - $recordedTotal;

            if ($pending > 0) {
                Commission::create([
                    'user_id'         => $invest->user_id,
                    'commission_type' => $commissionType,
                    'amount'          => $pending,
                    'remarks' => "For {$commissionType} share",
                ]);

                Notification::create([
                    'user_id'  => $invest->user_id,
                    'category' => 'commission',
                    'remarks'  => "Your Share Commission {$pending}\$ added successfully."
                ]);

                DB::table('users')
                    ->where('id', $invest->user_id)
                    ->update([
                        'total_deposit_amount'    => DB::raw("total_deposit_amount + {$pending}"),
                        'total_commission_amount' => DB::raw("total_commission_amount + {$pending}")
                    ]);

                Log::info("Commission of \${$pending} added for User {$invest->user_id} ({$commissionType}).");
            }
        }
    }
}
