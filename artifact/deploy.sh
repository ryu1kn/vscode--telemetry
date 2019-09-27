#!/bin/bash

set -euo pipefail

current_dir="$(dirname "$0")"

aws cloudformation deploy --stack-name "vscode-telemetry-artifact" \
    --template-file "$current_dir/template.yaml" \
    --no-fail-on-empty-changeset
