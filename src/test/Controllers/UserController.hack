namespace Test\Controllers;

use Hramework\Attributes\Route;
use Hramework\Http\HttpMethod;
use Hramework\Http\Request;
use Hramework\Http\Response;

final class UserController {
  <<Route("GET", '/users')>>
  public static function getUsers(Request $request): Response {
    return new Response('List of Users!');
  }

  <<Route("POST", '/users')>>
  public static function createUser(Request $request): Response {
    $body = $request->getBody();
    return new Response('User created with data: '.($body ?? 'No data'));
  }
}