@echo off
cd /d community
docker build --no-cache -t crapi/crapi-community .
cd /d .\..\
