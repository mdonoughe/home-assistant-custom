FROM homeassistant/home-assistant:latest

ARG homeassistant_ref=caseta-registry
ARG pylutron_caseta_ref=dev

# upstream image comes with BusyBox tar and does not support wildcard include patterns
RUN apk --no-cache add tar

RUN curl -L https://api.github.com/repos/mdonoughe/home-assistant/tarball/${homeassistant_ref} | tar xz --strip-components=1 -C /usr/src/homeassistant --wildcards '*/homeassistant/components/lutron_caseta/*' && \
    curl -L https://api.github.com/repos/gurumitts/pylutron-caseta/tarball/${pylutron_caseta_ref} | tar xz --strip-components=1 -C /usr/local/lib/python3.7/site-packages --wildcards '*/pylutron_caseta'

CMD python3 -m homeassistant --config /config --skip-pip
