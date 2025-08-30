<?php

namespace App\Http\Controllers\Admin\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\TDeposit;
use App\Models\Withdraw;
use App\Models\TInvest;
use App\Models\BuyPackage;
use Illuminate\Http\Request;

class AdminDashboardCo extends Controller
{
    public function index()
    {
        try {
            $totalUsers = User::count();
            $totalDeposit = TDeposit::where('payment_status', 1)->sum('amount');
            $totalWithdraw = Withdraw::where('payment_status', 1)->sum('amount');
            $totalInvest = TInvest::where('payment_status', 1)->sum('amount');
            // $totalPackageSell = BuyPackage::where('status', 1)->sum('amount');

            return view('admin.dashboard.dashboard', [
                'totalUsers'       => $totalUsers,
                'totalDeposit'     => $totalDeposit,
                'totalWithdraw'    => $totalWithdraw,
                'totalInvest'      => $totalInvest,
                // 'totalPackageSell' => $totalPackageSell,
            ]);
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }
}
