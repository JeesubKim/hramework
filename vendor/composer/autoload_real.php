<?php

// autoload_real.php @generated by Composer

class ComposerAutoloaderInitc71c3498a66f5d99c10f572de3f8a928
{
    private static $loader;

    public static function loadClassLoader($class)
    {
        if ('Composer\Autoload\ClassLoader' === $class) {
            require __DIR__ . '/ClassLoader.php';
        }
    }

    /**
     * @return \Composer\Autoload\ClassLoader
     */
    public static function getLoader()
    {
        if (null !== self::$loader) {
            return self::$loader;
        }

        spl_autoload_register(array('ComposerAutoloaderInitc71c3498a66f5d99c10f572de3f8a928', 'loadClassLoader'), true, true);
        self::$loader = $loader = new \Composer\Autoload\ClassLoader(\dirname(__DIR__));
        spl_autoload_unregister(array('ComposerAutoloaderInitc71c3498a66f5d99c10f572de3f8a928', 'loadClassLoader'));

        require __DIR__ . '/autoload_static.php';
        call_user_func(\Composer\Autoload\ComposerStaticInitc71c3498a66f5d99c10f572de3f8a928::getInitializer($loader));

        $loader->register(true);

        return $loader;
    }
}
