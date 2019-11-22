FROM homeassistant/home-assistant:latest

ARG homeassistant_ref=caseta-registry

# upstream image comes with BusyBox tar and does not support wildcard include patterns
RUN apk --no-cache add tar

RUN curl -L https://api.github.com/repos/mdonoughe/home-assistant/tarball/${homeassistant_ref} | tar xz --strip-components=1 -C /usr/src/homeassistant --wildcards '*/homeassistant/components/lutron_caseta/*' && \
    pip3 install --no-cache-dir pylutron_caseta==0.5.1

CMD python3 -m homeassistant --config /config --skip-pip
