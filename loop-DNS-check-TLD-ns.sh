#!/bin/bash

#INPUT A FILE WITH LIST OF DOMAINS TO CHECK
domainlist=$1

#FOR TROUBLESHOOTING, THIS IS WHAT THE HASHES SHOULD MATCH FOR A PROPER CONFIG
echo "CORRECT HASH : 0617414fee3e217474d496dc7ac9104a"

#HIGHER LAYER LOOP JUST GOES THROUGH A LIST OF TLDs
for TLD in $(echo com net org info ca); do \

	#Generate 2 variables while inside loop iteration for a particular TLD
	echo "STARTING WITH TLD : "$TLD; \
	domainTLDns=$(dig +short $TLD NS|sort|head -1); \
	domainsublist=$(cat $domainlist | grep $TLD\$); \

	#LOWER LAYER LOOP WILL GO THROUGH LIST OF DOMAINS UNDER A GIVEN TLD
	for domain in $(echo $domainsublist);do \
		echo 	"TLD NS record hash is "\
			$(dig @$domainTLDns NS +norecurse $domain\
			|grep -A4 "AUTHORITY SECTION"|grep -v AUTHORITY |sort|awk {'print $5'}|md5sum)\
			" FOR DOMAIN "\
			$domain; \
			sleep 0.2; \
	done;
done

#JUST FOR COMPARISON IN OUTPUT
echo "REMINDER : 0617414fee3e217474d496dc7ac9104a is the correct md5sum for 4 NS records (2 cloudflare, 2 csc)"
