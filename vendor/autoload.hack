/// Generated file, do not edit by hand ///

namespace Facebook\AutoloadMap\Generated {

function build_id(): string {
  return '2025-07-18T17:16:29-07:00!fe317fcc3db27394d8f4941f07d7f17c';
}

function root(): string {
  return __DIR__.'/../';
}

<<__Memoize>>
function is_dev(): bool {
  $override = \getenv('HH_FORCE_IS_DEV');
  if ($override === false) {
    return true;
  }
  return (bool) $override;
}

function map_uncached(): \Facebook\AutoloadMap\AutoloadMap {
  return dict [
  'class' => 
  dict [
    'hramework\\cli\\command' => 'src/Cli/Command.hack',
    'hramework\\http\\imiddleware' => 'src/Http/IMiddleware.hack',
    'hramework\\cli\\helpcommand' => 'src/Cli/HelpCommand.hack',
    'hramework\\cli\\buildcommand' => 'src/Cli/BuildCommand.hack',
    'hramework\\http\\httpmethod' => 'src/Http/HttpMethod.hack',
    'hramework\\cli\\clikernel' => 'src/Cli/CliKernel.hack',
    'hramework\\http\\request' => 'src/Http/Request.hack',
    'hramework\\attributes\\route' => 'src/Attributes/Route.hack',
    'hramework\\cli\\runservercommand' => 'src/Cli/RunServerCommand.hack',
    'hramework\\http\\middleware\\loggingmiddleware' => 'src/Http/Middleware/LoggingMiddleware.hack',
    'hramework\\core\\kernel' => 'src/Core/Kernel.hack',
    'hramework\\http\\response' => 'src/Http/Response.hack',
    'test\\controllers\\usercontroller' => 'src/test/Controllers/UserController.hack',
    'hramework\\logging\\logger' => 'src/Logging/Logger.hack',
    'hramework\\routing\\router' => 'src/Routing/Router.hack',
    'hramework\\http\\middleware\\pathparametermiddleware' => 'src/Http/Middleware/PathParameterMiddleware.hack',
  ],
  'function' => 
  dict [
    'main' => 'src/test/main.hack',
    'init_autoload' => 'src/test/main.hack',
  ],
  'type' => 
  dict [
  ],
  'constant' => 
  dict [
  ],
];
}

function map(): \Facebook\AutoloadMap\AutoloadMap {
  return map_uncached();
}

} // Generated\

namespace Facebook\AutoloadMap\_Private {
  final class GlobalState {
    public static bool $initialized = false;
  }

  function bootstrap(): void {
    require_once(__DIR__.'/../vendor/hhvm/hhvm-autoload/src/AutoloadMap.hack');
    
  }
}

namespace Facebook\AutoloadMap {

function initialize(): void {
  if (_Private\GlobalState::$initialized) {
    return;
  }
  if (\HH\autoload_is_native()) {
    return;
  }
  _Private\GlobalState::$initialized = true;
  _Private\bootstrap();
  $map = Generated\map();

  \HH\autoload_set_paths(/* HH_FIXME[4110] incorrect hhi */ $map, Generated\root());

  
}

}