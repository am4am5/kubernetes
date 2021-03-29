#Install
wget https://github.com/containerd/containerd/releases/download/v1.4.4/cri-containerd-cni-1.4.4-linux-amd64.tar.gz && tar --no-overwrite-dir -C / -xzf cri-containerd-cni-1.4.4-linux-amd64.tar.gz && rm -rf /etc/cni/net.d/10-containerd-net.conflist /opt/containerd cri-containerd-cni-1.4.4-linux-amd64.tar.gz && mkdir /etc/containerd && containerd config default > /etc/containerd/config.toml

nano /etc/containerd/config.toml
[plugins."io.containerd.grpc.v1.cri".registry]
      [plugins."io.containerd.grpc.v1.cri".registry.mirrors]
        [plugins."io.containerd.grpc.v1.cri".registry.mirrors."docker.io"]
          endpoint = ["https://registry-1.docker.io"]
        [plugins."io.containerd.grpc.v1.cri".registry.mirrors."registry.nces.by"]
          endpoint = ["https://registry.nces.by"]
          
[debug]
  level = "warn"

systemctl enable --now containerd && systemctl status containerd

#Upgrade
wget https://github.com/containerd/containerd/releases/download/v1.4.3/cri-containerd-cni-1.4.3-linux-amd64.tar.gz && tar --no-overwrite-dir -C / -xzf cri-containerd-cni-1.4.3-linux-amd64.tar.gz && rm -rf /opt/containerd /etc/cni/net.d/10-containerd-net.conflist cri-containerd-cni-1.4.3-linux-amd64.tar.gz && systemctl daemon-reload && systemctl restart containerd && systemctl status containerd
