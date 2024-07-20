ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache curl

# Set Node.js version
ENV NODE_VERSION=20.15.1

# Download and install Node.js
RUN curl -fsSL https://unofficial-builds.nodejs.org/download/release/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64-musl.tar.xz \
    | tar -xJf - -C /usr/local --strip-components=1

RUN npm i -g tsx nodemon

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
