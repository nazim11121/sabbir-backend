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
        Schema::create('binance_deposits', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->string('user_wallet', 191)->nullable();
            $table->string('binance_id', 255)->nullable();
            $table->decimal('amount', 10, 4)->nullable();
            $table->string('coin', 191)->nullable();
            $table->string('network', 191)->nullable();
            $table->string('binance_status')->nullable();
            $table->string('address', 191)->nullable();
            $table->string('txId')->unique()->nullable();
            $table->string('insertTime', 191)->nullable();
            $table->string('completeTime', 191)->nullable();
            $table->string('confirmTimes')->nullable();
            $table->string('status')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('binance_deposits');
    }
};
