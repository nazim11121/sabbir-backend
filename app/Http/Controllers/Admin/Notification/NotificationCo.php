<?php

namespace App\Http\Controllers\Admin\Notification;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Notification;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Intervention\Image\Facades\Image;
use Auth;

class NotificationCo extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $datas = Notification::latest()->get();

        return view('admin.notification.index', compact('datas'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $users = User::get();
        return view('admin.notification.create', compact('users'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'nullable',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp',
            'remarks' => 'nullable|string',
            'status' => 'nullable|boolean',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        // try{
            if($request->status){
                $status = $request->status;
            }else{
                $status = 0;
            }

            if ($request->hasFile('image')) {
                $image      = $request->file('image');
                $imageName  = time() . '_' . uniqid() . '.' . $image->getClientOriginalExtension();
                $image->move(public_path('images/notification'), $imageName);
                $imagePath = 'images/notification/' . $imageName;

            }else{
                $imagePath = null;
            }
       
            $data = New Notification();
            $data->user_id = $request->user_id;
            $data->image = $imagePath;
            $data->remarks = $request->remarks;
            $data->status = $status;
            $data->created_by = Auth::id();
            $data->save();

            return redirect()->route('notification.index')->with('success','Data Save Successfully');
        // } catch (QueryException $e) {
        //     return redirect()->back()->with('error', 'Database error: Unable to submit data.');
        // } catch (\Exception $e) {
        //     return redirect()->back()->with('error', 'An unexpected error occurred.');
        // }
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
        $data = Notification::find($id);
        $users = User::get();
        return view('admin.notification.edit', compact('data','users'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {

        $validator = Validator::make($request->all(), [
            'user_id' => 'nullable',
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
                $image->move(public_path('images/notification'), $imageName);
                $imagePath = 'images/notification/' . $imageName;
            }else{
                $imagePath = null;
            }

            $data = Notification::find($id);
            $data->user_id = $request->user_id;
            $data->image = $imagePath ? $imagePath : $data->image;
            $data->remarks = $request->remarks;
            $data->status = $status;
            $data->save();

            return redirect()->route('notification.index')->with('info','Data Updated Successfully');
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
            $data = Notification::find($id);
            $data->delete();

            return redirect()->route('notification.index')->with('warning','Data Deleted Successfully');
        } catch (\Exception $e) {
            Log::error('Error deleting user: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Unable to delete the user.');
        }
    }
}
