#Install
CD_VER=1.7.1 && wget https://github.com/containerd/containerd/releases/download/$v{CD_VER}/cri-containerd-cni-${CD_VER}-linux-amd64.tar.gz && tar --no-overwrite-dir -C / -xzf cri-containerd-cni-${CD_VER}-linux-amd64.tar.gz && rm -rf /opt/containerd cri-containerd-cni-${CD_VER}-linux-amd64.tar.gz /etc/cni/net.d/10-containerd-net.conflist && mkdir /etc/containerd && containerd config default > /etc/containerd/config.toml

sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml
PAUSE_IMAGE=$(kubeadm config images list | grep pause) && sed -i "s,sandbox_image = .*,sandbox_image = \"$PAUSE_IMAGE\",g" /etc/containerd/config.toml

nano /etc/containerd/config.toml
    [plugins."io.containerd.grpc.v1.cri".registry]
      [plugins."io.containerd.grpc.v1.cri".registry.mirrors."registry.gtb.local"]
        endpoint = ["https://registry.gtb.local"]
      [plugins."io.containerd.grpc.v1.cri".registry.configs."registry.gtb.local".tls]
        insecure_skip_verify = true

    [plugins."io.containerd.grpc.v1.cri".registry]
      [plugins."io.containerd.grpc.v1.cri".registry.mirrors."registry.edo.iba"]
        endpoint = ["https://registry.edo.iba"]
      [plugins."io.containerd.grpc.v1.cri".registry.configs."registry.edo.iba".tls]
        insecure_skip_verify = true

[debug]
  level = "warn"

systemctl enable --now containerd && systemctl status containerd

echo "192.168.249.20 registry.gtb.local" >> /etc/hosts

rm -f /etc/cni/net.d/87-podman-bridge.conflist

#Upgrade
CD_VER=1.7.6 && wget https://github.com/containerd/containerd/releases/download/v${CD_VER}/cri-containerd-cni-${CD_VER}-linux-amd64.tar.gz && tar --no-overwrite-dir -C / -xzf cri-containerd-cni-${CD_VER}-linux-amd64.tar.gz && rm -rf /opt/containerd /etc/cni/net.d/10-containerd-net.conflist cri-containerd-cni-${CD_VER}-linux-amd64.tar.gz && systemctl daemon-reload && systemctl restart containerd && systemctl status containerd
