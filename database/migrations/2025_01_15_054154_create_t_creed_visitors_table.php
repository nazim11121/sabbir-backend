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
        Schema::create('t_creed_visitors', function (Blueprint $table) {
            $table->id();
            $table->string('device_id')->unique()->nullable()->index();
            $table->string('model_id')->unique()->nullable()->index();
            $table->string('brand')->unique()->nullable()->index();
            $table->string('ip_address')->nullable()->index();
            $table->string('mac_address')->unique()->nullable()->index();
            $table->boolean('status')->default(1)->comment('1=Active, 0=Inactive');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('t_creed_visitors');
    }
};
