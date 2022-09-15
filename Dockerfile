FROM rust:latest AS builder

RUN cargo install arti

FROM debian:bullseye-slim as final

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates sqlite3

# $USER name, and data $DIR to be used in the `final` image
ARG USER=arti
ARG DIR=/home/arti

# NOTE: Default GID == UID == 1000
RUN adduser --disabled-password \
            --home "$DIR/" \
            --gecos "" \
            "$USER"
USER $USER

COPY --from=builder /usr/local/cargo/bin/arti /usr/local/bin/


# Prevents `VOLUME $DIR/.arti/` being created as owned by `root`
RUN mkdir -p "$DIR/.arti/"

# Expose volume containing all `artid` data
VOLUME $DIR/.arti/


ENTRYPOINT ["arti"]
CMD [ "proxy", "-p", "9050" ]