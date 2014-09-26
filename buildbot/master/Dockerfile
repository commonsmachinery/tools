# Build: docker build -t commonsmachinery/buildmaster .

FROM commonsmachinery/ubuntu

# Create a build user 
RUN /usr/sbin/groupadd buildmaster
RUN /usr/sbin/useradd -g buildmaster -d /build/master -M buildmaster

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

RUN mkdir -p /build/master
RUN chown buildmaster.buildmaster /build/master
RUN chmod 755 /build /build/master

USER buildmaster
ENTRYPOINT ["/run-master.sh"]
