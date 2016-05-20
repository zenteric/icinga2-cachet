#!/bin/bash

# Some Constants
NOW="$(date +'%d/%m/%Y')"
CACHETAPI_URL="https://status.cachet.io/api/v1/components/${COMPONENTID}"
CACHETAPI_TOKEN='token'

# Map Notification states for icinga2 
# OK - 1 operational
# Warning - 3 Partial outage
# Critical - 4 Major outage
# Unknown - 2 Performance issues
case "{$SERVICESTATE}" in
        'OK')
                COMPONENT_STATUS=1
        ;;
        'WARNING')
                COMPONENT_STATUS=3
        ;;
        'CRITICAL')
                COMPONENT_STATUS=4
        ;;
        'UNKNOWN')
                COMPONENT_STATUS=2
        ;;
esac

curl -H "Content-Type: application/json;" -H "X-Cachet-Token: ${CACHETAPI_TOKEN}" -d '{"status": "'"${COMPONENT_STATUS}"'"}' ${CACHETAPI_URL} -k
