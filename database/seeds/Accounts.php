<?php

namespace Database\Seeds;

use App\Models\Model;
use App\Models\Banking\Account;
use Illuminate\Database\Seeder;

// Test 2

class Accounts extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Model::unguard();

        $this->create();

        Model::reguard();
    }

    private function create()
    {
        $company_id = $this->command->argument('company');

        setting()->forgetAll();
        setting()->setExtraColumns(['company_id' => $company_id]);

        $rows = [
            [
                'company_id' => $company_id,
                'type' => '1',
                'name' => 'Kas',
                'number' => '110',
                'currency_code' => 'IDR',
                'bank_name' => 'Kas',
                'enabled' => '1',
            ],
            [
                'company_id' => $company_id,
                'type' => '1',
                'name' => 'Bank',
                'number' => '120',
                'currency_code' => 'IDR',
                'bank_name' => '',
                'enabled' => '1',
            ],
            [
                'company_id' => $company_id,
                'type' => '1',
                'name' => 'Piutang Usaha',
                'number' => '130',
                'currency_code' => 'IDR',
                'bank_name' => '',
                'enabled' => '1',
            ],
            [
                'company_id' => $company_id,
                'type' => '1',
                'name' => 'Persediaan Barang Dagang',
                'number' => '140',
                'currency_code' => 'IDR',
                'bank_name' => '',
                'enabled' => '1',
            ],
            [
                'company_id' => $company_id,
                'type' => '1',
                'name' => 'Gedung',
                'number' => '150',
                'currency_code' => 'IDR',
                'bank_name' => '',
                'enabled' => '1',
            ],
            [
                'company_id' => $company_id,
                'type' => '1',
                'name' => 'Kendaraan',
                'number' => '160',
                'currency_code' => 'IDR',
                'bank_name' => '',
                'enabled' => '1',
            ],
            [
                'company_id' => $company_id,
                'type' => '1',
                'name' => 'Mesin',
                'number' => '170',
                'currency_code' => 'IDR',
                'bank_name' => '',
                'enabled' => '1',
            ],
            [
                'company_id' => $company_id,
                'type' => '1',
                'name' => 'Peralatan Usaha',
                'number' => '180',
                'currency_code' => 'IDR',
                'bank_name' => '',
                'enabled' => '1',
            ],
            [
                'company_id' => $company_id,
                'type' => '2',
                'name' => 'Hutang Usaha',
                'number' => '210',
                'currency_code' => 'IDR',
                'bank_name' => '',
                'enabled' => '1',
            ],
            [
                'company_id' => $company_id,
                'type' => '2',
                'name' => 'Hutang Bank',
                'number' => '220',
                'currency_code' => 'IDR',
                'bank_name' => '',
                'enabled' => '1',
            ],
            [
                'company_id' => $company_id,
                'type' => '2',
                'name' => 'Hutang Leasing',
                'number' => '230',
                'currency_code' => 'IDR',
                'bank_name' => '',
                'enabled' => '1',
            ],
            [
                'company_id' => $company_id,
                'type' => '2',
                'name' => 'Hutang Lain-lain',
                'number' => '240',
                'currency_code' => 'IDR',
                'bank_name' => '',
                'enabled' => '1',
            ],
            [
                'company_id' => $company_id,
                'type' => '3',
                'name' => 'Modal Awal',
                'number' => '310',
                'currency_code' => 'IDR',
                'bank_name' => '',
                'enabled' => '1',
            ],
            [
                'company_id' => $company_id,
                'type' => '3',
                'name' => 'Laba Ditahan Periode Lalu',
                'number' => '320',
                'currency_code' => 'IDR',
                'bank_name' => '',
                'enabled' => '1',
            ],
            [
                'company_id' => $company_id,
                'type' => '3',
                'name' => 'Laba Periode Berjalan',
                'number' => '330',
                'currency_code' => 'IDR',
                'bank_name' => '',
                'enabled' => '1',
            ],
        ];

        foreach ($rows as $row) {
            $account = Account::create($row);

            setting()->set('general.default_account', $account->id);
        }
    }
}
