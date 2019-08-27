<?php

namespace App\Http\Requests\Income;

use App\Http\Requests\Request;
use Date;

class Revenue extends Request
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules = [];

        $rules['account_id'] = 'required|integer';
        $rules['paid_at'] = 'required|date_format:Y-m-d H:i:s';
        $rules['amount'] = 'required|amount';
        $rules['income_type'] = 'required';
        $rules['currency_code'] = 'required|string|currency';
        $rules['currency_rate'] = 'required';
        $rules['customer_id'] = 'nullable|integer';
        $rules['category_id'] = 'required|integer';
        $rules['payment_method'] = 'required|string';
        $rules['attachment'] = 'mimes:' . setting('general.file_types') . '|between:0,' . setting('general.file_size') * 1024;

        if ($this->attributes->get('income_type') == 1) {
            $rules['item_id'] = 'required';
        }

        return $rules;
    }

    public function withValidator($validator)
    {
        if ($validator->errors()->count()) {
            $paid_at = Date::parse($this->request->get('paid_at'))->format('Y-m-d');

            $this->request->set('paid_at', $paid_at);
        }
    }
}
