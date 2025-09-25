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
        Schema::create('mail_accounts', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable(); // eg: Quotex Mail
            $table->string('host')->default('imap.gmail.com');
            $table->integer('port')->default(993);
            $table->string('encryption')->default('ssl');
            $table->string('validate_cert')->default('true');
            $table->string('username'); // email
            $table->string('password'); // app password (encrypted ideally)
            $table->mediumText('remarks')->nullable();
            $table->boolean('connection_status', 2)->default(0)->comment('1=Active, 0=Inactive');
            $table->boolean('status', 2)->default(1)->comment('1=Active, 0=Inactive');
            $table->unsignedBigInteger('created_by')->nullable()->comment('Stores the ID of the user who created the record');
            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'))->comment('Stores the creation time of the record');
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'))->comment('Stores the last update time of the record');
            $table->foreign('created_by')->references('id')->on('users')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mail_accounts');
    }
};
