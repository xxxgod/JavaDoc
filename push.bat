@echo off
::echo -- 编译
::npm run docs:build


echo --提交
git add .

set /p con=备注?
git commit -m "%con%"

echo --Push远程仓库?
git push 

echo --部署Git Page
:: start https://gitee.com/xxxgod/javadoc/pages
start https://github.com/xxxgod/JavaDoc/settings/pages

exit