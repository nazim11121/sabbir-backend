<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Admin\TAdminNote;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Log;
use Auth;

class AdminBusinessNoteCo extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $datas = TAdminNote::get()->first();
        
        return view('admin.businessNote.index', compact('datas'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        try{

            $tAdminNote = TAdminNote::get();
            if($tAdminNote->isNotEmpty()){

                if($request->status){
                    $status = $request->status;
                }else{
                    $status = 1;
                }

                $id = TAdminNote::get()->pluck('id')->first();
                $data = TAdminNote::find($id);
                $data->owner_info_page = $request->owner_info_page;
                $data->business_info_step_1 = $request->business_info_step_1;
                $data->business_info_step_2 = $request->business_info_step_2;
                $data->business_info_step_3 = $request->business_info_step_3;
                $data->business_info_step_4 = $request->business_info_step_4;
                $data->business_info_step_5 = $request->business_info_step_5;
                $data->business_info_step_6 = $request->business_info_step_6;
                $data->business_info_step_7 = $request->business_info_step_7;
                $data->status = $status;
                $data->created_by = Auth::id();
                $data->save();

                return redirect()->route('business-note.index')->with('success','Data Updated Successfully');
            }else{

                if($request->status){
                    $status = $request->status;
                }else{
                    $status = 1;
                }
        
                $data = New TAdminNote();
                $data->owner_info_page = $request->owner_info_page;
                $data->business_info_step_1 = $request->business_info_step_1;
                $data->business_info_step_2 = $request->business_info_step_2;
                $data->business_info_step_3 = $request->business_info_step_3;
                $data->business_info_step_4 = $request->business_info_step_4;
                $data->business_info_step_5 = $request->business_info_step_5;
                $data->business_info_step_6 = $request->business_info_step_6;
                $data->business_info_step_7 = $request->business_info_step_7;
                $data->status = $status;
                $data->updated_by = Auth::id();
                $data->save();

                return redirect()->route('business-note.index')->with('success','Data Saved Successfully');

            }    
        } catch (QueryException $e) {
            return redirect()->back()->with('error', 'Database error: Unable to submit data.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An unexpected error occurred.');
        }
    }

}
