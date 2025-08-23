<?php

namespace App\Traits;

use Spatie\Activitylog\Models\Activity;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Support\Str;

trait LogsCustomActivity
{
    use LogsActivity;

    // You can also define default logging config
    protected static $logOnlyDirty = true;
    protected static $recordEvents = ['updated', 'deleted'];

    public function tapActivity(Activity $activity, string $eventName)
    {
        // Get the current function name from the backtrace
        $functionName = debug_backtrace()[1]['function'];  // Name of the calling function
        $tableName = (new $activity->subject)->getTable(); // Assuming the activity model is related to the model being logged

        if ($eventName === 'updated') {
            // $changes = $activity->changes['attributes'] ?? [];
            $original = $activity->changes['old'] ?? [];

            $properties = $activity['properties'];

            $changes = $properties['attributes'] ?? [];
            // Initialize an empty array for changes
            $details = [];

            // If there are changes, create a readable string
            $details = collect($changes)->map(function ($new, $key){
                
                return "$key";
            })->implode(', ');

            $activity->log_name = "Updated: $functionName: $details";
            $activity->description = "Action: Updated, Method Name: $functionName, Table Name: $tableName, Attributes name: $details";
        }

        if ($eventName === 'deleted') {
            // If your model has a `title` or `name` field
            $label = $this->id ?? $this->email ?? 'item';
            $activity->log_name = "Deleted: {$label}";
        }
    }

    public function getLogNameToUse(string $eventName = ''): string
    {
        return $eventName;
    }
}
