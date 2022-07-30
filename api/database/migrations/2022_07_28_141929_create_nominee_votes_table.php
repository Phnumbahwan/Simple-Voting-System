<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('nominee_votes', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('voter_id');
            $table->unsignedBigInteger('president_id');
            $table->unsignedBigInteger('vice_president_id');
            $table->unsignedBigInteger('treasurer_id');
            $table->foreign('voter_id')->references('id')->on('votes');
            $table->foreign('president_id')->references('id')->on('nominees');
            $table->foreign('vice_president_id')->references('id')->on('nominees');
            $table->foreign('treasurer_id')->references('id')->on('nominees');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('nominee_votes');
    }
};
