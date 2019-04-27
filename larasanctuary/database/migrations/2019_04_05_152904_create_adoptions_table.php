<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAdoptionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('adoptions', function (Blueprint $table) {
            $table->bigIncrements('id')->unsigned();
            $table->timestamps();
            $table->bigInteger('userid')->unsigned();
            $table->bigInteger('animalid')->unsigned();
            $table->enum('status', ['approved','denied','pending']);
        });



        Schema::table('adoptions', function(Blueprint $table) {
          $table->foreign('userid')->references('id')->on('users')->onDelete('cascade');
          $table->foreign('animalid')->references('id')->on('animals')->onDelete('cascade');
   });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('adoptions');
    }
}
