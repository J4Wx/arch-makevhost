#!/bin/bash

HTTPDIR="/srv/http/"
SITESAVAILABLE="/etc/httpd/conf/sites-available/"
SITESENABLED="/etc/httpd/conf/sites-enabled/"

if [ ! -d "$HTTPDIR" ]; then
    echo "$HTTPDIR does not exist. Create the directory $HTTPDIR to continue."
    exit 1    
fi

if [ ! -d "$SITESAVAILABLE" ]; then
    echo "$SITESAVAILABLE does not exist. Create the directory $SITESAVAILABLE to continue."
    exit 1
fi

echo "What vHost would you like to create? [theibex.net, something.test]"
read SITENAME

echo ""

echo "What is the public directory of this vHost? [/public, /pub, ]"
read PUBROOT

if [ -f "$SITESAVAILABLE$SITENAME.conf" ]; then
    echo "The .conf for $SITENAME already exists in $SITESAVAILABLE"
    exit 1
fi

if [ ! -d "$HTTPDIR$SITENAME" ]; then
    mkdir "$HTTPDIR$SITENAME"
fi

echo "
<VirtualHost *:80>
    DocumentRoot "$HTTPDIR$SITENAME$PUBROOT"
    ServerName $SITENAME
</VirtualHost>
" > "$SITESAVAILABLE$SITENAME.conf"