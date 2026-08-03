FROM ghcr.io/home-assistant/base:latest

COPY install.sh /
RUN /install.sh

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
