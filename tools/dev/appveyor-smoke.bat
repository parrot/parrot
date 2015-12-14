if not "%PLATFORM%" == "x64" set WIN64=undef
if "%MSVC_VERSION%" == "10" goto msvc_10
if "%MSVC_VERSION%" == "12" goto msvc_12

:msvc_12
if "%PLATFORM%" == "x64" set PLATFORM=amd64
call "C:\Program Files (x86)\Microsoft Visual Studio %MSVC_VERSION%.0\VC\vcvarsall.bat" %PLATFORM%
goto start

:msvc_10
call "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.cmd" /%PLATFORM%

:start
echo %PLATFORM%
echo %MSVC_VERSION%
perl Configure.pl --verbose --optimize --cc=cl --ld=link --ccflags="-nologo -GF -W3 -MD -Zi -DNDEBUG -DWIN32 -D_CONSOLE -DNO_STRICT" --ldflags="-nologo -release" --linkflags="-nologo -release" --libs="netapi32.lib uuid.lib ws2_32.lib comctl32.lib advapi32.lib"
nmake test
