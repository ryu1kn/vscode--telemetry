#!/bin/bash

set -euo pipefail

current_dir="$(dirname "$0")"

. $current_dir/env-config/$ENV_NAME.sh
. $current_dir/lib/helper.sh

stack_name="$(stackName $ENV_NAME)"

aws cloudformation delete-stack --stack-name "$stack_name"
aws cloudformation wait stack-delete-complete --stack-name "$stack_name"
