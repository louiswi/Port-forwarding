@echo off
:start
cls

netsh interface portproxy delete v4tov6 listenaddress=127.0.0.1 listenport=80
netsh interface portproxy show v4tov6
move %SystemRoot%\System32\Drivers\etc\hosts.bak %SystemRoot%\System32\Drivers\etc\hosts
ipconfig /flushdns
pause