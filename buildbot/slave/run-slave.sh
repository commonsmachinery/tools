#!/bin/bash

base=/build/slaves

set -e -u

if ! [ -d "$base" -a -w "$base" ]
then
    echo "Missing or invalid data volume /build:"
    ls -ld /build
    ls -l /build
    exit 1
fi

d="$base/$SLAVE_NAME"
export HOME="$d"

mkdir -p "$d"

# Always run create-slave, since host/port might have changed
buildslave create-slave --log-count=20 --log-size=1000000 "$d" \
    "$MASTER_PORT_9989_TCP_ADDR:$MASTER_PORT_9989_TCP_PORT" \
    "$SLAVE_NAME" "$SLAVE_PASSWORD"

# Second runs create a new config file rather than overwriting, so
# move it in place
[ -f "$d/buildbot.tac.new" ] && mv -v "$d/buildbot.tac.new" "$d/buildbot.tac"


# Output buildslave log so it's easy to follow with docker logs, and
# ask it to die together with this process (which will be buildslave
# in a moment)
tail -F --pid=$$ "$d/twistd.log" &

echo "starting buildslave $SLAVE_NAME"
exec buildslave start --nodaemon "$d"
