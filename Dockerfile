FROM alpine:3.20.3 AS build
RUN mkdir -p /build/etc/apk /build/var/run
RUN cp -r /etc/apk/* /build/etc/apk/
RUN apk add --no-cache --initdb -p /build qemu-guest-agent musl

FROM scratch
COPY --from=build /build/usr/bin/qemu-ga /usr/bin/qemu-ga
COPY --from=build /build/lib/ld-musl-x86_64.so.1 /lib/ld-musl-x86_64.so.1
COPY --from=build /build/usr/lib/libnuma.so.1 /usr/lib/libnuma.so.1
COPY --from=build /build/usr/lib/liburing.so.2 /usr/lib/liburing.so.2
COPY --from=build /build/usr/lib/libglib-2.0.so.0 /usr/lib/libglib-2.0.so.0
COPY --from=build /build/usr/lib/libgmodule-2.0.so.0 /usr/lib/libgmodule-2.0.so.0
COPY --from=build /build/usr/lib/libintl.so.8 /usr/lib/libintl.so.8
COPY --from=build /build/usr/lib/libpcre2-8.so.0 /usr/lib/libpcre2-8.so.0
COPY --from=build /build/var/run /var/run

CMD ["/usr/bin/qemu-ga", "--method", "virtio-serial", "--path", "/dev/virtio-ports/org.qemu.guest_agent.0"]
