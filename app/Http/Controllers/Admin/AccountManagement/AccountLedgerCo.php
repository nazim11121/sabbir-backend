<?php

namespace App\Http\Controllers\Admin\AccountManagement;

use App\Http\Controllers\Controller;
use App\Models\Api\TBusiness;
use Carbon\Carbon;
use Illuminate\Http\Request;

class AccountLedgerCo extends Controller
{
    public function index(Request $request)
    {
        $startDate = $request->start_date
            ? Carbon::parse($request->start_date)->startOfDay()->format('Y-m-d')
            : Carbon::now()->startOfDay()->format('Y-m-d');

        $endDate = $request->end_date
            ? Carbon::parse($request->end_date)->endOfDay()->format('Y-m-d')
            : Carbon::now()->endOfDay()->format('Y-m-d');


        $filteredStartDate = $request->start_date
            ? Carbon::parse($request->start_date)->startOfDay()->format('Y-m-d H:i:s')
            : Carbon::now()->startOfDay()->format('Y-m-d H:i:s');

        $filteredEndDate = $request->end_date
            ? Carbon::parse($request->end_date)->endOfDay()->format('Y-m-d H:i:s')
            : Carbon::now()->endOfDay()->format('Y-m-d H:i:s');


        $datas = TBusiness::with([
            'paymentInfo' => function ($query) {
                $query->where('payment_status', 'paid')
                    ->where('status', 1);
            },
            'businessOwnerInfos',
            'businessCategory'
        ])

            ->whereHas('paymentInfo', function ($query) use ($filteredStartDate, $filteredEndDate) {
                $query->where('payment_status', 'paid')
                    ->where('status', 1)
                    ->where('subscription_start_date', '>=', $filteredStartDate)
                    ->where('subscription_start_date', '<=', $filteredEndDate);
            })
            ->get();

        // calculate total amount
        $totalAmount = 0;
        foreach ($datas as $business) {
            $totalAmount += $business?->paymentInfo?->paid_amount;
        }


        return view('admin.accountManagement.account-ledger', [
            'datas'             => $datas,
            'totalAmount'       => $totalAmount,
            'startDate'         => $startDate,
            'endDate'           => $endDate,
        ]);
    }
}
