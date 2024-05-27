@echo off
cd /d mailhog
docker build --no-cache -t crapi/crapi-mailhog .
cd /d .\..\
