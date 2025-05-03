@echo off
setlocal enabledelayedexpansion
REM 设置命令行编码为 UTF-8 防止中文乱码
echo Changing code page...
chcp 65001

:: 自动获取当前日期（兼容所有语言环境）
echo Getting datetime via wmic...
for /f "tokens=2 delims==" %%a in ('wmic os get localdatetime /value') do (
    set "datetime=%%a"
)
echo Datetime variable: !datetime!
if not defined datetime echo WARNING: Datetime variable was not set.

set "today=!datetime:~0,4!-!datetime:~4,2!-!datetime:~6,2!"
echo Today variable: %today%

:: 获取用户输入
::set /p title=请输入文章标题：
set /p filename=请输入文件名（无需扩展名）：
set title=%filename%
set filepath=%cd%\content\post

:: 创建Markdown文件
(
echo ---
echo title: "%title%"
echo date: %today%
echo tags: []
echo categories: []
echo ---
echo.
) > "%filepath%\!filename!.md"

:: 输出结果并暂停
echo.
echo 成功创建文件：%filepath%\!filename!.md
echo 按任意键关闭窗口...
pause > nul
endlocal
