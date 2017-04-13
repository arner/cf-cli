FROM buildpack-deps:jessie-curl

RUN curl -sL "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -zx \
    && chmod +x cf \
    && mv cf /usr/bin/ \
    && curl -so "ibm-containers-linux_x64" "http://public.dhe.ibm.com/cloud/bluemix/cli/cf-plugins/ibm-containers/ibm-containers-linux_x64" \
    && chmod +x ibm-containers-linux_x64

RUN cf install-plugin -f ibm-containers-linux_x64

ENV CF_API="https://api.eu-gb.bluemix.net"

RUN cf api $CF_API