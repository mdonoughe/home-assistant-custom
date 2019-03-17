FROM homeassistant/home-assistant:latest

ARG homeassistant_ref=caseta-registry
ARG pylutron_caseta_ref=dev

RUN curl -L https://api.github.com/repos/mdonoughe/home-assistant/tarball/${homeassistant_ref} | tar xz --strip-components=1 --wildcards '*/homeassistant/components/lutron_caseta.py' && \
    curl -L https://api.github.com/repos/gurumitts/pylutron-caseta/tarball/${pylutron_caseta_ref} | tar xz --strip-components=1 -C /usr/local/lib/python3.6/site-packages --wildcards '*/pylutron_caseta'

CMD python -m homeassistant --config /config --skip-pip
