<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Package;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Intervention\Image\Facades\Image;
use Auth;

class PackageCo extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $datas = Package::latest()->get();

        return view('admin.package.index', compact('datas'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = Category::where('status', 1)->get();
        return view('admin.package.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|unique:packages,name',
            'category_id' => 'required|exists:categories,id',
            'price' => 'nullable|numeric|min:0',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'remarks' => 'nullable|string',
            'status' => 'nullable|boolean',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            if($request->status){
                $status = $request->status;
            }else{
                $status = 0;
            }

            if ($request->hasFile('image')) {
                $image      = $request->file('image');
                $imageName  = time() . '_' . uniqid() . '.' . $image->getClientOriginalExtension();
                if($request->category_id == 1){
                    $image->move(public_path('images/service'), $imageName);
                    $imagePath = 'images/service/' . $imageName;
                }else{
                    $image->move(public_path('images/funded'), $imageName);
                    $imagePath = 'images/funded/' . $imageName;
                }
            }else{
                $imagePath = null;
            }
       
            $data = New Package();
            $data->name = $request->name;
            $data->category_id = $request->category_id;
            $data->price = $request->price;
            $data->image = $imagePath;
            $data->remarks = $request->remarks;
            $data->status = $status;
            $data->created_by = Auth::id();
            $data->save();

            return redirect()->route('package.index')->with('success','Data Save Successfully');
        } catch (QueryException $e) {
            return redirect()->back()->with('error', 'Database error: Unable to submit data.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An unexpected error occurred.');
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
        $data = Package::find($id);
        $categories = Category::where('status', 1)->get();
        return view('admin.package.edit', compact('data','categories'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'category_id' => 'required|exists:categories,id',
            'price' => 'nullable|numeric|min:0',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp',
            'remarks' => 'nullable|string',
            'status' => 'nullable|boolean',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            if($request->status){
                $status = $request->status;
            }else{
                $status = 0;
            }

            
            if ($request->hasFile('image')) {
                $image      = $request->file('image');
                $imageName  = time() . '_' . uniqid() . '.' . $image->getClientOriginalExtension();
                if($request->category_id == 1){
                    $image->move(public_path('images/service'), $imageName);
                    $imagePath = 'images/service/' . $imageName;
                }else{
                    $image->move(public_path('images/funded'), $imageName);
                    $imagePath = 'images/funded/' . $imageName;
                }
            }else{
                $imagePath = null;
            }

            $data = Package::find($id);
            $data->name = $request->name;
            $data->category_id = $request->category_id;
            $data->price = $request->price;
            $data->image = $imagePath ? $imagePath : $data->image;
            $data->remarks = $request->remarks;
            $data->status = $status;
            $data->save();

            return redirect()->route('package.index')->with('info','Data Updated Successfully');
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
            $data = Package::find($id);
            $data->delete();

            return redirect()->route('package.index')->with('warning','Data Deleted Successfully');
        } catch (\Exception $e) {
            Log::error('Error deleting user: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Unable to delete the user.');
        }
    }
}
