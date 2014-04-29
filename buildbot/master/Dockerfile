# Build: docker build -t commonsmachinery/buildmaster .

FROM commonsmachinery/ubuntu

# Create the same user as the data image does
RUN /usr/sbin/groupadd -g 3001 buildmaster
RUN /usr/sbin/useradd -u 3001 -g buildmaster -d /build/master -M buildmaster

# Rather than installing it from an Ubuntu package, install buildbot
# with PIP.  This avoids any startup scripts and other things which we
# might not care for.
RUN apt-get install -y python-pip python-dev
RUN pip install buildbot

ADD master.cfg /
RUN chmod 644 /master.cfg

ADD run-master.sh /
RUN chmod 755 /run-master.sh

EXPOSE 8089 9989

WORKDIR /
USER buildmaster
ENTRYPOINT ["/run-master.sh"]
