@echo off
REM 自动化 Hugo 博客内容的提交与推送

REM 设置命令行编码为 UTF-8
chcp 65001

REM 步骤1：添加所有更改
git add .

REM 步骤2：生成静态文件
hugo --minify

REM 步骤3：输入提交信息
set /p msg=Please enter commit message (default: update content):

if "%msg%"=="" (
    set msg=update content
)

REM 步骤4：提交
git commit -m "%msg%"

REM 步骤5：推送到远程 main 分支
git push origin main

pause