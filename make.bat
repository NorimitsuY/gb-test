@echo off

rmdir /s /q bin\Release
rmdir /s /q dist\Release

mkdir bin\Release
mkdir dist\Release


SET GBDK_HOME=..\..\Resources\gbdk

SET LCC_COMPILE_BASE=%GBDK_HOME%\bin\lcc -Iheaders/main -Iheaders/gen -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG
SET LCC_COMPILE=%LCC_COMPILE_BASE% -c -o 


SETLOCAL ENABLEDELAYEDEXPANSION

:: Default to the hugedriver file
:: SET "COMPILE_OBJECT_FILES=bin/hUGEDriver.obj.o"
SET "COMPILE_OBJECT_FILES="

:: loop for all files in the default source folder
FOR /R "source/" %%X IN (*.c) DO (
    echo Compiling source %%~nX ...
    %LCC_COMPILE% bin/Release/%%~nX.o %%X
    SET "COMPILE_OBJECT_FILES=bin/Release/%%~nX.o !COMPILE_OBJECT_FILES!"
)


:: Compile a .gb file from the compiled .o files
%LCC_COMPILE_BASE% -Wm-yC  -Wl-yt3 -o dist/Release/GbTest.gb !COMPILE_OBJECT_FILES!

endlocal

"lib/romusage" dist\Release\GbTest.noi -a