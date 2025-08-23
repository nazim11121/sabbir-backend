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
        Schema::create('t_payments', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('business_id');
            $table->string('session_id', 191)->nullable();
            $table->string('invoice_id', 191)->nullable();
            $table->string('product_id', 191)->nullable();
            $table->string('payment_method_types', 100)->nullable();
            $table->mediumText('billing_address')->nullable();
            $table->string('subscription_plan_name', 100)->nullable();
            $table->double('payable_amount', 10,2)->unsigned()->default(0);
            $table->double('paid_amount', 10,2)->unsigned()->default(0);
            $table->string('currency', 100)->nullable();
            $table->string('customer_id', 191)->nullable();
            $table->string('customer_email', 191)->nullable();
            $table->string('discounts', 191)->nullable();
            $table->string('total_details', 191)->nullable();
            $table->string('mode', 191)->nullable();
            $table->string('subscription_id', 191)->nullable();
            $table->string('client_secret', 191)->nullable();
            $table->string('expand', 100)->nullable();
            $table->string('receipt_url', 255)->nullable();
            $table->string('payment_status', 191)->nullable();
            $table->boolean('status')->default(0)->comment('1=Payment Successful, 0=Payment Failed');
            $table->timestamp('subscription_start_date')->comment('Stores the payment date');
            $table->timestamp('subscription_expired_date')->comment('Stores the expired date of payment');

            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'))->comment('Stores the creation time of the record');
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'))->comment('Stores the last update time of the record');
            $table->softDeletes();
            // Foreign_key
            $table->foreign('business_id')->references('id')->on('t_businesses')->onDelete('cascade');

            // Indexes
            $table->index('business_id');
            $table->index('paid_amount');
            $table->index('status');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('t_payments');
        $table->dropForeign(['business_id']);
        $table->dropSoftDeletes();
    }
};
