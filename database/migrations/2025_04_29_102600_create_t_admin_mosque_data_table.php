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
        Schema::create('t_admin_mosque_data', function (Blueprint $table) {
            $table->id();
            $table->string('name', 100)->nullable()->comment('Name of the mosque')->index();
            $table->string('phone', 100)->nullable();
            $table->string('address', 255)->nullable()->comment('Address of the mosque');
            $table->string('lat', 100)->nullable()->comment('Latitude of the mosque location');
            $table->string('lng', 100)->nullable()->comment('Longitude of the mosque location');
            $table->string('place_id', 255)->nullable()->comment('Place Id of the mosque');
            $table->string('icon', 255)->nullable()->comment('Icon of the mosque');
            $table->mediumText('photos')->nullable()->comment('Image of the mosque');
            $table->mediumText('website')->nullable()->comment('Website of the mosque');
            $table->mediumText('opening_hour')->nullable()->comment('Opening hours of the mosque');
            $table->string('rating', 11)->nullable()->comment('Rating of the mosque');
            $table->string('description', 191)->nullable()->comment('Description of the mosque');
            $table->boolean('status', 2)->default(1)->comment('1=Active, 0=Inactive');
            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'))->comment('Stores the creation time of the record');
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'))->comment('Stores the last update time of the record');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('t_admin_mosque_data');
    }
};
