ARG BUILD_FROM
FROM $BUILD_FROM

COPY --from=node:22-alpine /usr/local/bin /usr/local/bin
COPY --from=node:22-alpine /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=oven/bun:alpine /usr/local/bin /usr/local/bin

RUN rm -f /usr/local/bin/yarn /usr/local/bin/yarnpkg \
    && npm i -g yarn

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
