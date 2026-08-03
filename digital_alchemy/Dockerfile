FROM ghcr.io/home-assistant/base:latest

COPY install.sh /
RUN /install.sh

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
