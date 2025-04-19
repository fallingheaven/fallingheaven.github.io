@echo off
REM 自动化 Hugo 博客内容的提交与推送

REM 步骤1：添加所有更改
git add .

REM 步骤2：输入提交信息
set /p msg=请输入提交说明（默认：更新内容）:

if "%msg%"=="" (
    set msg=更新内容
)

REM 步骤3：提交
git commit -m "%msg%"

REM 步骤4：推送到远程 main 分支
git push origin main

pause