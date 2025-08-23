<?php

namespace App\Http\Controllers\Admin\ContactCreed;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Api\TContactCreed;
use Auth;

class AdminContactCreedCo extends Controller
{
    public function index() {

        $datas = TContactCreed::latest()->get();
        return view('admin.contactCreed.index', compact('datas'));
    }

    public function destroy($id)
    {
        try{
            $data = TContactCreed::find($id);
            $data->delete();

            return redirect()->route('contact-creed.list')->with('warning','Data Deleted Successfully');
        } catch (\Exception $e) {
            Log::error('Error deleting user: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Unable to delete the data.');
        }
    }
}
