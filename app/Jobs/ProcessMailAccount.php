<?php

namespace App\Jobs;

use App\Models\MailAccount;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;
use Webklex\IMAP\Facades\Client;
use Illuminate\Support\Facades\Log;

class ProcessMailAccount implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $accountId;

    // Maximum attempts before marking failed
    public $tries = 5;

    // Timeout for long running jobs
    public $timeout = 120;

    public function __construct(int $accountId)
    {
        $this->accountId = $accountId;
    }

    public function handle(): void
    {
        try {
            $account = MailAccount::find($this->accountId);

            if (!$account) {
                Log::warning("MailAccount {$this->accountId} not found. Skipping job.");
                return;
            }

            Log::info("ProcessMailAccount started for account: {$account->username}");

            // Create dynamic IMAP client for this account
            $client = Client::make([
                'host'          => $account->host,
                'port'          => $account->port,
                'encryption'    => $account->encryption,
                'validate_cert' => true,
                'username'      => $account->username,
                'password'      => $account->password,
                'protocol'      => 'imap',
            ]);

            $client->connect();

            $inbox = $client->getFolder('INBOX');
            $messages = $inbox->messages()->unseen()->get();

            foreach ($messages as $message) {
                $from    = $message->getFrom()[0]->mail ?? null;
                $subject = $message->getSubject();
                $body    = $message->getHTMLBody() ?: $message->getTextBody();

                // Forward specific emails
                if ($from === 'noreply@qxbroker.com' && str_contains($subject, 'Authentication pincode')) {
                    Mail::html($body, function ($mail) use ($subject, $account) {
                        $mail->to($account->to_mail)
                             ->subject($subject);
                    });

                    // Mark as seen to avoid duplicate processing
                    $message->setFlag('Seen');
                    Log::info("Message forwarded: {$subject}");
                }
            }

            Log::info("ProcessMailAccount finished for account: {$account->username}");

        } catch (\Exception $e) {
            Log::error("ProcessMailAccount failed for ID {$this->accountId}: " . $e->getMessage());
        }
    }

    public function failed(\Throwable $exception)
    {
        Log::error("ProcessMailAccount permanently failed for ID {$this->accountId}: " . $exception->getMessage());
    }
}
