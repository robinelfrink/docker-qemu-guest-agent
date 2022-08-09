# QEMU Guest Agent

Guest-side qemu-system agent

This chart installs the QEMU guest agent as a `DaemonSet` on all nodes on a
[Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Add Chart Repository

```console
helm repo add qemu-guest-agent https://robinelfrink.github.io/docker-qemu-guest-agent

## Install Chart

```console
helm install qemu-guest-agent qemu-guest-agent/qemu-guest-agent
```

## Uninstall Chart

```console
helm uninstall qemu-guest-agent
```

This removes all the Kubernetes components associated with the chart and deletes the release.

## Upgrading Chart

```console
helm upgrade qemu-guest-agent qemu-guest-agent/qemu-guest-agent
```

