<div class="box-body">
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th class="col-sm-2">&nbsp;</th>
                    @foreach($dates as $date)
                        <th class="col-sm-2 text-right">{{ trans('reports.quarter.' . $date) }}</th>
                    @endforeach
                    <th class="col-sm-2 text-right">{{ trans_choice('general.totals', 1) }}</th>
                </tr>
            </thead>
        </table>
        <table class="table table-hover" style="margin-top: 40px">
            <thead>
                <tr>
                    <!--<th class="col-sm-2" colspan="6">{{ trans_choice('general.incomes', 1) }}</th>-->
                    <th class="col-sm-2" colspan="6">Harta</th>
                </tr>
            </thead>
            <tbody>
                @if($accounts_harta)
                    @foreach($accounts_harta as $item)
                        <tr>
                            @if ($auth_user->can('read-reports-income-expense-summary'))
                                <td><a href="{{ url('reports/income-expense-summary?accounts[]=' . $item->id) }}">{{ $item->name }}</a></td>
                            @else
                                <td><a href="{{ route('accounts.edit', $item->id) }}">{{ $item->name }}</a></td>
                            @endif
                            @foreach($dates as $date)
                                <td class="text-right amount-space">@money($item->balance, $item->currency_code, true)</td>
                            @endforeach
                            <td class="text-right amount-space">@money(0, $item->currency_code, true)</td>
                        </tr>
                    @endforeach
                @else
                    <tr>
                        <td colspan="13">
                            <h5 class="text-center">{{ trans('general.no_records') }}</h5>
                        </td>
                    </tr>
                @endif
            </tbody>
            <tfoot>
                <tr>
                    <!--<th class="col-sm-2">{{ trans('reports.gross_profit') }}</th>-->
                    <th class="col-sm-2">Total Harta</th>
                    @foreach($dates as $date)
                        <td class="text-right amount-space">@money($item->balance, $item->currency_code, true)</td>
                    @endforeach
                    <td class="text-right amount-space">@money(0, $item->currency_code, true)</td>
                </tr>
            </tfoot>
        </table>
        <table class="table table-hover" style="margin-top: 40px">
            <thead>
                <tr>
                    <!--<th class="col-sm-2" colspan="6">{{ trans_choice('general.expenses', 2) }}</th>-->
                    <th class="col-sm-2" colspan="6">Kewajiban</th>
                </tr>
            </thead>
            <tbody>
                @if($accounts_kewajiban)
                    @foreach($accounts_kewajiban as $item)
                        <tr>
                            @if ($auth_user->can('read-reports-income-expense-summary'))
                                <td><a href="{{ url('reports/income-expense-summary?accounts[]=' . $item->id) }}">{{ $item->name }}</a></td>
                            @else
                                <td><a href="{{ route('accounts.edit', $item->id) }}">{{ $item->name }}</a></td>
                            @endif
                            @foreach($dates as $date)
                                <td class="text-right amount-space">@money($item->balance, $item->currency_code, true)</td>
                            @endforeach
                            <td class="text-right amount-space">@money(0, $item->currency_code, true)</td>
                        </tr>
                    @endforeach
                @else
                    <tr>
                        <td colspan="13">
                            <h5 class="text-center">{{ trans('general.no_records') }}</h5>
                        </td>
                    </tr>
                @endif
            </tbody>
            <tfoot>
                <tr>
                    <!--<th class="col-sm-2">{{ trans('reports.total_expenses') }}</th>-->
                    <th class="col-sm-2">Total Kewajiban</th>
                    @foreach($dates as $date)
                        <td class="text-right amount-space">@money($item->balance, $item->currency_code, true)</td>
                    @endforeach
                    <td class="text-right amount-space">@money(0, $item->currency_code, true)</td>
                </tr>
            </tfoot>
        </table>
        <table class="table table-hover" style="margin-top: 40px">
            <thead>
                <tr>
                    <!--<th class="col-sm-2" colspan="6">{{ trans_choice('general.expenses', 2) }}</th>-->
                    <th class="col-sm-2" colspan="6">Modal</th>
                </tr>
            </thead>
            <tbody>
                @if($accounts_modal)
                    @foreach($accounts_modal as $item)
                        <tr>
                            @if ($auth_user->can('read-reports-income-expense-summary'))
                                <td><a href="{{ url('reports/income-expense-summary?accounts[]=' . $item->id) }}">{{ $item->name }}</a></td>
                            @else
                                <td><a href="{{ route('accounts.edit', $item->id) }}">{{ $item->name }}</a></td>
                            @endif
                            @foreach($dates as $date)
                                <td class="text-right amount-space">@money($item->balance, $item->currency_code, true)</td>
                            @endforeach
                            <td class="text-right amount-space">@money(0, $item->currency_code, true)</td>
                        </tr>
                    @endforeach
                @else
                    <tr>
                        <td colspan="13">
                            <h5 class="text-center">{{ trans('general.no_records') }}</h5>
                        </td>
                    </tr>
                @endif
            </tbody>
            <tfoot>
                <tr>
                    <!--<th class="col-sm-2">{{ trans('reports.total_expenses') }}</th>-->
                    <th class="col-sm-2">Total Modal</th>
                    @foreach($dates as $date)
                        <td class="text-right amount-space">@money($item->balance, $item->currency_code, true)</td>
                    @endforeach
                    <td class="text-right amount-space">@money(0, $item->currency_code, true)</td>
                </tr>
            </tfoot>
        </table>
        <table class="table" style="margin-top: 40px">
            <tbody>
                <tr>
                    <!--<th class="col-sm-2" colspan="6">{{ trans('reports.net_profit') }}</th>-->
                    <th class="col-sm-2" colspan="6">Total Selisih (0 = balance)</th>
                    @foreach($totals as $total)
                        <th class="col-sm-2 text-right"><span>@money($total['amount'], $total['currency_code'], true)</span></th>
                    @endforeach
                </tr>
            </tbody>
        </table>
    </div>
</div>