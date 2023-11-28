#!/bin/bash

# This script is used to set environment variables for CircleCI builds in php lavavel projects with a .env file

# Set the environment variables
set -a
source .env
set +a

printenv

response=$(curl -X POST --url 'https://circleci.com/api/v2/context' \
    -H 'Circle-Token: $CIRCLE_TOKEN' \ 
    -H 'content-type: application/json' \ 
    -d '{"name":"php-context2","owner":{"id":"5d18d3c7-f8c4-4c5f-a691-b730e67047d3","type":"organization"}}' --write-out '%{http_code}' --silent --output /dev/null servername)
context_id=${ response | jq -r '.id' }
echo "Context ID: $context_id"
env | while IFS= read -r line; do
  value=${line#*=}
  name=${line%%=*}
  echo "V: $value"
  echo "N: $name"
  if [[ "$response" -ne 200 ]] ; then
  echo "API returned $status_code"
    else
    curl --request PUT \
    --url https://circleci.com/api/v2/context/%7Bcontext-id%7D/environment-variable/POSTGRES_USER \
    --header 'authorization: Basic REPLACE_BASIC_AUTH' \
    --header 'content-type: application/json' \
    --data '{"value":"some-secret-value"}'
    fi
don

# Create new context for PHP application environment variables



#     curl -X POST --url 'https://circleci.com/api/v2/context' \
#     -H 'Circle-Token: f7aa3b819623c1cc786dd39bb9e09742c47fea3c' \
#     -H 'content-type: application/json' \
#     -d '{"name":"php-context2","owner":{"id":"5d18d3c7-f8c4-4c5f-a691-b730e67047d3","type":"organization"}}'
# {
#   "name" : "php-context2",
#   "id" : "598917f5-2727-42e5-a45e-a2dd795980dd",
#   "created_at" : "2023-11-18T23:31:30.514Z"

