@echo off & setlocal enabledelayedexpansion

echo %JAVA_HOME%;

set LIB_JARS=""
cd ..\lib
for %%i in (*) do set LIB_JARS=!LIB_JARS!;..\lib\%%i
cd ..\bin


echo %LIB_JARS%;

java -Xms512m -Xmx1024m -XX:PermSize=128M -XX:MaxPermSize=256m  -Djava.awt.headless=true  -classpath .;%LIB_JARS% com.lj.app.core.common.container.DubboProvider >./runjob.log 
pause