
namespace Test\Controllers;

use Hramework\Attributes\Route;
use Hramework\Http\HttpMethod;
use Hramework\Http\Request;
use Hramework\Http\Response;

final class UserController {
  <<Route("GET", '/users')>>
  public static function getUsers(Request $request): Response {
    // Using list() for destructuring query parameters
    list($id, $name) = tuple($request->getQueryParam('id'), $request->getQueryParam('name'));
    
    $responseContent = 'List of Users!';
    if ($id !== null) {
        $responseContent .= ' User ID: '.$id;
    }
    if ($name !== null) {
        $responseContent .= ' User Name: '.$name;
    }
    return new Response($responseContent);
  }

  <<Route("GET", '/users/<id>')>>
  public static function getUserById(Request $request): Response {
    $id = $request->getPathParam('id');
    return new Response('Details for User ID: '.($id ?? 'Not found'));
  }

  <<Route("POST", '/users')>>
  public static function createUser(Request $request): Response {
    $body = $request->getBody();
    return new Response('User created with data: '.($body ?? 'No data'));
  }
}
