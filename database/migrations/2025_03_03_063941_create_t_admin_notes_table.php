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
        Schema::create('t_admin_notes', function (Blueprint $table) {
            $table->id();
            $table->string('owner_info_page')->nullable()->index();
            $table->string('business_info_step_1')->nullable()->index();
            $table->string('business_info_step_2')->nullable()->index();
            $table->string('business_info_step_3')->nullable()->index();
            $table->string('business_info_step_4')->nullable()->index();
            $table->string('business_info_step_5')->nullable()->index();
            $table->string('business_info_step_6')->nullable()->index();
            $table->string('business_info_step_7')->nullable()->index();
            $table->boolean('status')->default(1)->comment('1=Active, 0=Inactive');
            $table->unsignedBigInteger('created_by')->nullable()->comment('Admin user who created the record');
            $table->unsignedBigInteger('updated_by')->nullable()->comment('Admin user who last updated the record');
            $table->foreign('created_by')->references('id')->on('t_admin_users')->onDelete('SET NULL');
            $table->foreign('updated_by')->references('id')->on('t_admin_users')->onDelete('SET NULL');
            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'))->comment('Stores the creation time of the record');
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'))->comment('Stores the last update time of the record');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('t_admin_notes');
    }
};
