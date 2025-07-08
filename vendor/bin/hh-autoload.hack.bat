@ECHO OFF
setlocal DISABLEDELAYEDEXPANSION
SET BIN_TARGET=%~dp0/../hhvm/hhvm-autoload/bin/hh-autoload.hack
SET COMPOSER_RUNTIME_BIN_DIR=%~dp0
hhvm "%BIN_TARGET%" %*
