#!/bin/bash

domainslist=$1

for domain in $(cat $domainslist);do \
	echo "Checking "$domain;\
	dig $domain NS +trace +nodnssec\
	|grep $domain;
done
