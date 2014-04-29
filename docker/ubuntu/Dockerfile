# Build: docker.io build --no-cache -t commonsmachinery/ubuntu .
# (Run without cache to force update)
#
# Commons Machinery base Ubuntu docker image
# Based on https://index.docker.io/u/dockerfile/ubuntu/ but without
# the bash/git scripts.

# Pull base image.
FROM ubuntu:14.04

# Update OS.
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

# Install basic packages.
RUN apt-get install -y software-properties-common
RUN apt-get install -y curl git unzip vim wget

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

