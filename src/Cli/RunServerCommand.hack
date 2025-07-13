namespace Hramework\Cli;

final class RunServerCommand implements Command {

    public function execute(vec<string> $args): void {
        $port = (int)($args[0] ?? "3000");
        echo "Starting RunServerCommand at http://localhost:{$port}/\n";

        $cmd_parts = vec[
            'hhvm',
            '-m', 'server',
            '-p', (string)$port,
            '-d', 'hhvm.server.source_root=public/',
            '-d', 'hhvm.server.default_document=index.hack',
        ];
        $shell_command = \implode(' ', $cmd_parts);

        echo "Starting server on port $port...\n";
        
        // Use nohup and & to run the server in the background, detached from the current process
        $full_command = "nohup ".$shell_command." > /dev/null 2>&1 &";
        \shell_exec($full_command);
        
        echo "Server started in background on port {$port}.\n";
        echo "Access your application at http://localhost:{$port}/user\n";
        echo "To stop the server, you'll need to find its PID (e.g., using 'lsof -i :{$port}' or 'ps aux | grep hhvm') and kill it.\n";

        // Exit the current script, as the server is now running in the background
        exit(0);
    }
}