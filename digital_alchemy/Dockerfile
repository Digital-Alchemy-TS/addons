ARG BUILD_FROM
FROM $BUILD_FROM

COPY install.sh /
RUN /install.sh

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
