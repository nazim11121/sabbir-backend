<?php

namespace App\Http\Controllers\Admin\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class AdminDashboardCo extends Controller
{
    public function index()
    {
        try {
            $totalGeneralProfile = User::count();
            $completeBusinessProfile = null;
            $incompleteProfile = null;

            $totalVisitor = null;

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
