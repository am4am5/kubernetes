#Install
wget https://github.com/containerd/containerd/releases/download/v1.4.2/cri-containerd-cni-1.4.2-linux-amd64.tar.gz && tar --no-overwrite-dir -C / -xzf cri-containerd-cni-1.4.2-linux-amd64.tar.gz && rm -rf /opt/containerd /etc/cni/net.d/10-containerd-net.conflist cri-containerd-cni-1.4.2-linux-amd64.tar.gz && mkdir /etc/containerd && containerd config default > /etc/containerd/config.toml

nano /etc/containerd/config.toml
[plugins."io.containerd.grpc.v1.cri".registry]
      [plugins."io.containerd.grpc.v1.cri".registry.mirrors]
        [plugins."io.containerd.grpc.v1.cri".registry.mirrors."docker.io"]
          endpoint = ["https://registry-1.docker.io"]
        [plugins."io.containerd.grpc.v1.cri".registry.mirrors."172.16.9.49:30020"]
          endpoint = ["http://172.16.9.49:30020"]
          
[metrics]
  address = "127.0.0.1:9323"

[debug]
  level = "warn"
systemctl restart containerd && systemctl status containerd  


systemctl enable --now containerd

#Upgrade
wget https://github.com/containerd/containerd/releases/download/v1.4.3/cri-containerd-cni-1.4.3-linux-amd64.tar.gz && tar --no-overwrite-dir -C / -xzf cri-containerd-cni-1.4.3-linux-amd64.tar.gz && rm -rf /opt/containerd /etc/cni/net.d/10-containerd-net.conflist cri-containerd-cni-1.4.3-linux-amd64.tar.gz && systemctl daemon-reload && systemctl restart containerd && systemctl status containerd
