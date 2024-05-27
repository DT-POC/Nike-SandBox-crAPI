@echo off
cd /d identity
docker build --no-cache -t crapi/crapi-identity .
cd /d .\..\
