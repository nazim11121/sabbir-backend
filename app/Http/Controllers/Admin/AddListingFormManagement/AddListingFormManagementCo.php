<?php

namespace App\Http\Controllers\Admin\AddListingFormManagement;

use App\Http\Controllers\Controller;
use App\Http\Requests\TAdminAboutRequest;
use App\Http\Requests\TBusinessCategoryRequest;
use App\Models\Admin\TAdminAddListingFormManagement;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AddListingFormManagementCo extends Controller
{
    public function index()
    {
        $datas = TAdminAddListingFormManagement::get();

        return view('admin.addListingFormManagement.index', compact('datas'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'field_category' => 'required',
            'field_name' => 'required',
            'field_status' => 'nullable',
        ]);

        try {

            if($request->field_status){
                $field_status = $request->field_status;
            }else{
                $field_status = 0;
            }

            if($request->status){
                $status = $request->status;
            }else{
                $status = 0;
            }

            $validated['field_status'] = $field_status;
            $validated['status'] = $status;
            $validated['created_by'] = Auth::id();
            TAdminAddListingFormManagement::create($validated);
            return redirect()->route('add-listing-form-management.index')->with('success', 'Data submit successfully');

        } catch (QueryException $e) {
            return redirect()->back()->with('error', 'Database error: Unable to submit data.', $e->getMessage());
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An unexpected error occurred.', $e->getMessage());
        }
    }

    /**
     * Display the specified resource.
     */
    public function updateFieldStatus($id, Request $request)
    { 
        // Validate the incoming request
        $request->validate([
            'field_status' => 'required|boolean',
        ]);

        // Find the item by ID
        $item = TAdminAddListingFormManagement::findOrFail($id);
        $item->field_status = $request->field_status;
        $item->save();

        return response()->json(['success' => true]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            $data = TAdminAddListingFormManagement::find($id);
            $data->delete();

            return redirect()->route('add-listing-form-management.index')->with('warning', 'Data Deleted Successfully');
        } catch (\Exception $e) {
            Log::error('Error deleting user: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Unable to delete the user.');
        }
    }
}
