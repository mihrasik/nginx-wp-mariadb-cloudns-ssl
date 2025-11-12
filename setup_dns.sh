#!/bin/bash

# DNS configuration using CloudNS API
CLOUDNS_USERNAME="46909"
CLOUDNS_API_KEY="Dfopidajiopwqe-4684"
WP_DOMAIN="lde1.mykhailo.abrdns.com"
SERVER_IP="63.33.71.213"

# Update A record for the domain
curl -X POST "https://api.cloudns.net/dns/update-record.json" \
  -d "auth-id=$CLOUDNS_USERNAME" \
  -d "auth-password=$CLOUDNS_API_KEY" \
  -d "domain-name=$WP_DOMAIN" \
  -d "record-type=A" \
  -d "host=@ " \
  -d "value=$SERVER_IP" \
  -d "ttl=300"

# echo "DNS records updated successfully"
