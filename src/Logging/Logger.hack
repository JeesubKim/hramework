namespace Hramework\Logging;

final class Logger {
    private static function writeLog(string $level, string $message, string $file): void {
        $time = \date('Y-m-d H:i:s');
        echo "{$time}\t{$level}\t{$message}\t{$file}\n";
    }

    public static function info(string $message, ?string $file = null): void {
        if ($file === null) {
            $trace = \debug_backtrace(\DEBUG_BACKTRACE_IGNORE_ARGS, 2); // Added \
            $file = $trace[1]['file'] ?? 'unknown';
        }
        self::writeLog('INFO', $message, $file);
    }

    public static function debug(string $message, ?string $file = null): void {
        if ($file === null) {
            $trace = \debug_backtrace(\DEBUG_BACKTRACE_IGNORE_ARGS, 2); // Added \
            $file = $trace[1]['file'] ?? 'unknown';
        }
        self::writeLog('DEBUG', $message, $file);
    }

    public static function warning(string $message, ?string $file = null): void {
        if ($file === null) {
            $trace = \debug_backtrace(\DEBUG_BACKTRACE_IGNORE_ARGS, 2); // Added \
            $file = $trace[1]['file'] ?? 'unknown';
        }
        self::writeLog('WARNING', $message, $file);
    }

    public static function error(string $message, ?string $file = null): void {
        if ($file === null) {
            $trace = \debug_backtrace(\DEBUG_BACKTRACE_IGNORE_ARGS, 2); // Added \
            $file = $trace[1]['file'] ?? 'unknown';
        }
        self::writeLog('ERROR', $message, $file);
    }
}