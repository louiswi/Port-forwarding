@echo off
:start
cls
SET /P Site=输入转发网站回车:
for /f "tokens=2 delims=[]" %%a in ('ping -6 %Site%^|findstr "["') do (set IP=%%a)
netsh interface portproxy add v4tov6 listenaddress=127.0.0.1 listenport=80 connectaddress=%IP% connectport=80
netsh interface portproxy show v4tov6
copy %SystemRoot%\System32\Drivers\etc\hosts %SystemRoot%\System32\Drivers\etc\hosts.bak
echo 127.0.0.1 %Site%>>%SystemRoot%\System32\Drivers\etc\hosts
ipconfig /flushdns


pause