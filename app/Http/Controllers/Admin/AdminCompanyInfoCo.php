<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\TCompanyInfoRequest;
use Intervention\Image\Facades\Image;
use App\Models\Admin\TCompanyInfo;
use Illuminate\Http\Request;
use DB;
use Auth;

class AdminCompanyInfoCo extends Controller
{
    public function index(TCompanyInfo $tCompanyInfo=null){

        $tCompanyInfo = TCompanyInfo::get()->first();

        return view('admin.company_info.index', compact('tCompanyInfo'));
        
    }

    public function store(TCompanyInfoRequest $request)
    {
        $validator = $request->validated();
        try{
            $tCompanyInfo = TCompanyInfo::get();
            if($tCompanyInfo->isNotEmpty()){
                $id = TCompanyInfo::get()->pluck('id')->first();
                $tCompanyInfo = TCompanyInfo::find($id);
                if ($request->hasFile('logo')) {
                    $file = $request->file('logo');
                    $fileName = time() . '.' . $file->getClientOriginalExtension();
                    $file->move(public_path('images/companyInfo'), $fileName);
                    $imagePath = 'images/companyInfo/' . $fileName;
                    $tCompanyInfo['logo'] = $imagePath;
                }
                if ($request->hasFile('favicon_icon')) {
                    $file = $request->file('favicon_icon');
                    $fileName2 = time() . '.' . $file->getClientOriginalExtension();
                    $file->move(public_path('images/companyInfo'), $fileName2);
                    $imagePath2 = 'images/companyInfo/' . $fileName2;
                    $tCompanyInfo['favicon_icon'] = $imagePath2;
                }
                  
                $tCompanyInfo['updated_by'] = Auth::id(); 
            }else{
                $tCompanyInfo = new TCompanyInfo();
                if ($request->hasFile('logo')) {
                    $file = $request->file('logo');
                    $fileName = time() . '.' . $file->getClientOriginalExtension();
                    $file->move(public_path('images/companyInfo'), $fileName);
                    $imagePath = 'images/companyInfo/' . $fileName;
                }else{
                    $imagePath = NULL;
                }
                if ($request->hasFile('favicon_icon')) {
                    $file = $request->file('favicon_icon');
                    $fileName2 = time() . '.' . $file->getClientOriginalExtension();
                    $file->move(public_path('images/companyInfo'), $fileName2);
                    $imagePath2 = 'images/companyInfo/' . $fileName2;
                }else{
                    $imagePath2 = NULL;
                }

                $tCompanyInfo['logo'] = $imagePath;
                $tCompanyInfo['favicon_icon'] = $imagePath2;
                $tCompanyInfo['created_by'] = Auth::id();  
            }
          
            $tCompanyInfo->fill($validator);  
            $tCompanyInfo->save();

            return redirect()->route('company-info.index')->with('success', 'Company Info saved successfully!');
        } catch (QueryException $e) {
            return redirect()->back()->with('error', 'Database error: Unable to submit data.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An unexpected error occurred.');
        }
    }
}
