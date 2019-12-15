#!/bin/bash

HTTPDIR="/srv/http/"
SITESAVAILABLE="/etc/httpd/conf/sites-available/"
SITESENABLED="/etc/httpd/conf/sites-enabled/"

echo "What vHost would you like to delete? [theibex.net, something.test]"
read SITENAME

if [ -d "$HTTPDIR$SITENAME" ]; then
    rm -rf "$HTTPDIR$SITENAME"
fi  


if [ -f "$SITESAVAILABLE$SITENAME.conf" ]; then
    rm "$SITESAVAILABLE$SITENAME.conf"
fi