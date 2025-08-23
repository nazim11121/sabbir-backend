<?php

namespace App\Http\Controllers\Admin\Backup;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\Process\Exception\ProcessFailedException;
use Symfony\Component\Process\Process;

class AdminDatabaseCo extends Controller
{
    public function backup() {
        try {
            $backupPath = storage_path('app');

            // Get all SQL files from the folder
            $files = collect(scandir($backupPath))
                ->filter(fn($file) => str_ends_with($file, '.sql'))
                ->map(fn($file) => [
                    'name' => $file,
                    'size' => round(filesize("$backupPath/$file") / 1024, 2) . ' KB', // Convert bytes to KB
                    'created_at' => date('Y-m-d H:i:s', filemtime("$backupPath/$file")), // Last modified time
                    'path' => "backups/$file"
                ])
                ->values();

            return view('admin.backup.backup', [
                'files'         => $files,
            ]);
        } catch(\Exception $e) {
            return $e->getMessage();
        }
    }

    public function backupDatabase()
    {
        try {
            $databaseName = env('DB_DATABASE');
            $username = env('DB_USERNAME');
            $password = env('DB_PASSWORD');
            $host = env('DB_HOST');
            $port = env('DB_PORT', '3306');

            $date = now()->format('Y-m-d_H-i-s');
            $backupFile = "app/creed_{$date}.sql";

            $command = "mysqldump --user={$username} --password={$password} --host={$host} --port={$port} {$databaseName} > " . storage_path($backupFile);

            exec($command, $output, $return);

            if ($return === 0) {
               return back()->with('success', 'Backup Successful');
            } else {
              return back()->with('error', 'Backup is not working');
            }
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    public function backupDownload($file) {
        try {
            $filePath = storage_path("app/{$file}");

            if (!file_exists($filePath)) {
                return back()->with('error', 'File not found!');
            } else {
                return response()->download($filePath);
            }

        } catch(\Exception $e) {
            return $e->getMessage();
        }
    }

    public function backupDelete($file) {
        try {

            $filePath = storage_path("app/{$file}");

            if (file_exists($filePath)) {
                unlink($filePath);
                return back()->with('success', 'Backup deleted successfully!');
            } else {
                return back()->with('error', 'File not found');
            }
        } catch(\Exception $e) {
            return $e->getMessage();
        }
    }
}
