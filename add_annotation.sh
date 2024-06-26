#!/bin/bash

GRAFANA_URL="http://192.168.2.136:3000/api/annotations"
#Знаю, что так делать нельзя
API_KEY="eyJrIjoiMWdUaGFYcmhjeW5iQ0o2QnA5UkpmYk0yTjMzT2xiTEsiLCJuIjoidG9oaXJfYW5ub3RhdGlvbl9rZXlfMTIzIiwiaWQiOjF9"

TIME=$(date +%s)000

DATA_JSON=$(cat <<EOF
{
  "dashboardId": 2,
  "time": $TIME,
  "tags": ["ansible", "deployment"],
  "text": "Ansible playbook deployment started"
}
EOF
)

curl -X POST "$GRAFANA_URL" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $API_KEY" \
    -d "$DATA_JSON"

