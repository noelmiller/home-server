FROM quay.io/centos-bootc/centos-bootc:stream9

COPY build.sh /tmp/build.sh

COPY system_files /

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit