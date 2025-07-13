namespace Hramework\Attributes;

use type Hramework\Http\HttpMethod;

<<file: __EnableUnstableFeatures('attribute')>>

<<__Attribute>>
final class Route {

    public function __construct (
        public HttpMethod $method,
        public string $path,
    ){}
    
}