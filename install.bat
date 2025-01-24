@echo off
chcp 65001
title 自由变换插件依赖安装

:: 设置Python路径
set "PYTHON_EXEC=..\..\..\python_embeded\python.exe"
set "REQUIREMENTS=%~dp0\requirements.txt"

echo 🚀 正在安装自由变换插件依赖...
echo.

:: 检查默认Python路径
if exist "%PYTHON_EXEC%" (
    goto :install
) else (
    :: 尝试其他可能的路径
    set "PYTHON_EXEC=..\..\python_embeded\python.exe"
    if exist "%PYTHON_EXEC%" goto :install
    
    set "PYTHON_EXEC=..\..\python\python.exe"
    if exist "%PYTHON_EXEC%" goto :install
    
    :: 如果都找不到,提示用户
    echo ❌ 未找到ComfyUI的Python环境
    echo 请确保插件已正确安装在ComfyUI的custom_nodes目录下
    pause
    exit /b 1
)

:install
echo ✅ 使用Python路径: %PYTHON_EXEC%
echo.

:: 安装依赖
echo 📦 正在安装依赖包...
for /f "delims=" %%i in (%REQUIREMENTS%) do (
    echo 正在安装: %%i
    "%PYTHON_EXEC%" -s -m pip install "%%i"
)

echo.
echo ✅ 安装完成!
echo.
echo 如遇到任何问题,请联系作者:
echo 微信: xiutuxiaoliu
echo 抖音: 悟空（AI摄影）、大师兄（AIGC）
echo.
pause 