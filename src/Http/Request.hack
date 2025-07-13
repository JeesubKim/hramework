
namespace Hramework\Http;

use Hramework\Http\HttpMethod;

class Request {
    public function __construct(
        private HttpMethod $method,
        private string $uri,
        private dict<string, string> $headers,
        private ?string $body,
    ) {}

    public function getMethod(): HttpMethod {
        
        return $this->method;
    }

    public function getUri(): string {
        return $this->uri;
    }

    public function getHeaders(): dict<string, string> {
        return $this->headers;
    }

    public function getBody(): ?string {
        return $this->body;
    }

    public static function createFromGlobals(): this {
        $method = HttpMethod::assert($_SERVER['REQUEST_METHOD'] ?? 'GET');
        
        $uri = '/';
        if (isset($_SERVER['REQUEST_URI'])) {
            $uri = \explode('?', $_SERVER['REQUEST_URI'])[0]; // Remove query string
        } else if (isset($_SERVER['PATH_INFO'])) {
            $uri = $_SERVER['PATH_INFO'];
        } else if (isset($_SERVER['SCRIPT_NAME'])) {
            $uri = $_SERVER['SCRIPT_NAME'];
        }

        $headers = dict[];
        foreach ($_SERVER as $key => $value) {
            if (\substr($key, 0, 5) === 'HTTP_') {
                $header_name = \str_replace(' ', '-', \ucwords(\strtolower(\str_replace('_', ' ', \substr($key, 5)))));
                $headers[$header_name] = (string)$value;
            }
        }
        $body = \file_get_contents('php://input');

        return new static($method, $uri, $headers, $body === false ? null : $body);
    }
}
