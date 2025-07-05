namespace Hramework\Cli;

class BuildCommand implements Command {

    public function execute(vec<string> $args): void {
        echo "BuildCommand";
    }
}