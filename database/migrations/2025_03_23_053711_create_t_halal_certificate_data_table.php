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
        Schema::create('t_halal_certificate_data', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('business_id');
            $table->string('certificate_by', 100)->nullable();
            $table->string('halal_certificate', 191)->nullable();
            $table->boolean('status')->default(1)->comment('1=Active, 0=Inactive');
            $table->foreign('business_id')->references('id')->on('t_businesses')->onDelete('cascade');
            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'))->comment('Stores the creation time of the record');
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'))->comment('Stores the last update time of the record');
            $table->softDeletes();
             // Indexes
             $table->index('business_id');
             $table->index('certificate_by');
             $table->index('halal_certificate');
             $table->index('status');
             $table->index('created_at');
             $table->index('updated_at');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('t_halal_certificate_data');
        $table->dropSoftDeletes();
    }
};
