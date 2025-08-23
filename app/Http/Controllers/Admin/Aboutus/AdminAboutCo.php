<?php

namespace App\Http\Controllers\Admin\Aboutus;

use App\Http\Controllers\Controller;
use App\Http\Requests\TAdminAboutRequest;
use App\Http\Requests\TBusinessCategoryRequest;
use App\Models\Admin\TAboutUs;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminAboutCo extends Controller
{
    public function index()
    {
        $data = TAboutUs::first();

        return view('admin.aboutUs.index', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {

        return view('admin.aboutUs.index');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(TAdminAboutRequest $request)
    {
        $validated = $request->validated();

        try {

            // Convert plain text to structured JSON
            $formattedDescription = $this->formatDescription($request->individual_description);
            
            $recordCount = TAboutUs::count();

            $status = $request->status ?? 0;

            TAboutUs::updateOrCreate(
                ['id' => 1],
                [
                    'individual_title'                  => $request->individual_title,
                    'business_title'                    => $request->business_title,
                    'individual_description'            => ($request->individual_description),
                    'business_description'              => ($request->business_description),
                    'individual_tab_description'        => ($request->individual_tab_description),
                    'business_tab_description'          => ($request->business_tab_description),
                    'status'                            => $status,
                    'created_by'                        => Auth::id(),
                    'updated_by'                        => Auth::id(),
                ]
            );

            if ($recordCount > 0) {
                return redirect()->route('about-us.index')->with('success', 'Data updated successfully');
            } else {
                return redirect()->route('about-us.index')->with('success', 'Data saved successfully');
            }

        } catch (QueryException $e) {
            return redirect()->back()->with('error', 'Database error: Unable to submit data.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An unexpected error occurred.');
        }
    }

    // Helper function to format description text
public function formatDescription($text)
{ 
    $lines = explode("\n", trim($text)); // Split text by new lines
    $formatted = [];
    $listIndex = null;

    foreach ($lines as $line) {
        $line = trim($line);
        if (empty($line)) continue; // Skip empty lines

        if (preg_match('/^\d+\./', $line)) {
            // If line starts with a number (e.g., "1. Connect Businesses..."), store as a main list item
            $listIndex = count($formatted);
            $formatted[$listIndex] = $line;
        } elseif (preg_match('/^[a-z]\./', $line)) {
            // If line starts with a letter (e.g., "a. Business to Consumer..."), store as a sublist item
            $formatted['list']['sublist'][] = $line;
        } else {
            // Otherwise, store as a main text block
            if ($listIndex === null) {
                $formatted[count($formatted)] = $line;
            } else {
                $formatted['list'][$listIndex] = $line;
            }
        }
    }

    return $formatted;
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
        $data = TAboutUs::find($id);
        return view('admin.about.edit', compact('data'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(AdminAboutRequest $request, string $id)
    {

        $validated = $request->validated();
        try {
            if ($request->status) {
                $status = $request->status;
            } else {
                $status = 0;
            }

            $data = TAboutUs::find($id);
            $data->individual_title = $request->individual_title;
            $data->business_title = $request->business_title;
            $data->individual_description = $request->individual_description;
            $data->business_description = $request->business_description;
            $data->individual_tab_description = $request->individual_tab_description;
            $data->business_tab_description = $request->business_tab_description;
            $data->status = $status;
            $data->updated_by = Auth::id();
            $data->save();

            return redirect()->route('about-us.index')->with('info', 'Data Updated Successfully');
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
        try {
            $data = TAboutUs::find($id);
            $data->delete();

            return redirect()->route('about-us.index')->with('warning', 'Data Deleted Successfully');
        } catch (\Exception $e) {
            Log::error('Error deleting user: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Unable to delete the user.');
        }
    }
}
