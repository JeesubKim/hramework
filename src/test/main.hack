
use Hramework\Core\Kernel;
use Test\Controllers\UserController;
use Hramework\Http\Request;
use Hramework\Http\HttpMethod;
use Hramework\Http\Middleware\LoggingMiddleware;
use Hramework\Http\Middleware\PathParameterMiddleware;

<<__EntryPoint>>
function main(): void {
    init_autoload();

    // 1. Define which controllers to use
    $controllers = vec[
        UserController::class,
    ];

    // 2. Create a kernel with the controllers
    $kernel = new Kernel($controllers);
    
    // 3. Add middlewares (order matters! PathParameterMiddleware before LoggingMiddleware)
    $kernel->addMiddleware(new PathParameterMiddleware($controllers)); // Pass controllers to PathParameterMiddleware
    $kernel->addMiddleware(new LoggingMiddleware());

    // --- Simulate a GET request for /users with query params ---
    echo "\n--- Simulating GET /users?id=123&name=Alice ---\n";
    $getRequestWithQuery = new Request(HttpMethod::GET, '/users?id=123&name=Alice', dict[], null);
    $getResponseWithQuery = $kernel->handle($getRequestWithQuery);
    $getResponseWithQuery->send();

    // --- Simulate a GET request for /users/<id> ---
    echo "\n--- Simulating GET /users/456 ---\n";
    $getRequestWithPath = new Request(HttpMethod::GET, '/users/456', dict[], null);
    $getResponseWithPath = $kernel->handle($getRequestWithPath);
    $getResponseWithPath->send();

    // --- Simulate a POST request for /users ---
    echo "\n--- Simulating POST /users ---\n";
    $postBody = '{"name": "John Doe", "email": "john.doe@example.com"}';
    $postRequest = new Request(HttpMethod::POST, '/users', dict['Content-Type' => 'application/json'], $postBody);
    $postResponse = $kernel->handle($postRequest);
    $postResponse->send();

    echo "\n--- Simulation Complete ---\n";
}

function init_autoload():void {
    require_once(__DIR__."/../../vendor/autoload.hack");
    \Facebook\AutoloadMap\initialize();
}
