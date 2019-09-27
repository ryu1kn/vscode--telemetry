#!/bin/bash

set -euo pipefail

echo '===> Starting test'

curl -f -X POST $API_DOMAIN/telemetry-data -H 'Content-Type: application/json' -d '{"a": 2}'

echo '===> Passed!'
