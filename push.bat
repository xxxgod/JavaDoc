@echo off
::echo -- ����
::npm run docs:build


echo --�ύ
git add .

set /p con=��ע?
git commit -m "%con%"

echo --PushԶ�ֿ̲�?
git push 

echo --����Git Page
:: start https://gitee.com/xxxgod/javadoc/pages
start https://github.com/xxxgod/JavaDoc/settings/pages

exit