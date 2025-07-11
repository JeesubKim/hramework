/// Generated file, do not edit by hand ///

namespace Facebook\AutoloadMap\Generated {

function build_id(): string {
  return '2025-07-11T05:01:20-07:00!d3f1032f77c1843289a3661ffefd974b';
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
    'hramework\\cli\\helpcommand' => 'src/Cli/HelpCommand.hack',
    'hramework\\cli\\buildcommand' => 'src/Cli/BuildCommand.hack',
    'hramework\\cli\\clikernel' => 'src/Cli/CliKernel.hack',
    'hramework\\cli\\runservercommand' => 'src/Cli/RunServerCommand.hack',
  ],
  'function' => 
  dict [
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