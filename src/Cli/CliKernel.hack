namespace Hramework\Cli;

final class CliKernel {

    public static function run(vec<string> $argv): void {
        require_once(__DIR__."/Command.hack");
        require_once(__DIR__."/RunServerCommand.hack");
        $command = $argv[1] ?? "help";
        $args = \HH\Lib\Vec\drop($argv, 2);


        $available = dict[
            "runserver" => \Hramework\Cli\RunServerCommand::class,
            "build" => \Hramework\Cli\BuildCommand::class,
            "help" => \Hramework\Cli\HelpCommand::class,
        ];

        if (!\HH\Lib\C\contains_key($available, $command)) {

            echo "Unknown command: $command\n";
            $command = "help";
        }
        echo "command: $command\n";
        $cls = $available[$command];
        \var_dump($cls);
        $instance = new $cls();
        $instance->execute($args);

    }
}