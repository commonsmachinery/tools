# Build: docker build -t commonsmachinery/buildslave .

FROM commonsmachinery/ubuntu

# Use upstream package where node has the right name and includes npm
# and all dev files.
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update

# We need a bunch of stuff to build and run test cases
RUN apt-get install -y \
    nodejs \
    python-pip \
    python-dev \
    python-virtualenv \
    build-essential \
    autoconf \
    automake \
    libtool \
    libzmq3 \
    libzmq3-dev \
    libkyotocabinet-dev \
    kyotocabinet-utils


# Rather than installing it from an Ubuntu package, install buildbot-slave
# with PIP.  This avoids any startup scripts and other things which we
# might not care for.
RUN pip install buildbot-slave

ADD run-slave.sh /
RUN chmod 755 /run-slave.sh

# Create a build user
RUN /usr/sbin/groupadd buildslave
RUN /usr/sbin/useradd -g buildslave -d /build/slaves -M buildslave

# By default this is our catalog-slave, unless overridden with run -e
ENV SLAVE_NAME catalog-slave
ENV SLAVE_PASSWORD cm-build

RUN mkdir -p /build/slaves
RUN chown buildslave.buildslave /build/slaves
RUN chmod 755 /build /build/slaves

USER buildslave
ENTRYPOINT ["/run-slave.sh"]
