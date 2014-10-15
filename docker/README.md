CM docker images
================

Here are various docker images that are used in the development or
operation of CM, but don't belong anywhere else.

ubuntu
------

This our Ubuntu 14.04 LTS base image, which all other images should
be based on.

When necessary, rebuild it in the `ubuntu` directory like this:

    docker.io build --no-cache -t commonsmachinery/ubuntu .

`--no-cache` ensures that the apt repository is fully updated and all
packages upgraded to the latest versions.

When built and tested with the other images, push it to the docker
index:

    docker.io push commonsmachinery/ubuntu

To update on other machines before building images, pull the image
before rebuilding the others:

    docker.io pull commonsmachinery/ubuntu


socat
-----

Generic socat container which can be used to set up ambassador
containers.  Existing solutions like the original
svendowideit/ambassador or progrium/ambassadord try to be too clever
and as a result ends up not giving us sufficient control.
Specifically, this can be used to connect to a unix socket.

Standard build and push procedure:

    docker.io build -t commonsmachinery/socat .
    docker.io push commonsmachinery/socat

The arguments provided on the run command line will be passed directly
to socat.
