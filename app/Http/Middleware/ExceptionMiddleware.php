<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpFoundation\Response;

class ExceptionMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        try {
            return $next($request);
        } catch (NotFoundHttpException $e) {
            return response()->json([
                'message' => 'The requested route could not be found.'
            ], Response::HTTP_NOT_FOUND);
        } catch (MethodNotAllowedHttpException $e) {
            return response()->json([
                'message' => 'The requested method is not allowed for this route.'
            ], Response::HTTP_METHOD_NOT_ALLOWED);
        }
    }
}
