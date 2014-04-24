
Build
-----

From this directory:

    sudo docker build -t commonsmachinery/builddata data
    sudo docker build -t commonsmachinery/buildmaster master
    sudo docker build -t commonsmachinery/buildslave slave

Run
---

Kick off data volumes - typically only once:

    sudo docker run -d --name=BUILDDATA builddata

Run a new buildmaster container (drop `BUILD_IRC_CHANNEL` if you don't
want to enable the IRC status bot):

    sudo docker run --name=buildmaster -d -p 8089:8089 --volumes-from=BUILDDATA -e 'BUILD_IRC_CHANNEL=#commonsmachinery' commonsmachinery/buildmaster

Run a slave for building the catalog.  This uses the default name and
password, but that can be changed with `-e` (see `slave/Dockerfile`):

    sudo docker run --name=catalog-slave -d --volumes-from=BUILDDATA --link=buildmaster:master commonsmachinery/buildslave
