# QEMU Guest Agent

Guest-side qemu-system agent

This chart installs the QEMU guest agent as a `DaemonSet` on all nodes on a
[Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Get Repo Info

```console
helm repo add qemu-guest-agent https://robinelfrink.github.io/docker-qemu-guest-agent
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] qemu-guest-agent/qemu-guest-agent

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

This removes all the Kubernetes components associated with the chart and deletes the release.

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] [CHART] --install
```

