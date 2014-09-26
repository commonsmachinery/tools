
Build
-----

If desired, build a new ubuntu image (see `docker/README.md` in this
repository), or just pull commonsmachinery/ubuntu from the docker
index.

From this directory:

    sudo docker.io build -t commonsmachinery/buildmaster master
    sudo docker.io build -t commonsmachinery/buildslave slave

Run
---

Run a new buildmaster container (drop `BUILD_IRC_CHANNEL` if you don't
want to enable the IRC status bot):

    sudo docker.io run --name=buildmaster -d -p 8089:8089 -e 'BUILD_IRC_CHANNEL=#commonsmachinery' commonsmachinery/buildmaster

Run a slave for building the catalog.  This uses the default name and
password, but that can be changed with `-e` (see `slave/Dockerfile`):

    sudo docker.io run --name=buildslave-catalog -d --link=buildmaster:master commonsmachinery/buildslave
