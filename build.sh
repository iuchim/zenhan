#!/bin/bash
mkdir -p zenhan/bin64
mkdir -p zenhan/bin32

out=zenhan/bin64/zenhan.exe
x86_64-w64-mingw32-g++-win32 -std=c++11 -mwindows main.cc -o $out -limm32
x86_64-w64-mingw32-strip $out

out=zenhan/bin32/zenhan.exe
i686-w64-mingw32-g++-win32 -std=c++11 -mwindows -static-libgcc main.cc -o $out -limm32
i686-w64-mingw32-strip $out

zip -r9 zenhan.zip zenhan/
