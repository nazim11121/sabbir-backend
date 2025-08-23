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
        Schema::create('t_admin_pricing_plans', function (Blueprint $table) {
            $table->id();
            $table->string('type_name', 100)->comment('Price Planning Type Name');
            $table->string('pricing', 100)->nullable(); 
            $table->string('plan_duration', 100)->nullable(); 
            $table->string('key_tag', 100)->nullable(); 
            $table->mediumText('feature_title')->nullable(); 
            $table->string('feature_status', 191)->nullable(); 
            $table->mediumText('description')->nullable(); 
            $table->boolean('status')->default(1)->comment('1=Active, 0=Inactive');
            $table->unsignedBigInteger('created_by')->nullable()->comment('Admin user who created the record');
            $table->unsignedBigInteger('updated_by')->nullable()->comment('Admin user who last updated the record');
            $table->foreign('created_by')->references('id')->on('t_admin_users')->onDelete('SET NULL');
            $table->foreign('updated_by')->references('id')->on('t_admin_users')->onDelete('SET NULL');
            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'))->comment('Stores the creation time of the record');
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'))->comment('Stores the last update time of the record');

            // Indexes
            $table->index('type_name');
            $table->index('pricing');
            $table->index('plan_duration');
            $table->index('key_tag');
            $table->index('status');
            $table->index('created_by');
            $table->index('updated_by');
            $table->index('created_at');
            $table->index('updated_at');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('t_admin_pricing_plans');
    }
};
