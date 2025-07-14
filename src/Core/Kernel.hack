namespace Hramework\Core;

use Hramework\Http\Request;
use Hramework\Http\Response;
use Hramework\Http\IMiddleware;
use Hramework\Routing\Router;
final class Kernel {
    private Router $router;
    private vec<IMiddleware> $middlewares = vec[];

    private (function(Request):Response) $middlewareChain;

    public function __construct(vec<string> $controllerClasses) {
        $this->router = new Router();
        $this->router->registerRoutesFromAttributes($controllerClasses);

        $this->middlewareChain = $this->buildMiddlewareChain();
    }


    public function addMiddleware(IMiddleware $middleware): void {
        $this->middlewares[] = $middleware;

        echo "Middleware is added after the Kernel is set. Rebuilding the middleware chain...\n";
        $this->middlewareChain = $this->buildMiddlewareChain();
    }


    public function handle(Request $request): Response {

        return ($this->middlewareChain)($request);
    }

    private function buildMiddlewareChain(): (function(Request):Response) {

        $finalHandler = ($req): Response ==> {
            return $this->router->dispatch($req);
        };
        
        $stack = $finalHandler;
        foreach (\array_reverse($this->middlewares) as $middleware) {
            $currentStack = $stack; 
            $stack = ($req):Response ==> {
                return $middleware->handle($req, $currentStack);
            };
        }

        return $stack;
    }
    public function run(): void {
        $request = Request::createFromGlobals();

        $response = $this->handle($request);

        $response->send();
    }
}