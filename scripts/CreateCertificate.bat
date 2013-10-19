@echo off

:: AIR certificate generator
:: More information:
:: http://livedocs.adobe.com/flex/3/html/help.html?content=CommandLineTools_5.html#1035959
:: http://livedocs.adobe.com/flex/3/html/distributing_apps_4.html#1037515
cd %~dp0
call settings.bat

:: Path to Flex SDK binaries
set PATH=%PATH%;%AIR_PATH_BIN%

:: Certificate information
set NAME=%CERTIFICATE_CN%
set PASSWORD=%CERTIFICATE_PASSWORD%
set CERTIFICATE=%CERTIFICATE_FILE%

call adt -certificate -cn %NAME% 1024-RSA %CERTIFICATE% %PASSWORD%
if errorlevel 1 goto failed

echo.
echo Certificate created: %CERTIFICATE%
echo With password: %PASSWORD%
echo.
echo Hint: you may have to wait a few minutes before using this certificate to build your AIR application setup.
echo.
goto end

:failed
echo.
echo Certificate creation FAILED.
echo.
echo Troubleshotting: did you configure the Flex SDK path in this Batch file?
echo.

:end
pause