#!/bin/sh

d=/build/master

set -e -u

if ! [ -d "$d" -a -w "$d" ]
then
    echo "Missing or invalid data volume /build:"
    ls -ld /build
    ls -l /build
    exit 1
fi

# Create master working dir if not already present
if ! [ -f "$d/buildbot.tac" ]
then
    buildbot create-master --log-count=20 --log-size=1000000 "$d"
fi

# Update the configuration, if the docker image one is newer than the
# one we have (this allows changes to config without rebuilding the
# image, which might or might not be a good idea
ls -l /master.cfg "$d/master.cfg" || true
cp -uv /master.cfg "$d/master.cfg"


# Output buildbot log so it's easy to follow with docker logs, and ask
# it to die together with this process (which will be buildbot in a moment)
tail -F --pid=$$ "$d/twistd.log" &

echo "starting buildbot"
exec buildbot start --nodaemon "$d"
