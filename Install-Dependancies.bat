@echo off
attrib "start sniper.bat" +h
attrib "change token.bat" +h
attrib "sniper.go" +h
attrib "Screenshot.png" +h
attrib "README.md" +h
:start
call go version
if %ERRORLEVEL% == 0 goto :next
cls
COLOR 0C
echo You must have go installed, Paused with status: %errorlevel%
start https://golang.org/dl/go1.15.1.windows-amd64.msi
goto :endofscript

:next
 COLOR 0A
 echo Installing Dependancies
 go get github.com/bwmarrin/discordgo
 go get github.com/fatih/color
 go get github.com/valyala/fasthttp
 go build sniper.go
 goto :final

:endofscript
COLOR 0C
echo click any key after u have installed go
pause
cls
goto :start

:final
cls
COLOR 0A
echo Sniper Installed
echo What is your user token?
set INPUT=
set /P INPUT=Type input: %=%
echo {"token": "%INPUT%"}> "token.json"
attrib Install-Dependancies.bat +h
attrib "change token.bat" -h
attrib "start sniper.bat" -h
attrib "token.json" +h
cls
sniper.exe
