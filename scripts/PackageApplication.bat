@echo off

:: AIR application packaging
:: More information:
:: http://livedocs.adobe.com/flex/3/html/help.html?content=CommandLineTools_5.html#1035959
cd %~dp0
call settings.bat

set PATH=%PATH%;%ANDROID_PATH_TOOLS%;%AIR_PATH_BIN%
set APP_NAME=%PROJECT_ID%
set APK_FILE=%OUTPUT_APK%
set CERTIFICATE=%CERTIFICATE_FILE%
set SIGNING_OPTIONS=-storetype pkcs12 -keystore %CERTIFICATE%
if not %CERTIFICATE_PASSWORD%=="" set SIGNING_OPTIONS=%SIGNING_OPTIONS% -storepass %CERTIFICATE_PASSWORD%
if not exist %CERTIFICATE% goto certificate

:: Output
if not exist %OUTPUT_PATH% md %OUTPUT_PATH%
set AIR_FILE=%OUTPUT_AIR%

:: Input
set APP_XML=%AIR_APP%
set FILE_OR_DIR=-C ../bin .

:: generate

echo Signing AIR setup using certificate %CERTIFICATE%.
call adt -package -target apk %SIGNING_OPTIONS% %APK_FILE% %APP_XML% %FILE_OR_DIR%

if errorlevel 1 goto failed

echo.
echo AIR setup created and deployed: %AIR_FILE%
echo.
goto end

:certificate
echo Certificate not found: %CERTIFICATE%
echo.
echo Troubleshotting: 
echo A certificate is required, generate one using 'CreateCertificate.bat'
echo.
pause
goto end

:failed
echo AIR setup creation FAILED.
echo.
echo Troubleshotting: 
echo did you configure the Flex SDK path in this Batch file?
echo.
pause
echo Successfull
