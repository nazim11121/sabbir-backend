<?php

namespace App\Http\Controllers\Admin\AdminPricingPlan;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Admin\TAdminPricingPlan;
use App\Http\Requests\TAdminSubscriptionPlanRequest;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Log;
use Auth;

class AdminPricingPlanCo extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $datas = TAdminPricingPlan::where('status', 1)->latest()->get()
        ->map(function ($item) {
            $item->feature_title = json_decode($item->feature_title, true);
            $item->feature_status = json_decode($item->feature_status, true);
            return $item;
        });
        return view('admin.pricingPlan.index', compact('datas'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.pricingPlan.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        $validated = $request->all();
       
        try {
            if($request->status){
                $status = $request->status;
            }else{
                $status = 0;
            }
            
            $validated['feature_title'] = json_encode($request->feature_title);
            $validated['feature_status'] = json_encode($request->feature_status);
            $validated['status'] = $status;
            $validated['created_by'] = Auth::id();

            $data = TAdminPricingPlan::create($validated);

            return redirect()->route('pricing-plan.index')->with('success','Data Save Successfully');
        } catch (QueryException $e) {
            return redirect()->back()->with('error', 'Database error: Unable to submit data.', $e->getMessage());
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An unexpected error occurred.', $e->getMessage());
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $pricingPlan = TAdminPricingPlan::find($id);

        $pricingPlan->feature_title = json_decode($pricingPlan->feature_title, true);
        $pricingPlan->feature_status = json_decode($pricingPlan->feature_status, true);
        
        return view('admin.pricingPlan.edit', compact('pricingPlan'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
            $request->validate([
                'type_name' => 'required|string',
                'pricing' => 'required|string',
                'plan_duration' => 'nullable|string',
                'feature_title' => 'required|array',
                'feature_status' => 'required|array',
            ]);

            // Find the pricing plan by ID
            $pricingPlan = TAdminPricingPlan::find($id);

            // Update the basic fields
            $pricingPlan->type_name = $request->type_name;
            $pricingPlan->pricing = $request->pricing;
            $pricingPlan->plan_duration = $request->plan_duration;
            $pricingPlan->key_tag = $request->key_tag;
            $pricingPlan->description = $request->description;
            $pricingPlan->status = $request->has('status') ? 1 : 0;

            // Filter out null values from feature_title
            $filteredFeatureTitles = array_filter($request->feature_title);
            $filteredFeatureStatuses = array_filter($request->feature_status);

            // Update the feature title and status, encode them back to JSON
            $pricingPlan->feature_title = json_encode(array_values($filteredFeatureTitles));
            $pricingPlan->feature_status = json_encode(array_values($filteredFeatureStatuses));

            // Save the updated pricing plan
            $pricingPlan->save();

            return redirect()->route('pricing-plan.index')->with('info','Data Updated Successfully');
        } catch (QueryException $e) {
            return redirect()->back()->with('error', 'Database error: Unable to update data.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An unexpected error occurred.');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try{
            $data = TAdminPricingPlan::find($id);
            $data->delete();

            return redirect()->route('pricing-plan.index')->with('warning','Data Deleted Successfully');
        } catch (\Exception $e) {
            Log::error('Error deleting user: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Unable to delete the user.');
        }
    }
}
