<?hh //strict



/*
 hh-autoload 를 실행하면 vendor/hh_autoload.php 가 생성됨. 이 파일이 hh_autoload.json기준으로 만든 autoload 파일
 이걸 포함시켜야 클래스를 자동으로 찾아줌
 그렇지 않으면 require()로 클래스마다 불러와야 함
*/

use function HH\Lib\C\count;
use Hramework\Cli;

<<__EntryPoint>>
function main(): void {
    require_once(__DIR__."/src/Cli/CliKernel.hack");
    echo "Hi\n";
    $args = vec(\HH\global_get("argv"));
    // $n = (int) (vec(\HH\global_get("argv") as Container<_>)[1] ?? 10);
    // $args = vec(Vec\slice($GLOBALS["argv"], 1));
    // echo $args;
    \var_dump($args);
    \var_dump($args[1]);
    echo $args[1]."\n";
    echo "Count: ".count($args)."\n";

    $cli = Cli\CliKernel::run($args);

    echo "Done\n";
}