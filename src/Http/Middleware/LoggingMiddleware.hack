
namespace Hramework\Http\Middleware;

use Hramework\Http\IMiddleware;
use Hramework\Http\Request;
use Hramework\Http\Response;
use Hramework\Logging\Logger; // Logger 클래스 추가

final class LoggingMiddleware implements IMiddleware {
    public function handle(Request $request, (function(Request): Response) $next): Response {
        // Logger::info를 사용하여 요청 로깅
        Logger::info("Request received: ".$request->getMethod()." ".$request->getUri());

        // Call the next middleware/handler in the stack
        $response = $next($request);

        // Logger::info를 사용하여 응답 로깅
        Logger::info("Response sent with status: ".$response->getStatusCode());
        return $response;
    }
}
