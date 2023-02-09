#!/usr/bin/env bash

## Validate input
if [[ $# -eq 0 ]]; then

	echo -e "Polls api.macvendors.com to look up the vendor for any number of provided MAC addresses.\n"
	echo "Usage:"
	echo -e "$0 mac_address [mac_address] [mac_address] ...\n"
	echo "Acceptable mac_address formats:"
	echo "  00-11-22-33-44-55"
	echo "  00:11:22:33:44:55"
	echo "  00.11.22.33.44.55"
	echo "  001122334455"
	echo "  0011.2233.4455"
	exit 1

fi

## Lookup MAC addresses
for mac in $@; do

	backoff=0.01

	vendor=$(curl -s "https://api.macvendors.com/$mac")

	while [[ "$vendor" == *"Too Many Requests"* ]]; do

		#>&2 echo "Throttled, waiting $backoff seconds..."
		sleep $backoff
		backoff=$(echo "$backoff * 2" | bc)
		vendor=$(curl -s "https://api.macvendors.com/$mac")
		if [[ "$vendor" == *"Not Found"* ]]; then vendor="(Unknown Vendor)"; fi

	done

	echo -e "$mac\t$vendor"

done