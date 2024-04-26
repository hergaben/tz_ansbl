#!/bin/bash

GRAFANA_URL="http://192.168.2.136:3000/api/annotations"
#API_KEY="Тут ключ Графаны"

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

