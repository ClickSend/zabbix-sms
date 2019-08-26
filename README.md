# Send SMS with Zabbix and ClickSend

On Zabbix you can send an alert through a SMS gateway. This tutorial explains how to setup the ClickSend SMS gateway (www.clicksend.com).

What you'll need:

1. Curl
2. ClickSend API Key - you can get that here: https://clicksend.com/signup
3. Credits in your account.

How to add the script to Zabbix (Tested on Zabbix Server 3.4):

1. Administration > Media Types
2. Add a new "Script" media Type
```
		Name: ClickSend - SMS
		Type: Script
		Script name: send_sms.sh
		Script parameters:
		PARAMETER 1: {ALERT.SENDTO}
		PARAMETER 2: {ALERT.MESSAGE}
```

3. Create an action and make sure it has the "SEND SMS" enabled on it.
4. Copy the script `send_sms.sh` to your Zabbix server on: `/usr/lib/zabbix/alertscripts`
5. Add permission to the file:
```
		chmod +x /usr/lib/zabbix/alertscripts/send_sms.sh
		chown zabbix:zabbix /usr/lib/zabbix/alertscripts/send_sms.sh
```

6. Your user's Media should look like (Assuming their Mobile phone is +61411111111):
```
Type: ClickSend - SMS
Send to: 61411111111
```

If you have any questions/improvements please, get in touch!
