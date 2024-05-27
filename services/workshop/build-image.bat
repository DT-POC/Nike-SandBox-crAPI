@echo off
cd /d workshop
docker build --no-cache -t crapi/crapi-workshop .
cd /d .\..\..\
