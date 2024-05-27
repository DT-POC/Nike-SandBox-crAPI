#!/usr/bin/env bash

set -euo pipefail

if [ ! -d crapi ]; then
  git clone git@bitbucket.org:datatheorem/crapi.git
fi

cd crapi
git reset --hard HEAD
git fetch --all -p
git checkout "$BITBUCKET_COMMIT"

# Note: we ran out of disk space which broke deployments
# johng took two actions to attemp to prevent this:
#
# 1. Add SystemMax=500M to /etc/systemd/journald.conf 
#
# 2. Alter the deployment commands below to stop and prune 
#    before building. This will interrupt the service, but
#    who cares? We also show docker disk usage during build
#    to provide a troubleshooting clue to those in need
#




cd deploy/docker
docker system df
# stop and prune first to avoid running out of disk space
docker compose --file docker-compose-gcp.yml --compatibility down --remove-orphans || true
docker system prune --all --force --volumes
docker system df
./build-all.sh
docker compose --file docker-compose-gcp.yml --compatibility up --detach --force-recreate --wait
