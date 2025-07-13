namespace Test\Controllers;

use Hramework\Attributes\Route;
use Hramework\Http\HttpMethod;
use Hramework\Http\Request;
use Hramework\Http\Response;

final class UserController {
  <<Route("GET", '/users')>>
  public static function getUser(Request $request): Response {
    echo "Hey!\n";
    return new Response('Test User!\n');
  }

  // <<Route("GET", '/posts')>>
  // public static function getUser(Request $request): Response {
  //   return new Response('Test Posts!');
  // }
}