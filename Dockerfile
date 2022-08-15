FROM alpine:3.16.2 AS build
RUN mkdir -p /build/etc/apk /build/var/run /empty
RUN cp -r /etc/apk/* /build/etc/apk/
RUN apk add --no-cache --initdb -p /build qemu-guest-agent musl

FROM scratch
COPY --from=build /build/bin /bin
COPY --from=build /build/etc /etc
COPY --from=build /build/lib /lib
COPY --from=build /build/sbin /sbin
COPY --from=build /build/usr /usr
COPY --from=build /build/var /var

CMD ["/usr/bin/qemu-ga", "--method", "virtio-serial", "--path", "/dev/virtio-ports/org.qemu.guest_agent.0"]
