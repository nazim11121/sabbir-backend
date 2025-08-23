<?php

namespace App\Http\Controllers\Admin\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Api\TBusinessOwnerInfo;
use App\Models\Api\TCreedVisitor;
use App\Models\User;
use Illuminate\Http\Request;

class AdminDashboardTwoCo extends Controller
{
    public function index()
    {
        try {
            $totalGeneralProfile = User::count();
            $completeBusinessProfile = TBusinessOwnerInfo::whereHas('users', function ($query) {})
                ->whereHas('business', function ($query) {
                    $query->where('status', 7);
                })
                ->count();
            $incompleteProfile = TBusinessOwnerInfo::whereHas('users', function ($query) {})
                ->whereHas('business', function ($query) {
                    $query->where('status', '!=', 7);
                })
                ->count();

            $totalVisitor = TCreedVisitor::where('status', 1)->count();

            $users = User::selectRaw('COUNT(*) as total, MONTH(created_at) as month')
                ->groupBy('month')->get();

            $months = array_fill(0, 12, 0);
            foreach ($users as $user) {
                $months[$user->month - 1] = $user->total;
            }

            return view('admin.dashboard.dashboard2', [
                'totalGeneralProfile'           => $totalGeneralProfile,
                'completeBusinessProfile'       => $completeBusinessProfile,
                'incompleteProfile'             => $incompleteProfile,
                'totalVisitor'                  => $totalVisitor,
                'labels'                        => ['Total General Profile', 'Complete Business Profile', 'Incomplete Business Profile', 'Total Visitor'],
                'values'                        => [$totalGeneralProfile, $completeBusinessProfile, $incompleteProfile, $totalVisitor],
                'months'                        => $months,

            ]);
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }
}
