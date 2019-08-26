#!/bin/sh
#
# Script to send SMS alerts via Zabbix
#
# More information about the ClickSend API: https://developers.clicksend.com/docs/http/v2/#ClickSend-v2-API-SMS
#
# These lines are optional (Sending the output to a file)
#
#
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>/var/run/zabbix/log/log.out 2>&1

# Your ClickSend credentials (from https://dashboard.clicksend.com/#/account/subaccount)
USERNAME=myUsername
APIKEY=abc123
PHONE=${1}
MESSAGE=${2}

# This echo is only for my /var/run/zabbix/log/log.out script
echo "date +%H:%M:%: Sending SMS Text to $1"

#
# Posting the SMS via HTTP API
# 
# NOTE: Because the Zabbix alerts have spaces/new lines, we are using the "--data-urlencode" option to encode the message.
#
curl -X POST "https://api-mapper.clicksend.com/http/v2/send.php?method=zabbix&username=$USERNAME&key=$APIKEY&to=$PHONE" --data-urlencode message="$MESSAGE"

echo "date +%H:%M:%: SMS Text sent to $1"
echo "MESSAGE: $2"
