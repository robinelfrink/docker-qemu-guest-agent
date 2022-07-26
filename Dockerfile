FROM gcr.io/google-appengine/debian11@sha256:e10615d67e9462d79534043e08d79ba2b188f6069d7bafb31ad62c3498c6a38d AS build
RUN apt-get update
RUN apt-get install --no-install-suggests --no-install-recommends --yes qemu-guest-agent

FROM gcr.io/distroless/base-debian11@sha256:0530d193888bcd7bd0376c8b34178ea03ddb0b2b18caf265135b6d3a393c8d05
COPY --from=build /etc/qemu /etc/
COPY --from=build /usr/sbin/qemu-ga /usr/sbin/
COPY --from=build \
    /lib/x86_64-linux-gnu/libudev.so.* \
    /lib/x86_64-linux-gnu/libglib-2.0.so.* \
    /lib/x86_64-linux-gnu/liburing.so.* \
    /lib/x86_64-linux-gnu/libgmodule-2.0.so.* \
    /lib/x86_64-linux-gnu/libpcre.so.* \
    /lib/x86_64-linux-gnu/

CMD ["/usr/sbin/qemu-ga", "--method", "virtio-serial", "--path", "/dev/virtio-ports/org.qemu.guest_agent.0"]
