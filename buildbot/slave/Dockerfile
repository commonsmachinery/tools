# Build: docker build -t commonsmachinery/buildslave .

# TODO: switch this to our own Ubuntu 14.04 LTS image when that is
# available, but for now basing this on a nodejs image is just fine
FROM dockerfile/nodejs

# We need a bunch of stuff to build and run test cases
RUN apt-get install -y \
    python-pip \
    python-dev \
    python-virtualenv \
    build-essential \
    autoconf \
    automake \
    libtool \
    swig \
    redland-utils \
    librdf0-dev \
    librdf-storage-sqlite


# Rather than installing it from an Ubuntu package, install buildbot-slave
# with PIP.  This avoids any startup scripts and other things which we
# might not care for.
RUN pip install buildbot-slave

ADD run-slave.sh /
RUN chmod 755 /run-slave.sh

# Create the same user as the data image does
RUN /usr/sbin/groupadd -g 3002 buildslave
RUN /usr/sbin/useradd -u 3002 -g buildslave -d /build/slaves -M buildslave

# By default this is our catalog-slave, unless overridden with run -e
ENV SLAVE_NAME catalog-slave
ENV SLAVE_PASSWORD cm-build

WORKDIR /
USER buildslave
ENTRYPOINT ["/run-slave.sh"]
