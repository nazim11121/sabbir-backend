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
        Schema::create('t_invests', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->nullable()->index();
            $table->string('category_id', 100)->nullable();
            $table->string('package_id', 100)->nullable();
            $table->decimal('amount', 10,2)->nullable();
            $table->string('order_id', 100)->nullable();
            $table->string('invest_proof', 191)->nullable();
            $table->boolean('payment_status', 2)->default(1)->comment('1=Success, 0=Processing, 2=Failed');
            $table->mediumText('remarks')->nullable();
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
        Schema::dropIfExists('t_invests');
    }
};
