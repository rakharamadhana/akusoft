<?php

namespace App\Http\Controllers\Incomes;

use App\Http\Controllers\Controller;
use App\Http\Requests\Income\Revenue as Request;
use App\Models\Banking\Account;
use App\Models\Income\Customer;
use App\Models\Income\Revenue;
use App\Models\Expense\Payment as HPP; //For HPP
use App\Models\Item\Item;
use App\Models\Relation\UserCompanies;
use App\Models\Setting\Category;
use App\Models\Setting\Currency;
use App\Traits\Currencies;
use App\Traits\DateTime;
use App\Traits\Uploads;
use App\Utilities\Import;
use App\Utilities\ImportFile;
use App\Utilities\Modules;
use Auth;

class Revenues extends Controller
{
    use DateTime, Currencies, Uploads;

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $revenues = Revenue::with(['account', 'category', 'customer'])->isNotTransfer()->collect(['paid_at'=> 'desc']);

        $customers = collect(Customer::enabled()->orderBy('name')->pluck('name', 'id'));

        $categories = collect(Category::enabled()->type('income')->orderBy('name')->pluck('name', 'id'));

        $accounts = collect(Account::enabled()->orderBy('name')->pluck('name', 'id'));

        $transfer_cat_id = Category::transfer();

        return view('incomes.revenues.index', compact('revenues', 'customers', 'categories', 'accounts', 'transfer_cat_id'));
    }

    /**
     * Show the form for viewing the specified resource.
     *
     * @return Response
     */
    public function show()
    {
        return redirect('incomes/revenues');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        $accounts = Account::enabled()->orderBy('name')->pluck('name', 'id');

        $items = Item::enabled()->orderBy('name')->pluck('name', 'id');

        $currencies = Currency::enabled()->orderBy('name')->pluck('name', 'code')->toArray();

        $account_currency_code = Account::where('id', setting('general.default_account'))->pluck('currency_code')->first();

        $currency = Currency::where('code', $account_currency_code)->first();

        $customers = Customer::enabled()->orderBy('name')->pluck('name', 'id');

        $categories = Category::enabled()->type('income')->orderBy('name')->where('type_id', 3)->pluck('name', 'id');

        $payment_methods = Modules::getPaymentMethods();

        return view('incomes.revenues.create', compact('accounts', 'items', 'currencies', 'account_currency_code', 'currency', 'customers', 'categories', 'payment_methods'));
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
        //dd($request->input());
        $user_id = Auth::user()->id;
        $company_id = UserCompanies::query()->where('user_id',$user_id)->pluck('company_id')->first();
        // Item Spent
        if ($request->input('item_id')){
            $input['item_id'] = $request->input('item_id');
            $input['quantity'] = $request->input('item_quantity');
    
            $items = Item::enabled()->where('id',$input['item_id'])->first();;
    
            $items_sale_price = $items->sale_price * $input['quantity'];

            //dd($items_sale_price);
            $items->update([
                'quantity' => $items['quantity'] - $input['quantity']
            ]);   
        }

        // Jika Penjualan Barang
        if($request->input('income_type') == 1) {
            $hpp_amount = $items->purchase_price * $input['quantity'];

            // Handle Laba
            if ($items_sale_price != $hpp_amount) {
                $akun_laba = Account::where('company_id', $company_id)->where('number',330)->first();
                $kategori_laba = Category::where('company_id', $company_id)->where('type','income')->where('type_id', 4)->first();
                $revenue_laba = Revenue::create([
                    "paid_at" => $request->paid_at,
                    "currency_code" => $request->currency_code,
                    "currency_rate" => $request->currency_rate,
                    "amount" => $items_sale_price - $hpp_amount,
                    "account_id" => $akun_laba->id,
                    "customer_id" => $request->customer_id,
                    "income_type" => $request->income_type,
                    "item_id" => $request->item_id,
                    "item_quantity" => $request->item_quantity,
                    "description" => "Laba ".$request->description,
                    "category_id" => $kategori_laba->id,
                    "recurring_frequency" => $request->recurring_frequency,
                    "recurring_interval" => $request->recurring_interval,
                    "recurring_custom_frequency" => $request->recurring_custom_frequency,
                    "recurring_count" => $request->recurring_count,
                    "payment_method" => $request->payment_method,
                    "reference" => $request->reference,
                    "company_id" => $request->company_id
                ]);
            }

            $akun_hpp = Category::where('company_id', $company_id)->where('type','expense')->where('type_id', 4)->first();

            $hpp = HPP::create([
                "paid_at" => $request->paid_at,
                "currency_code" => $request->currency_code,
                "currency_rate" => $request->currency_rate,
                "amount" => $hpp_amount,
                "account_id" => $request->account_id,
                "vendor_id" => null,
                "description" => $request->description,
                "category_id" => $akun_hpp->id, //Akun HPP
                "recurring_frequency" => $request->recurring_frequency,
                "recurring_interval" => $request->recurring_interval,
                "recurring_custom_frequency" => $request->recurring_custom_frequency,
                "recurring_count" => $request->recurring_count,
                "payment_method" => $request->payment_method,
                "reference" => $request->reference,
                "company_id" => $request->company_id
            ]);

            if ($request->input('amount') != $items_sale_price) {
                $revenue = Revenue::create([
                    "paid_at" => $request->paid_at,
                    "currency_code" => $request->currency_code,
                    "currency_rate" => $request->currency_rate,
                    "amount" => $items_sale_price,
                    "account_id" => $request->account_id,
                    "customer_id" => $request->customer_id,
                    "income_type" => $request->income_type,
                    "item_id" => $request->item_id,
                    "item_quantity" => $request->item_quantity,
                    "description" => $request->description,
                    "category_id" => $request->category_id,
                    "recurring_frequency" => $request->recurring_frequency,
                    "recurring_interval" => $request->recurring_interval,
                    "recurring_custom_frequency" => $request->recurring_custom_frequency,
                    "recurring_count" => $request->recurring_count,
                    "payment_method" => $request->payment_method,
                    "reference" => $request->reference,
                    "company_id" => $request->company_id
                ]);  
            } else {
                $revenue = Revenue::create($request->input());
            }
        } else {
            $revenue = Revenue::create($request->input());
        }

        
        
        
        // Upload attachment
        if ($request->file('attachment')) {
            $media = $this->getMedia($request->file('attachment'), 'revenues');

            $revenue->attachMedia($media, 'attachment');
        }

        // Recurring
        $revenue->createRecurring();

        $message = trans('messages.success.added', ['type' => trans_choice('general.revenues', 1)]);

        flash($message)->success();

        return redirect('incomes/revenues');
    }

    /**
     * Duplicate the specified resource.
     *
     * @param  Revenue  $revenue
     *
     * @return Response
     */
    public function duplicate(Revenue $revenue)
    {
        $clone = $revenue->duplicate();

        $message = trans('messages.success.duplicated', ['type' => trans_choice('general.revenues', 1)]);

        flash($message)->success();

        return redirect('incomes/revenues/' . $clone->id . '/edit');
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
        if (!Import::createFromFile($import, 'Income\Revenue')) {
            return redirect('common/import/incomes/revenues');
        }

        $message = trans('messages.success.imported', ['type' => trans_choice('general.revenues', 2)]);

        flash($message)->success();

        return redirect('incomes/revenues');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Revenue  $revenue
     *
     * @return Response
     */
    public function edit(Revenue $revenue)
    {
        $accounts = Account::enabled()->orderBy('name')->pluck('name', 'id');

        $items = Item::enabled()->orderBy('name')->pluck('name', 'id');

        $currencies = Currency::enabled()->orderBy('name')->pluck('name', 'code')->toArray();

        $account_currency_code = Account::where('id', setting('general.default_account'))->pluck('currency_code')->first();

        $currency = Currency::where('code', $revenue->currency_code)->first();

        $customers = Customer::enabled()->orderBy('name')->pluck('name', 'id');

        $categories = Category::enabled()->type('income')->orderBy('name')->where('type_id',3)->pluck('name', 'id');

        $payment_methods = Modules::getPaymentMethods();

        return view('incomes.revenues.edit', compact('revenue', 'accounts', 'currencies', 'currency', 'customers', 'categories', 'payment_methods', 'account_currency_code', 'items'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Revenue  $revenue
     * @param  Request  $request
     *
     * @return Response
     */
    public function update(Revenue $revenue, Request $request)
    {
        $revenue->update($request->input());

        // Upload attachment
        if ($request->file('attachment')) {
            $media = $this->getMedia($request->file('attachment'), 'revenues');

            $revenue->attachMedia($media, 'attachment');
        }

        // Recurring
        $revenue->updateRecurring();

        $message = trans('messages.success.updated', ['type' => trans_choice('general.revenues', 1)]);

        flash($message)->success();

        return redirect('incomes/revenues');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Revenue  $revenue
     *
     * @return Response
     */
    public function destroy(Revenue $revenue)
    {
        // Can't delete transfer revenue
        if ($revenue->category->id == Category::transfer()) {
            return redirect('incomes/revenues');
        }

        $revenue->recurring()->delete();
        $revenue->delete();

        $message = trans('messages.success.deleted', ['type' => trans_choice('general.revenues', 1)]);

        flash($message)->success();

        return redirect('incomes/revenues');
    }

    /**
     * Export the specified resource.
     *
     * @return Response
     */
    public function export()
    {
        \Excel::create('revenues', function($excel) {
            $excel->sheet('revenues', function($sheet) {
                $sheet->fromModel(Revenue::filter(request()->input())->get()->makeHidden([
                    'id', 'company_id', 'parent_id', 'created_at', 'updated_at', 'deleted_at'
                ]));
            });
        })->download('xlsx');
    }
}
