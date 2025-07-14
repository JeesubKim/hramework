namespace Hramework\Http;

class Response {
    public function __construct(
        private string $content,
        private int $statusCode = 200,
        private dict<string, string> $headers = dict[],
    ) {}

    public function send(): void {
        \http_response_code($this->statusCode);
        foreach ($this->headers as $key => $value) {
            \header($key.': '.$value);
        }
        echo $this->content."\n";
    }

    public function setContent(string $content): this {
        $this->content = $content;
        return $this;
    }

    public function setStatusCode(int $code): this {
        $this->statusCode = $code;
        return $this;
    }

    public function getStatusCode(): int {
        return $this->statusCode;
    }

    public function setHeader(string $key, string $value): this {
        $this->headers[$key] = $value;
        return $this;
    }
}