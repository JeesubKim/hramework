
namespace Hramework\Http;

interface IMiddleware {
    // The handle method takes a Request and a callable representing the next middleware or route handler.
    // It should return a Response.
    public function handle(Request $request, (function(Request): Response) $next): Response;
}
