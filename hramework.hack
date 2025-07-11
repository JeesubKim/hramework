use namespace Hramework\Cli;

use function HH\Lib\C\count;
use function HH\global_get;

<<__EntryPoint>>
function main(): void {
    

    init_autoload();
    
    echo "Hi\n";
    $args = vec(global_get("argv"));
    // $n = (int) (vec(\HH\global_get("argv") as Container<_>)[1] ?? 10);
    // $args = vec(Vec\slice($GLOBALS["argv"], 1));
    // echo $args;
    \var_dump($args);
    // \var_dump($args[1]);
    if (count($args) > 1) {
        echo $args[1]."\n";
    }
    
    echo "Count: ".count($args)."\n";

    $cli = Cli\CliKernel::run($args);

    echo "Done\n";
}



function init_autoload():void {
    echo "Loading autoload...\n";
    require_once(__DIR__."/vendor/autoload.hack");
    \Facebook\AutoloadMap\initialize();
    echo "Autoload loaded.\n";
}