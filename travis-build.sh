#!/bin/bash

set -euo pipefail

message() {
    echo -e "\n===> $1"
}

message "Deploying to preprod"
ENV_NAME=preprod infra/deploy.sh

message "Testing against preprod"
API_DOMAIN=https://vscode-telemetry-preprod.ryuichi.io ./test.sh

message "Deploying to prod"
ENV_NAME=prod infra/deploy.sh

message "Testing against prod"
API_DOMAIN=https://vscode-telemetry.ryuichi.io ./test.sh
