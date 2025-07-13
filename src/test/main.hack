use Hramework\Core\Kernel;
use Test\Controllers\UserController;
use Hramework\Http\Request;
use Hramework\Http\HttpMethod;

<<__EntryPoint>>
function main(): void {
    init_autoload();

    // 1. Define which controllers to use
    $controllers = vec[
        UserController::class,
    ];

    // 2. Create a kernel with the controllers and run the framework
    $kernel = new Kernel($controllers);
    
    // --- Simulate a specific request for testing ---
    // Create a Request object for GET /user
    $request = new Request(HttpMethod::GET, '/users', dict[], null);
  
    // Handle the request directly (instead of Kernel->run() which uses createFromGlobals())
    $response = $kernel->handle($request);

    // Send the response (for CLI, this will echo the content)
    $response->send();
    // --- End simulation ---
}

function init_autoload():void {
    require_once(__DIR__."/../../vendor/autoload.hack");
    \Facebook\AutoloadMap\initialize();
}