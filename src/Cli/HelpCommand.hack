namespace Hramework\Cli;


class HelpCommand implements Command {
    public function execute(vec<string> $args): void {
        echo "HelpCommand";
    }
}