<?php

namespace App\Http\Controllers\Admin\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Api\TBusinessOwnerInfo;
use App\Models\Api\TCreedVisitor;
use App\Models\User;
use Illuminate\Http\Request;

class AdminDashboardCo extends Controller
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

            return view('admin.dashboard.dashboard', [
                'completeBusinessProfile'       => $completeBusinessProfile,
                'incompleteProfile'             => $incompleteProfile,
                'totalGeneralProfile'           => $totalGeneralProfile,
                'totalVisitor'                  => $totalVisitor,
                'labels'                        => ['Total General Profile', 'Complete Business Profile', 'Incomplete Business Profile', 'Total Visitor'],
                'values'                        => [$totalGeneralProfile, $completeBusinessProfile, $incompleteProfile, $totalVisitor],
            ]);
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }
}
