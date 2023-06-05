<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class CitiesTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('cities')->delete();
        
        \DB::table('cities')->insert(array (
            0 => 
            array (
                'id' => 1,
                'name' => 'Casablanca',
                'state_id' => 1,
                'is_active' => 0,
                'created_at' => '2023-06-02 00:00:00',
                'updated_at' => '2023-06-02 00:00:00',
            ),
            1 => 
            array (
                'id' => 2,
                'name' => 'Rabat',
                'state_id' => 1,
                'is_active' => 0,
                'created_at' => '2023-06-02 00:00:00',
                'updated_at' => '2023-06-02 00:00:00',
            ),
            2 => 
            array (
                'id' => 3,
                'name' => 'Marrakech',
                'state_id' => 1,
                'is_active' => 0,
                'created_at' => '2023-06-02 00:00:00',
                'updated_at' => '2023-06-02 00:00:00',
            ),
            3 => 
            array (
                'id' => 4,
                'name' => 'Fez',
                'state_id' => 1,
                'is_active' => 0,
                'created_at' => '2023-06-02 00:00:00',
                'updated_at' => '2023-06-02 00:00:00',
            ),
            4 => 
            array (
                'id' => 5,
                'name' => 'Agadir',
                'state_id' => 2,
                'is_active' => 0,
                'created_at' => '2023-06-02 00:00:00',
                'updated_at' => '2023-06-02 00:00:00',
            ),
            5 => 
            array (
                'id' => 6,
                'name' => 'Tangier',
                'state_id' => 2,
                'is_active' => 0,
                'created_at' => '2023-06-02 00:00:00',
                'updated_at' => '2023-06-02 00:00:00',
            ),
            6 => 
            array (
                'id' => 7,
                'name' => 'Meknes',
                'state_id' => 2,
                'is_active' => 0,
                'created_at' => '2023-06-02 00:00:00',
                'updated_at' => '2023-06-02 00:00:00',
            ),
            7 => 
            array (
                'id' => 8,
                'name' => 'Oujda',
                'state_id' => 2,
                'is_active' => 0,
                'created_at' => '2023-06-02 00:00:00',
                'updated_at' => '2023-06-02 00:00:00',
            ),
            8 => 
            array (
                'id' => 9,
                'name' => 'Kenitra',
                'state_id' => 1,
                'is_active' => 0,
                'created_at' => '2023-06-02 00:00:00',
                'updated_at' => '2023-06-02 00:00:00',
            ),
            // Add more city names here
            // ...
        ));
    }
}
