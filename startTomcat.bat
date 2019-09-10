@echo off

set pom_file=pom.xml
set war_file=SNAPSHOT.war
set target=apache-tomcat-idea\webapps\
set runtomcat=apache-tomcat-idea\bin\

:: GOTO label
:: label   ָ�������������������ǩ�������ַ�����
:: ��ǩ���뵥��һ�У�������ð�Ŵ�ͷ
:: "%cd%"ָ��ǰ�ļ�·��

if "%MAVEN_HOME%"=="" goto tips 

if not exist "%pom_file%" goto notexistfile

mvn clean package -f %pom_file% -Dmaven.test.skip=true -Dmaven.javadoc.skip=true

if exist "%war_file%" goto copyfile

echo war������
pause
eixt

:copyfile
copy %war_file% %target%


start /D "%runtomcat%" startup.bat

pause
goto isExit


:tips
echo "������MAVEN_HOME��������"
pause 
goto isExit

:notexistfile
echo "pom�ļ�������"
pause 
goto isExit

:isExit
exit