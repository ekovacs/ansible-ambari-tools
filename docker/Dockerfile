FROM registry.eng.hortonworks.com/qaas/texas_test_entrypoint:2.0.0-8-g0938cec

ADD . /opt/ansible-ambari-tools
WORKDIR /opt/ansible-ambari-tools

RUN chmod +x docker/configure.sh

# installing add-apt-repository
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common && \
    rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:rmescandon/yq && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        python3-venv \
        yq && \
    rm -rf /var/lib/apt/lists/*

RUN rm -rf .venv && python3 -m venv .venv

ENTRYPOINT ["docker/configure.sh"]