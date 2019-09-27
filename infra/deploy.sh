#!/bin/bash

set -euo pipefail

current_dir="$(dirname "$0")"

. $current_dir/env-config/$ENV_NAME.sh
. $current_dir/lib/helper.sh

domain=ryuichi.io

cert_domain="*.$domain"
host_name="vscode-telemetry$ENV_SUFFIX.$domain"

hosted_zone_id=$(aws route53 list-hosted-zones | jq -r ".HostedZones | map(select(.Name == \"$domain.\") | .Id)[0]" | sed 's#/hostedzone/##')
cert_arn=$(aws acm list-certificates --region us-east-1 --query CertificateSummaryList | jq -r "map(select(.DomainName == \"$cert_domain\") | .CertificateArn)[0]")

aws cloudformation deploy --stack-name "$(stackName $ENV_NAME)" \
    --capabilities CAPABILITY_NAMED_IAM \
    --template-file "$current_dir/template.yaml" \
    --no-fail-on-empty-changeset \
    --parameter-overrides \
        "HostedZoneId=$hosted_zone_id" \
        "DomainName=$host_name" \
        "CertificateArn=$cert_arn"
