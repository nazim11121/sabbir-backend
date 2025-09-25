<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Session\Middleware\StartSession;

use App\Http\Middleware\ExceptionMiddleware;
use Spatie\Permission\Middleware\RoleMiddleware;
use Spatie\Permission\Middleware\PermissionMiddleware;
use Spatie\Permission\Middleware\RoleOrPermissionMiddleware;
use App\Jobs\FetchBinanceDeposits;
use App\Jobs\ProcessMailAccount;
use App\Models\MailAccount;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )

    // 🔹 Global & route middleware
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->append(StartSession::class);
        $middleware->append(ExceptionMiddleware::class);

        $middleware->alias([
            'role'               => RoleMiddleware::class,
            'permission'         => PermissionMiddleware::class,
            'role_or_permission' => RoleOrPermissionMiddleware::class,
        ]);
    })

    // 🔹 Scheduled tasks
    ->withSchedule(function (Schedule $schedule) {
        // Dispatch Binance deposits job every minute
        $schedule->job(new FetchBinanceDeposits())->everyMinute();

        // Dispatch ProcessMailAccount for each MailAccount every minute
        $schedule->call(function () {
            // Only accounts that actually have a `to_mail` address
            MailAccount::whereNotNull('to_mail')
                ->where('to_mail', '!=', '')          // exclude empty strings
                ->pluck('id')
                ->each(function ($id) {
                    ProcessMailAccount::dispatch($id);
                });
        })->everyMinute();
    })

    // 🔹 Exception reporting / rendering
    ->withExceptions(function (Exceptions $exceptions) {
        // Customize exception handling here if needed
    })

    ->create();
