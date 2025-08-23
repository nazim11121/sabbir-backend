<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Admin\TAppTermsAndConditions;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Log;
use Auth;

class AppTermsAndConditionsCo extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $datas = TAppTermsAndConditions::get()->first();
        
        return view('admin.appTermsAndConditions.index', compact('datas'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        try{

            $tAppTermsAndConditions = TAppTermsAndConditions::get();
            if($tAppTermsAndConditions->isNotEmpty()){

                if($request->status){
                    $status = $request->status;
                }else{
                    $status = 1;
                }

                $id = TAppTermsAndConditions::get()->pluck('id')->first();
                $data = TAppTermsAndConditions::find($id);
                $data->page_1_heading = $request->page_1_heading;
                $data->page_2_title = $request->page_2_title;
                $data->page_2_heading = $request->page_2_heading;
                $data->page_2_description = $request->page_2_description;
                $data->status = $status;
                $data->created_by = Auth::id();
                $data->save();

                return redirect()->route('app-terms-and-conditions.index')->with('success','Data Updated Successfully');
            }else{

                if($request->status){
                    $status = $request->status;
                }else{
                    $status = 1;
                }
        
                $data = New TAppTermsAndConditions();
                $data->page_1_heading = $request->page_1_heading;
                $data->page_2_title = $request->page_2_title;
                $data->page_2_heading = $request->page_2_heading;
                $data->page_2_description = $request->page_2_description;
                $data->status = $status;
                $data->updated_by = Auth::id();
                $data->save();

                return redirect()->route('app-terms-and-conditions.index')->with('success','Data Saved Successfully');

            }    
        } catch (QueryException $e) {
            return redirect()->back()->with('error', 'Database error: Unable to submit data.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An unexpected error occurred.');
        }
    }

}
