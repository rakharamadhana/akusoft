<?php

namespace Database\Seeds;

use App\Models\Model;
use App\Models\Auth\User;
use App\Models\Common\Company;
use Date;
use Illuminate\Database\Seeder;

class TestCompany extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Model::unguard();

        $this->call(Roles::class);

        $this->createCompany();

        $this->createUser();

        Model::reguard();
    }

    private function createCompany()
    {
        $rows = [
            [
                'id' => '1',
                'domain' => 'akusoftapp.com',
            ],
        ];

        foreach ($rows as $row) {
            Company::create($row);
        }

        setting()->setExtraColumns(['company_id' => '1']);
        setting()->set([
            'general.company_name'              => 'AKUSOFT V.2',
            'general.company_email'             => 'admin@akusoftapp.com',
            'general.company_address'           => 'Indonesia',
            'general.financial_start'           => '01-01',
            'general.default_currency'          => 'IDR',
            'general.default_account'           => '1',
            'general.admin_theme'               => 'skin-black',
            'general.default_payment_method'    => 'offlinepayment.cash.1',
            'general.schedule_bill_days'        => '10,5,3,1',
            'general.schedule_invoice_days'     => '1,3,5,10',
            'general.send_invoice_reminder'     => true,
            'general.send_bill_reminder'        => true,
        ]);
        setting()->save();

        $this->command->info('Test company created.');
    }

    public function createUser()
    {
        // Create user
        $user = User::create([
            'name' => 'Admin',
            'email' => 'admin@akusoftapp.com',
            'password' => 'admin123',
            'last_logged_in_at' => Date::now(),
        ]);

        // Attach Role
        $user->roles()->attach(1);

        // Attach company
        $user->companies()->attach(1);

        $this->command->info('Admin user created.');
    }
}
