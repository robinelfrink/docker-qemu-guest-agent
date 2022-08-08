# QEMU Guest Agent Docker container

[QEMU Guest Agent](https://qemu-project.gitlab.io/qemu/interop/qemu-ga.html)
in a [Docker](https://www.docker.com/) container. To be used in
container-optimized operating systems, such as
[Talos](https://www.talos.dev/).

## Run using `docker`

```shell
docker run --rm --privileged --detach \
    --name qemu-guest-agent \
    --volume /dev/virtio-ports/org.qemu.guest_agent.0:/dev/virtio-ports/org.qemu.guest_agent.0 \
    ghcr.io/robinelfrink/qemu-guest-agent:latest
```

## Run using `docker-compose`

Create the file `docker-compose.yml`:

```yaml
version: '3'
services:
  qemu-guest-agent:
    container_name: qemu-guest-agent
    image: ghcr.io/robinelfrink/qemu-guest-agent:latest
    restart: unless-stopped
    privileged: true
    volumes:
      - /dev/virtio-ports/org.qemu.guest_agent.0:/dev/virtio-ports/org.qemu.guest_agent.0
```

Run:

```shell
docker-compose up --detach qemu-guest-agent
```

## Kubernetes DaemonSet

```shell
kubectl apply --filename \
    https://raw.githubusercontent.com/robinelfrink/docker-qemu-guest-agent/main/manifests/daemonset.yaml
```

## Kubernetes Helm chart

See [charts/qemu-guest-agent/README.md](charts/qemu-guest-agent/README.md) how
to install `qemu-guest-agent` using [Helm](https://helm.sh/).
