\
@echo off
setlocal
cd /d "%~dp0"
title X-Ray Hologram V20 - Windows x86 Build
py -3.8-32 -c "import struct; print('Python:', struct.calcsize('P')*8, 'bit')" || (echo ERROR: Install 32-bit Python 3.8 & pause & exit /b 1)
py -3.8-32 -m pip install --upgrade "pip<24.1" "setuptools<70" wheel
py -3.8-32 -m pip install --only-binary=:all: -r requirements-x86.txt || (echo ERROR: x86 dependency installation failed & pause & exit /b 1)
if exist build rmdir /s /q build
if exist dist rmdir /s /q dist
py -3.8-32 -m PyInstaller --clean --noconfirm X-Ray_Hologram_V20.spec || (echo ERROR: x86 PyInstaller build failed & pause & exit /b 1)
echo BUILD OK: dist\X-Ray_Hologram_V20\X-Ray_Hologram_V20.exe
pause
