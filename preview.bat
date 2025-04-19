@echo off
REM 本地预览 Hugo 网站

chcp 65001

start http://localhost:1313

hugo server -D

pause