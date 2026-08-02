FROM ghcr.io/home-assistant/base:3.24

COPY install.sh /
RUN /install.sh \
    && addgroup -g 1000 code_runner \
    && adduser -u 1000 -G code_runner -s /bin/sh -D code_runner

COPY run.sh /
RUN chmod a+x /run.sh

USER code_runner
CMD [ "/run.sh" ]
