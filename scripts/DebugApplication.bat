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

:: appstart

:: find first IP address for debugging (default use first IPv4)
IPCONFIG | FIND "IPv4" > TEMPIP.txt
FOR /F "tokens=2 delims=:" %%a in (TEMPIP.txt) do (
	set IP=%%a
	goto ipfound
)
:ipfound
del TEMPIP.txt
set IP=192.168.88.251
::%IP:~1%
echo debug with ip: %IP%

echo Signing AIR setup using certificate %CERTIFICATE%.
call adt -package -target apk-debug -connect %IP% %SIGNING_OPTIONS% %APK_FILE% %APP_XML% %FILE_OR_DIR%
:: start on device
echo install on device
call adb uninstall app.%APP_NAME%
call adb install -r %APK_FILE%
echo %APP_NAME%
call adb shell am start -a android.intent.action.MAIN -n app.%APP_NAME%/app.%APP_NAME%.AppEntry
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

:end
