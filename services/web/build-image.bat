@echo off
cd /d web
docker build --no-cache -t crapi/crapi-web .
cd /d .\..\
