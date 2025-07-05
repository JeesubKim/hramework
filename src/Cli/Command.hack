namespace Hramework\Cli;

interface Command {
    public function execute(vec<string> $args): void;
}