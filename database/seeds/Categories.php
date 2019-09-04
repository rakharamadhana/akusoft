<?php

namespace Database\Seeds;

use App\Models\Model;
use App\Models\Setting\Category;
use Illuminate\Database\Seeder;

class Categories extends Seeder
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

        $rows = [
            [
                'company_id' => $company_id,
                'name' => trans_choice('general.transfers', 1),
                'type' => 'other',
                'color' => '#605ca8',
                'enabled' => '0'
            ],
            [
                'company_id' => $company_id,
                'name' => trans('demo.categories_deposit'),
                'type' => 'income',
                'color' => '#f39c12',
                'enabled' => '0'
            ],
            [
                'company_id' => $company_id,
                'name' => trans('general.general'),
                'type' => 'item',
                'color' => '#00c0ef',
                'enabled' => '1'
            ],
            [
                'company_id' => $company_id,
                'name' => '410 Penjualan Barang Dagangan',
                'type' => 'income',
                'type_id' => '3',
                'color' => '#6da252',
                'enabled' => '1'
            ],
            [
                'company_id' => $company_id,
                'name' => '420 Lainnya',
                'type' => 'income',
                'type_id' => '3',
                'color' => '#5da355',
                'enabled' => '1'
            ],
            [
                'company_id' => $company_id,
                'name' => 'Laba',
                'type' => 'income',
                'type_id' => '4',
                'color' => '#6da400',
                'enabled' => '1'
            ],
            [
                'company_id' => $company_id,
                'name' => '510 Harga Pokok Penjualan (HPP)',
                'type' => 'expense',
                'type_id' => '4',
                'color' => '#c99736',
                'enabled' => '1'
            ],
            [
                'company_id' => $company_id,
                'name' => '520 Biaya Tenaga Kerja',
                'type' => 'expense',
                'type_id' => '5',
                'color' => '#f740f0',
                'enabled' => '1'
            ],
            [
                'company_id' => $company_id,
                'name' => '531 Sewa Toko',
                'type' => 'expense',
                'type_id' => '5',
                'color' => '#22877b',
                'enabled' => '1'
            ],
            [
                'company_id' => $company_id,
                'name' => '532 Biaya Perlengkapan Usaha',
                'type' => 'expense',
                'type_id' => '5',
                'color' => '#e3dd52',
                'enabled' => '1'
            ],
            [
                'company_id' => $company_id,
                'name' => '533 Biaya Kebersihan & Keamanan',
                'type' => 'expense',
                'type_id' => '5',
                'color' => '#f75959',
                'enabled' => '1'
            ],
            [
                'company_id' => $company_id,
                'name' => '534 Biaya Listrik, Telepon, & Air',
                'type' => 'expense',
                'type_id' => '5',
                'color' => '#85d2f2',
                'enabled' => '1'
            ],
            [
                'company_id' => $company_id,
                'name' => '535 Biaya ATK',
                'type' => 'expense',
                'type_id' => '5',
                'color' => '#85d5f5',
                'enabled' => '1'
            ],
            [
                'company_id' => $company_id,
                'name' => '536 Biaya Konsumsi Dapur',
                'type' => 'expense',
                'type_id' => '5',
                'color' => '#85d7f7',
                'enabled' => '1'
            ],
            [
                'company_id' => $company_id,
                'name' => '540 Biaya Transportasi',
                'type' => 'expense',
                'type_id' => '5',
                'color' => '#85d9f9',
                'enabled' => '1'
            ],
            [
                'company_id' => $company_id,
                'name' => '590 Biaya Lainnya',
                'type' => 'expense',
                'type_id' => '5',
                'color' => '#d2d6de',
                'enabled' => '1'
            ],
        ];

        foreach ($rows as $row) {
            Category::create($row);
        }
    }
}
