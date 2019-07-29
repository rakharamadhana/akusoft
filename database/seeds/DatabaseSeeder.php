<?php

use Illuminate\Database\Seeder;

use App\Models\Model;
use App\Models\Auth\User;
use App\Models\Common\Company;
use Carbon\Carbon;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {        
        $this->call(Database\Seeds\TestCompany::class);
    }
}
