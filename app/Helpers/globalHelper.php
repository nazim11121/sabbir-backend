<?php

use App\Models\Admin\TCompanyInfo;

if (!function_exists('getCompanyInfo')) {
    function getCompanyInfo()
    {
        return TCompanyInfo::first(); 
    }
}

// set sidebar active
function setSidebarActive(array $route)
{
    if (is_array($route)) {
        foreach ($route as $r) {
            if (request()->routeIs($r)) {
                return 'mm-active mm-show';
            }
        }
    }
}

