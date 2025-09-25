<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\MailAccount;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Jobs\ProcessMailAccount;
use Auth;

class MailAccountController extends Controller
{
    public function index()
    {
        $accounts = MailAccount::all();
        return view('admin.mailAccounts.index', compact('accounts'));
    }

    public function create()
    {
        return view('admin.mailAccounts.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'username' => 'required|email',
            'password' => 'required',
            'quotex_password' => 'nullable',
            'user_id' => 'nullable',
            'to_mail' => 'nullable',
        ]);

        MailAccount::create($request->all());

        return redirect()->route('mail-accounts.index')->with('success', 'Mail account added successfully.');
    }

    public function edit(string $id)
    {
        $data = MailAccount::find($id);
        return view('admin.mailAccounts.edit', compact('data'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'nullable',
            'username' => 'nullable',
            'password' => 'nullable',
            'quotex_password' => 'nullable',
            'user_id' => 'nullable',
            'to_mail' => 'nullable',
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
           
            $data = MailAccount::find($id);
            $data->name = $request->name;
            $data->username = $request->username;
            $data->password = $request->password;
            $data->quotex_password = $request->quotex_password;
            $data->host = $request->host;
            $data->port = $request->port;
            $data->encryption = $request->encryption;
            $data->user_id = $request->user_id;
            $data->to_mail = $request->to_mail;
            $data->remarks = $request->remarks;
            $data->status = $status;
            $data->save();

            return redirect()->route('mail-accounts.index')->with('info','Data Updated Successfully');
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
            $data = MailAccount::find($id);
            $data->delete();

            return redirect()->route('mail-accounts.index')->with('warning','Data Deleted Successfully');
        } catch (\Exception $e) {
            Log::error('Error deleting user: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Unable to delete the user.');
        }
    }

    public function fetchNow()
    {
        $accounts = MailAccount::all();
        $dispatched = 0;

        foreach ($accounts as $account) {
            ProcessMailAccount::dispatch($account);  
            $dispatched++;
        }

        return back()->with('success', "{$dispatched} mail jobs dispatched successfully!");
    }
}
