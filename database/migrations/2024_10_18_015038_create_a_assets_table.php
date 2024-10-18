<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('a_assets', function (Blueprint $table) {
            $table->id();
            $table->string('a_opssm');
            $table->date('a_opssmdate');
            $table->string('a_reviewtaf');
            $table->date('a_tafdate');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('a_assets');
    }
};
