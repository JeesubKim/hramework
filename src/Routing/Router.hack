

namespace Hramework\Routing;

use Hramework\Attributes\Route;
use Hramework\Http\HttpMethod;
use Hramework\Http\Request;
use Hramework\Http\Response;
use ReflectionClass;

final class Router {
    private vec<(HttpMethod, string, (function(Request):Response))> $routes = vec[];

    public function register(HttpMethod $method, string $path, (function(Request):Response) $handler): void {
        $this->routes[] = tuple($method, $path, $handler);
        echo "Registered Route: ".$method." ".$path."\n"; // Debug
        
    }

    public function dispatch(Request $request): Response {
        echo "Dispatching Request: ".$request->getMethod()." ".$request->getUri()."\n"; // Debug
        
        foreach ($this->routes as list($method, $path, $handler)) {
            
            if (!($method is HttpMethod)) { // Changed from instanceof to is
                echo "  Error: \$method is not an HttpMethod object! Type: ".\gettype($method)." Value: ".$method."\n"; // Debug
                continue; // Skip this route if type is incorrect
            }
            
            if ($method === $request->getMethod() && $path === $request->getUri()) { // Compare values
                
                return $handler($request);
            }
        }
        echo "  No Route Matched. Returning 404.\n"; // Debug
        return new Response('404 Not Found\n', 404);
    }

    public function registerRoutesFromAttributes(vec<string> $classNames): void {


        foreach ($classNames as $className) {
            $reflectionClass = new ReflectionClass($className);
            foreach ($reflectionClass->getMethods() as $method) {
                $attributes = $method->getAttributes(Route::class);

                
                if (\count($attributes) > 0 && isset($attributes["Route"])) {
                    
                    list($routeMethod, $routePath) = $attributes["Route"];
                    
                    $handler = (Request $req): Response ==> {
                        $controller = new $className();

                        return $method->invoke($controller, $req);
                    };
                    
                    // For static methods
                    if ($method->isStatic()) {
                        $handler = (Request $req): Response ==> {
                            return $className::{$method->getName()}($req);
                        };
                    }
                    
                    $this->register($routeMethod, $routePath, $handler);
                }
            }
        }
    }
}
