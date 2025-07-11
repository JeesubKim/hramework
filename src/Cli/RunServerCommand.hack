namespace Hramework\Cli;
use namespace HH\Lib\Process;


final class RunServerCommand implements Command {

    public function execute(vec<string> $args): void {
        
        $port = (int)$args[0] ?? "3000";
        echo "Starting RunServerCommand at http://localhost:{$port}/\n";


        
        $cmd = vec[
            'hhvm',
            '-m', 'server',
            '-p', $port,
            '-d', 'hhvm.server.source_root=public/',
            '-d', 'hhvm.server.default_document=index.hack',
        ];
        echo "Starting server on port $port...\n";
        $shell_command = "hhvm -m server -p {$port} -d hhvm.server.source_root=public/";
        $output = \shell_exec($shell_command);
            

    }
}