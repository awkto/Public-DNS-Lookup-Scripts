#!/bin/bash

#this script will show the NS records for each zone in the list,
#  both the registrar NS records and the in-zone NS records will be shown

domainslist=$1

for domain in $(cat $domainslist);do \
	echo "Checking "$domain;\
	dig $domain NS +trace +nodnssec\
	|grep $domain;
done
