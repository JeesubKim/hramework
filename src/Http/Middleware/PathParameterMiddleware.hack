
namespace Hramework\Http\Middleware;

use Hramework\Http\IMiddleware;
use Hramework\Http\Request;
use Hramework\Http\Response;
use Hramework\Logging\Logger;

final class PathParameterMiddleware implements IMiddleware {
    // private dict<string, (string, vec<string>)> $routePatterns = dict[];

    public function __construct(vec<string> $controllerClasses) {
        foreach ($controllerClasses as $className) {
            $reflectionClass = new \ReflectionClass($className);
            foreach ($reflectionClass->getMethods() as $method) {
                $attributes = $method->getAttributes(\Hramework\Attributes\Route::class);
                if (\count($attributes) > 0 && isset($attributes[0])) {
                    $routeAttribute = $attributes[0]->newInstance();
                    $originalPath = $routeAttribute->path;

                    $paramNames = vec[];
                    $pattern = $this->buildRegexPattern($originalPath, $paramNames);

                    $this->routePatterns[$originalPath] = tuple($pattern, $paramNames);
                }
            }
        }
    }

    private function buildRegexPattern(string $path, vec<string> $paramNames): string {
        
        $pattern = \preg_replace_callback(
            '/<([a-zA-Z0-9_]+)>/u',
            $matches ==> {
                $paramNames[] = $matches[1];
                return '([a-zA-Z0-9_]+)';
            },
            
            $path
        );
        return '/^'.\str_replace('/', '\\/', $pattern).'$/';
        
    }
    
    public function handle(Request $request, (function(Request): Response) $next): Response {
        $uri = $request->getUri();
        $method = (string)$request->getMethod(); 

        echo "[DEBUG][$method] - $uri";

        $pathParams = dict[];
        $matchedPattern = null;

        foreach ($this->routePatterns as $originalPath => list($pattern, $paramNames)) {
            
            $matches = vec[];
            if (\preg_match($pattern, $uri, $matches)) {
                echo "===> $pattern";
                $matchedPattern = $originalPath;
                for ($i = 0; $i < \count($paramNames); $i++) {
                    $pathParams[$paramNames[$i]] = $matches[$i + 1];
                }
                break;
            }
        }
        echo "[DEBUG]";
        \var_dump($pathParams);
        if (!C\is_empty($pathParams)) {
            Logger::info("Path parameters extracted for '{$matchedPattern}': ".\json_encode($pathParams), __FILE__);
            $newRequest = new Request(
                $request->getMethod(),
                $request->getUri(),
                $request->getHeaders(),
                $request->getBody(),
                $request->getQueryParams(),
                $pathParams
            );
            return $next($newRequest);
        }

        return $next($request);
        
    }
}
