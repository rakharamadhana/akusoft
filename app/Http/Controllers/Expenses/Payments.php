<?php

namespace App\Http\Controllers\Expenses;

use App\Http\Controllers\Controller;
use App\Http\Requests\Expense\Payment as Request;
use App\Models\Banking\Account;
use App\Models\Expense\Payment;
use App\Models\Expense\Vendor;
use App\Models\Setting\Category;
use App\Models\Setting\Currency;
use App\Traits\Uploads;
use App\Utilities\Import;
use App\Utilities\ImportFile;
use App\Utilities\Modules;

class Payments extends Controller
{
    use Uploads;

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $payments = Payment::with(['vendor', 'account', 'category'])->isNotTransfer()->collect(['paid_at'=> 'desc']);

        $vendors = collect(Vendor::enabled()->orderBy('name')->pluck('name', 'id'));

        $categories = collect(Category::enabled()->type('expense','hpp')->orderBy('name')->pluck('name', 'id'));

        $accounts = collect(Account::enabled()->orderBy('number')->pluck('name', 'id'));

        $transfer_cat_id = Category::transfer();

        return view('expenses.payments.index', compact('payments', 'vendors', 'categories', 'accounts', 'transfer_cat_id'));
    }

    /**
     * Show the form for viewing the specified resource.
     *
     * @return Response
     */
    public function show()
    {
        return redirect('expenses/payments');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        $accounts = Account::enabled()->orderBy('number')->pluck('name', 'id');

        $currencies = Currency::enabled()->orderBy('name')->pluck('name', 'code')->toArray();

        $account_currency_code = Account::where('id', setting('general.default_account'))->pluck('currency_code')->first();

        $currency = Currency::where('code', $account_currency_code)->first();

        $vendors = Vendor::enabled()->orderBy('name')->pluck('name', 'id');

        $categories = Category::enabled()->where('type','expense')->where('type_id',5)->orderBy('name')->pluck('name', 'id');

        // dd($categories);

        $payment_methods = Modules::getPaymentMethods();

        //$payment_methods = Account::query()->orderBy('number')->whereBetween('number',[110,120])->pluck('name','id');

        return view('expenses.payments.create', compact('accounts', 'currencies', 'account_currency_code', 'currency', 'vendors', 'categories', 'payment_methods'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  Request  $request
     *
     * @return Response
     */
    public function store(Request $request)
    {
//        $amount = $request->input('amount');
//        $payment_method = Account::query()->where('id', $request->input('payment_method'))->first();
//        $payment_method->update([
//            'opening_balance' => $payment_method['opening_balance'] - $amount
//        ]);

        $payment = Payment::create($request->input());

        // Upload attachment
        $media = $this->getMedia($request->file('attachment'), 'payments');

        if ($media) {
            $payment->attachMedia($media, 'attachment');
        }

        // Recurring
        $payment->createRecurring();

        $message = trans('messages.success.added', ['type' => trans_choice('general.payments', 1)]);

        flash($message)->success();

        return redirect('expenses/payments');
    }

    /**
     * Duplicate the specified resource.
     *
     * @param  Payment  $payment
     *
     * @return Response
     */
    public function duplicate(Payment $payment)
    {
        $clone = $payment->duplicate();

        $message = trans('messages.success.duplicated', ['type' => trans_choice('general.payments', 1)]);

        flash($message)->success();

        return redirect('expenses/payments/' . $clone->id . '/edit');
    }

    /**
     * Import the specified resource.
     *
     * @param  ImportFile  $import
     *
     * @return Response
     */
    public function import(ImportFile $import)
    {
        if (!Import::createFromFile($import, 'Expense\Payment')) {
            return redirect('common/import/expenses/payments');
        }

        $message = trans('messages.success.imported', ['type' => trans_choice('general.payments', 2)]);

        flash($message)->success();

        return redirect('expenses/payments');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Payment  $payment
     *
     * @return Response
     */
    public function edit(Payment $payment)
    {
        $accounts = Account::enabled()->orderBy('name')->pluck('name', 'id');

        $currencies = Currency::enabled()->orderBy('name')->pluck('name', 'code')->toArray();

        $currency = Currency::where('code', $payment->currency_code)->first();

        $vendors = Vendor::enabled()->orderBy('name')->pluck('name', 'id');

        $categories = Category::enabled()->type('expense')->where('type_id',5)->orderBy('name')->pluck('name', 'id');

        $payment_methods = Account::query()->orderBy('number')->whereBetween('number',[110,120])->pluck('name','id');

        return view('expenses.payments.edit', compact('payment', 'accounts', 'currencies', 'currency', 'vendors', 'categories', 'payment_methods'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Payment  $payment
     * @param  Request  $request
     *
     * @return Response
     */
    public function update(Payment $payment, Request $request)
    {
        $payment->update($request->input());

        // Upload attachment
        if ($request->file('attachment')) {
            $media = $this->getMedia($request->file('attachment'), 'payments');

            $payment->attachMedia($media, 'attachment');
        }

        // Recurring
        $payment->updateRecurring();

        $message = trans('messages.success.updated', ['type' => trans_choice('general.payments', 1)]);

        flash($message)->success();

        return redirect('expenses/payments');
    }

    /**
     * @param Payment $payment
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     * @throws \Exception
     */
    public function destroy(Payment $payment)
    {
        $payment_method = $payment->payment_method;
        $return_amount = $payment->amount;

        // Can't delete transfer payment
        if ($payment->category->id == Category::transfer()) {
            return redirect('expenses/payments');
        }

//        $return_cash = Account::query()->where('id', $payment_method)->first();
//
//        $return_cash->update([
//            'opening_balance' => $return_cash['opening_balance'] + $return_amount
//        ]);

        $payment->recurring()->delete();
        $payment->delete();

        $message = trans('messages.success.deleted', ['type' => trans_choice('general.payments', 1)]);

        flash($message)->success();

        return redirect('expenses/payments');
    }

    /**
     * Export the specified resource.
     *
     * @return Response
     */
    public function export()
    {
        \Excel::create('payments', function($excel) {
            $excel->sheet('payments', function($sheet) {
                $sheet->fromModel(Payment::filter(request()->input())->get()->makeHidden([
                    'id', 'company_id', 'parent_id', 'created_at', 'updated_at', 'deleted_at'
                ]));
            });
        })->download('xlsx');
    }
}
