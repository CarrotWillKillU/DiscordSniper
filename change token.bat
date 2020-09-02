@echo off
echo Enter your new token
set INPUT=
set /P INPUT=Type input: %=%
echo {"token": "%INPUT%"}> "token.json"
attrib "token.json" +h