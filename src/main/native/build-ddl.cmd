setlocal

call :amd64
call :x86
call :arm64

exit /b


:amd64
set JAVA_HOME=C:\Program Files\Zulu\zulu-6

clang -target x86_64-windows  -I"%JAVA_HOME%\include" -I"%JAVA_HOME%\include\win32" ^
 -shared -o jline-amd64.dll ^
 jline_WindowsTerminal.c

exit /b


:x86
set JAVA_HOME=C:\dd\java\jdk1.5.0_22

clang -target i686-windows -I"%JAVA_HOME%\include" -I"%JAVA_HOME%\include\win32" ^
 -shared -o jline-x86.dll ^
 jline_WindowsTerminal.c

exit /b

:arm64
set JDK_HOME=C:\dd\jdk-17.0.16+8
set MSVCVER=14.44.35207
set KITVER=10.0.26100.0

 clang --target=arm64-windows -I"%JAVA_HOME%\include" ^
 -I"%JAVA_HOME%\include\win32" ^
  -fuse-ld=lld-link ^
  -L"C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Tools\MSVC\%MSVCVER%\lib\arm64" ^
  -L"C:\Program Files (x86)\Windows Kits\10\Lib\%KITVER%\ucrt\arm64" ^
  -L"C:\Program Files (x86)\Windows Kits\10\Lib\%KITVER%\um\arm64" ^
-shared -o jline-aarch64.dll  ^
 jline_WindowsTerminal.c

exit /b

