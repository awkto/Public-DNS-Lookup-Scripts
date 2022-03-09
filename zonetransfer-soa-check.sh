#!/bin/bash
echo "CSC DNS    : "$(dig gis-manulife-dev.com @udns1.cscdns.net. SOA +short)
echo "NSone DNS  : "$(dig gis-manulife-dev.com @dns3.p08.nsone.net. SOA +short)
echo "Akamai     : "$(dig gis-manulife-dev.com @a1-25.akam.net SOA +short)
echo "Cloudflare : "$(dig gis-manulife-dev.com @ns0005.secondary.cloudflare.com. SOA +short)


#this script is incomplete and not working
