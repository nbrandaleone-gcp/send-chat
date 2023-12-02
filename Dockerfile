# Build image
FROM crystallang/crystal:latest-alpine as builder

MAINTAINER Nick Brandaleone <nbrand@mac.com>

WORKDIR /opt

# Cache dependencies
COPY ./shard.yml ./shard.lock /opt/
RUN shards install --production -v

# Build the Crystal binary
COPY . /opt/
RUN crystal build --static --release ./src/send-chat.cr

# Release image
FROM alpine:latest
WORKDIR /opt
# Copy over binary and supporting files
COPY --from=builder /opt/ .
# Should run as non-root user
# USER 2:2
ENTRYPOINT ["./send-chat"]
