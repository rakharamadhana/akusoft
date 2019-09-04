<div class="box-body">
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th class="col-sm-2">&nbsp;</th>
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
                                <td>{{ $item->name }}</td>
                            @else
                            
                                <th class="col-sm-2 text-right">{{ trans('reports.quarter.' . $date) }}</th>
                            
                                <td><a href="{{ route('accounts.edit', $item->id) }}">{{ $item->name }}</a></td>
                            @endif

                            @php $totals['harta'] += $item->balance; @endphp
                            
                            <td class="text-right amount-space">@money($item->balance, $item->currency_code, true)</td>
                            
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
                    <td class="text-right amount-space">@money($totals['harta'], $item->currency_code, true)</td>
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
                                <td>{{ $item->name }}</td>
                            @else
                                <td><a href="{{ route('accounts.edit', $item->id) }}">{{ $item->name }}</a></td>
                            @endif
                            @php $totals['kewajiban'] += $item->balance; @endphp
                            <td class="text-right amount-space">@money($item->balance, $item->currency_code, true)</td>
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
                    <td class="text-right amount-space">@money($totals['kewajiban'], $item->currency_code, true)</td>
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
                                <td>{{ $item->name }}</td>
                            @else
                                <td>{{ $item->name }}</td>
                            @endif                     
                            @php $totals['modal'] += $item->balance; @endphp       
                            <td class="text-right amount-space">@money($item->balance, $item->currency_code, true)</td>
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
                    <td class="text-right amount-space">@money($totals['modal'], $item->currency_code, true)</td>
                </tr>
            </tfoot>
        </table>
        <table class="table" style="margin-top: 40px">
            <tbody>
                <tr>
                    <!--<th class="col-sm-2">{{ trans('reports.gross_profit') }}</th>-->
                    <th class="col-sm-2" colspan="6">Total Harta</th>
                    @php $totals['harta-kewajiban-modal'] += $totals['harta']; @endphp      
                    <td class="text-right amount-space">@money($totals['harta'], $item->currency_code, true)</td>
                </tr>
                <tr>
                    <!--<th class="col-sm-2">{{ trans('reports.total_expenses') }}</th>-->
                    <th class="col-sm-2" colspan="6">Total Kewajiban</th>
                    @php $totals['harta-kewajiban-modal'] -= $totals['kewajiban']; @endphp      
                    <td class="text-right amount-space">@money($totals['kewajiban'], $item->currency_code, true)</td>
                </tr>
                <tr>
                    <!--<th class="col-sm-2">{{ trans('reports.total_expenses') }}</th>-->
                    <th class="col-sm-2" colspan="6">Total Modal</th>
                    @php $totals['harta-kewajiban-modal'] -= $totals['modal']; @endphp      
                    <td class="text-right amount-space">@money($totals['modal'], $item->currency_code, true)</td>
                </tr>
                <tr>
                    <th class="col-sm-2" colspan="6">Keterangan</th>
                    <td class="text-right amount-space">
                        @php
                        if($totals['harta-kewajiban-modal'] != 0){
                            echo '<strong>Tidak Balance!</strong>';
                        }else{
                            echo '<strong>Balance!</strong>';
                        }
                        @endphp
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>