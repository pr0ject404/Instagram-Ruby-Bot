@echo off

:VRIFY
Echo:
Echo  =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Echo: 
Echo    1) Auto Follow and Un Follow
Echo    2) Auto Liker
Echo    3) EXIT
Echo: 
Echo  =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Echo:
choice /c 123
if errorlevel 3 EXIT
if errorlevel 2 goto ALIK
if errorlevel 1 goto AFUNF

:AFUNF
auto_follow.rb
cls
echo restarting...
timeout 5
cls
goto AFUNF

:ALIK
auto_liker.rb
cls
echo finishing...
timeout 10
cls
Echo:
Echo Auto Liker Finished.
goto VRIFY
