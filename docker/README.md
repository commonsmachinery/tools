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
