namespace Hramework\Core;

use Hramework\Http\Request;
use Hramework\Http\Response;
use Hramework\Routing\Router;

final class Kernel {
    private Router $router;

    public function __construct(vec<string> $controllerClasses) {
        $this->router = new Router();

        // echo "Kernel__construct: ".\var_dump($controllerClasses)."\n";
        $this->router->registerRoutesFromAttributes($controllerClasses);
    }

    public function handle(Request $request): Response {
                
        return $this->router->dispatch($request);
    }

    public function run(): void {
        $request = Request::createFromGlobals();

        $response = $this->handle($request);

        $response->send();
    }
}