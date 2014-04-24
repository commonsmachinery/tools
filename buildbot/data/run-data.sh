#!/bin/sh

# Create working dirs in the data volume and set the permissions.
# Don't bother with defining user and groups here, since we're anyway
# relying on the choosen IDs.

chmod 755 /build

mkdir -p /build/master
chown 3001.3001 /build/master
chmod 755 /build/master

mkdir -p /build/slaves
chown 3002.3002 /build/slaves
chmod 755 /build/slaves

while true
do
    sleep 300
done

