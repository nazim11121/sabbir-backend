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
use App\Jobs\AddShareCommission;
use App\Models\MailAccount;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->append(StartSession::class);
        $middleware->append(ExceptionMiddleware::class);

        $middleware->alias([
            'role'               => RoleMiddleware::class,
            'permission'         => PermissionMiddleware::class,
            'role_or_permission' => RoleOrPermissionMiddleware::class,
        ]);
    })
    ->withSchedule(function (Schedule $schedule) {

        // 🔹 Binance deposits every minute
        $schedule->job(new FetchBinanceDeposits())->everyMinute();

        // 🔹 Process MailAccount every minute
        $schedule->call(function () {
            MailAccount::whereNotNull('to_mail')
                ->where('to_mail', '!=', '')
                ->pluck('id')
                ->each(function ($id) {
                    ProcessMailAccount::dispatch($id);
                });
        })->everyMinute();

        // 🔹 Add Share Commission every hour
        $schedule->job(new AddShareCommission())->hourly(); //hourly

    })
    ->withExceptions(function (Exceptions $exceptions) {
        // Custom exception handling if needed
    })
    ->create();
