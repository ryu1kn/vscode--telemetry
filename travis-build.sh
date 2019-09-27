#!/bin/bash

set -euo pipefail

ENV_NAME=preprod infra/deploy.sh
API_DOMAIN=https://vscode-telemetry-preprod.ryuichi.io ./test.sh
