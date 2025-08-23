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
        Schema::create('t_business_profile_visitors', function (Blueprint $table) {
            $table->id();
            $table->string('device_id')->nullable()->index();
            $table->unsignedBigInteger('business_id')->nullable()->index();
            $table->string('model_id')->nullable()->index();
            $table->string('brand')->nullable()->index();
            $table->string('ip_address')->nullable()->index();
            $table->string('mac_address')->nullable()->index();
            $table->boolean('status')->default(1)->comment('1=Active, 0=Inactive');
            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'))->comment('Stores the creation time of the record');
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'))->comment('Stores the last update time of the record');
            $table->softDeletes();
            // Foreign_key
            $table->foreign('business_id')->references('id')->on('t_businesses')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('t_business_profile_visitors');
        $table->dropForeign(['business_id']);
        $table->dropSoftDeletes();
    }
};
