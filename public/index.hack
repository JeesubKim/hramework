
<?hh // strict

use Hramework\Core\Kernel;
use Test\Controllers\UserController;

require_once(__DIR__."/../vendor/autoload.hack");

<<__EntryPoint>>
function main(): void {
    // This is the web server entry point.
    // It will automatically create a Request from globals and send a Response.

    // 1. Define which controllers to use
    $controllers = vec[
        UserController::class,
    ];

    // 2. Create a kernel with the controllers and run the framework
    $kernel = new Kernel($controllers);
    $kernel->run();
}
