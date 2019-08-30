<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use App\Http\Requests\Auth\User as Request;
use Illuminate\Http\Request as ARequest;
use App\Models\Auth\User;
use App\Models\Auth\Role;
use App\Models\Common\Company;

use Auth;

class Register extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after Register.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    /*public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }*/

    public function __construct()
    {
        $this->middleware('guest', ['except' => 'destroy']);
    }

    public function create()
    {
        return view('auth.register.create');
    }

    public function store(Request $request)
    {
        
        // Create the user
        $user = User::create([
            'name' => $request->get('name'),
            'email' => $request->get('email'),
            'password' => $request->get('password'),
            'first_time_login' => true,
            'roles' => '2',
            'companies' => '2',
            'locale' => 'id-ID',
        ]);

        // Create company
        $company = Company::create([
            'domain' => $request->get('company_name'),
        ]);

        // Set settings
        setting()->setExtraColumns(['company_id' => $company->id]);
        setting()->set([
            'general.company_name'          => $request->get('company_name'),
            'general.company_email'         => $request->get('email'),
            'general.default_currency'      => 'IDR',
            'general.default_locale'        => 'id-ID',
        ]);
        setting()->save();

        // Attach admin role
        $user->roles()->attach('2');

        // Attach company
        $user->companies()->attach($company->id);

        // Redirect
        $message = "Berhasil mendaftarkan pengguna baru";

        flash($message)->success();

        return redirect('auth/login');
    }

    public function destroy()
    {
        $this->logout();

        return redirect('auth/login');
    }

    public function logout()
    {
        auth()->logout();

        // Session destroy is required if stored in database
        if (env('SESSION_DRIVER') == 'database') {
            $request = app('Illuminate\Http\Request');
            $request->session()->getHandler()->destroy($request->session()->getId());
        }
    }

}
