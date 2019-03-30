<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAnimalsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('animals', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('userid')->unsigned();
            $table->string('name', 30);
            $table->year('birth_year');
            $table->mediumText('description')->nullable();
            $table->string('image', 256)->nullable();
            $table->boolean('is_available')->default(1); // is animal available for adoption?
            $table->enum('type_of_pet',['cat','dog','bird','rabbit', 'horse','ferret',
            'fish', 'rat/mice', 'amphibian','reptile'])->default('dog');
            $table->timestamps();

            /*
              Define a userid colum in animals table
              which references id column in users table
            */
            $table->foreign('userid')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('animals');
    }
}
