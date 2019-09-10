@echo off

set pom_file=pom.xml
set war_file=SNAPSHOT.war
set target=apache-tomcat-idea\webapps\
set runtomcat=apache-tomcat-idea\bin\

:: GOTO label
:: label   指定批处理程序中用作标签的文字字符串。
:: 标签必须单独一行，并且以冒号打头
:: "%cd%"指当前文件路径

if "%MAVEN_HOME%"=="" goto tips 

if not exist "%pom_file%" goto notexistfile

mvn clean package -f %pom_file% -Dmaven.test.skip=true -Dmaven.javadoc.skip=true

if exist "%war_file%" goto copyfile

echo war不存在
pause
eixt

:copyfile
copy %war_file% %target%


start /D "%runtomcat%" startup.bat

pause
goto isExit


:tips
echo "请配置MAVEN_HOME环境变量"
pause 
goto isExit

:notexistfile
echo "pom文件不存在"
pause 
goto isExit

:isExit
exit