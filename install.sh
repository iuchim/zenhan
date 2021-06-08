#!/bin/bash
mkdir -p zenhan/

HAS_CLANG=$(which clang++)

out=zenhan/zenhan++.exe
if [[ ${HAS_CLANG} != "" ]] ; then
    echo "USE CLANG"
    clang++ -v -v -v -std=c++11 -O2 -mwindows main.cc -o $out -limm32 -luser32 -lmsvcrt -Wl,/NODEFAULTLIB:libcmt
else
    echo "USE GCC"
    x86_64-w64-mingw32-g++ -std=c++11 -mwindows main.cc -o $out -limm32
fi
strip $out

zip -r9 zenhan.zip zenhan/
