# Build: docker build -t commonsmachinery/builddata .
# Run:   docker run -d --name=BUILDDATA commonsmachinery/builddata

FROM busybox

VOLUME ["/build"]

ADD run-data.sh /

ENTRYPOINT ["/run-data.sh"]
