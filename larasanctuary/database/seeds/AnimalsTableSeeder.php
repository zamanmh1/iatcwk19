<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\User;

class AnimalsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // create an instance of Faker class to the variable $faker
        $faker = Faker::create();

        // get all existing user ids into a $users array
        $users = User::all()->pluck('id')->toArray();

        // generate 100 records for the animals table
        foreach (range(1,100) as $index){
          DB::table('animals')->insert([
            'id'=>$faker->randomNumber($nbDigits = 7, $strict = false),
            'name' =>$faker->firstName(),
            'birth_year' =>$faker->year($max = 'now'),
            'description'=>$faker->sentence($nbWords = 6, $variableNbWords = true),
            'type_of_pet'=>$faker->randomElement($array=array('cat','dog','bird',
            'rabbit', 'horse','ferret',
            'fish', 'rat/mice',
            'amphibian','reptile'))
          ]);
        }
    }
}
