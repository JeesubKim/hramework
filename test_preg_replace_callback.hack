<?hh // strict

<<__EntryPoint>>
function main(): void {
  $path = "/users/<id>/posts/<post_id>";
  $paramNames = vec[];

  echo "Original path: {$path}\n";

  $pattern = \preg_replace_callback(
    '/<([a-zA-Z0-9_]+)>/u',
    function($matches) use (&$paramNames) {
      $paramNames[] = $matches[1];
      return '([a-zA-Z0-9_]+)';
    },
    $path
  );

  echo "Generated pattern: {$pattern}\n";
  echo "Extracted paramNames: ".\json_encode($paramNames)."\n";

  // Test the generated pattern
  $testUri = "/users/123/posts/abc";
  $finalPattern = '/^'.\str_replace('/', '\\/', $pattern).'$/';
  if (\preg_match($finalPattern, $testUri, $matches)) {
    echo "Test URI matched: ".\json_encode($matches)."\n";
  } else {
    echo "Test URI did NOT match.\n";
  }
}

