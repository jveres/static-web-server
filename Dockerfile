FROM alpine:3.12
RUN apk add --no-cache git ca-certificates alpine-sdk cmake zlib-static zlib-dev
RUN git clone https://github.com/lpereira/lwan
WORKDIR /lwan
RUN mkdir build \
    && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_EXE_LINKER_FLAGS="-static" -DCMAKE_C_FLAGS="-static" \
    && make
RUN strip /lwan/build/src/bin/lwan/lwan

FROM scratch
COPY --from=0 /lwan/build/src/bin/lwan/lwan /bin/lwan
COPY lwan.conf lwan.html /etc/
WORKDIR /srv
EXPOSE 8080

ENTRYPOINT ["/bin/lwan", "--config", "/etc/lwan.conf"]