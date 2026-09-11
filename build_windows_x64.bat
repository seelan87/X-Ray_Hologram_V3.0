\
@echo off
setlocal
cd /d "%~dp0"
title X-Ray Hologram V20 - Windows x64 Build
py -3.11 -c "import struct; print('Python:', struct.calcsize('P')*8, 'bit')" || (echo ERROR: Install 64-bit Python 3.11 & pause & exit /b 1)
py -3.11 -m pip install --upgrade pip
py -3.11 -m pip install --only-binary=:all: -r requirements-x64.txt || (echo ERROR: dependency installation failed & pause & exit /b 1)
if exist build rmdir /s /q build
if exist dist rmdir /s /q dist
py -3.11 -m PyInstaller --clean --noconfirm X-Ray_Hologram_V20.spec || (echo ERROR: PyInstaller build failed & pause & exit /b 1)
echo BUILD OK: dist\X-Ray_Hologram_V20\X-Ray_Hologram_V20.exe
pause
