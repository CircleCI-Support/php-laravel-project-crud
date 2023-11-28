#!/bin/bash

# This script is used to set environment variables for CircleCI builds in php lavavel projects with a .env file

# Set the environment variables
set -a
source .env
set +a

printenv

response=$(curl -X POST --url 'https://circleci.com/api/v2/context' -H 'Circle-Token: f7aa3b819623c1cc786dd39bb9e09742c47fea3c' -H 'Content-Type: application/json' -d '{"name":"php-context6","owner":{"id":"5d18d3c7-f8c4-4c5f-a691-b730e67047d3","type":"organization"}}')
echo $response
context_id=$(echo $response | jq -r '.id')
echo $context_id
env | while IFS= read -r line; do
  value=${line#*=}
  name=${line%%=*}
  echo "V: $value"
  echo "N: $name"

#   "message" : "Invalid parameter: the string '{9be0f072-80cd-4c6e-8f3d-0a4b2a42eac6}' is not a valid UUID"

    curl --request PUT \
    --url https://circleci.com/api/v2/context/$context_id/environment-variable/$name \
    -H 'Circle-Token: f7aa3b819623c1cc786dd39bb9e09742c47fea3c'  \
    -H 'content-type: application/json' \
    --data '{"value":"$value"}'
done

# Create new context for PHP application environment variables



#     curl -X POST --url 'https://circleci.com/api/v2/context' \
#     -H 'Circle-Token: f7aa3b819623c1cc786dd39bb9e09742c47fea3c' \
#     -H 'content-type: application/json' \
#     -d '{"name":"php-context2","owner":{"id":"5d18d3c7-f8c4-4c5f-a691-b730e67047d3","type":"organization"}}'
# {
#   "name" : "php-context2",
#   "id" : "598917f5-2727-42e5-a45e-a2dd795980dd",
#   "created_at" : "2023-11-18T23:31:30.514Z"

