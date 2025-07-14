use Hramework\Core\Kernel;
use Test\Controllers\UserController;
use Hramework\Http\Request;
use Hramework\Http\HttpMethod;
use Hramework\Http\Middleware\LoggingMiddleware;

<<__EntryPoint>>
function main(): void {
    init_autoload();

    // 1. Define which controllers to use
    $controllers = vec[
        UserController::class,
    ];

    // 2. Create a kernel with the controllers
    $kernel = new Kernel($controllers);
    
    // 3. Add middlewares
    $kernel->addMiddleware(new LoggingMiddleware());

    // --- Simulate a GET request for /users ---
    echo "\n--- Simulating GET /users ---\n";
    $getRequest = new Request(HttpMethod::GET, '/users', dict[], null);
    $getResponse = $kernel->handle($getRequest);
    $getResponse->send();

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