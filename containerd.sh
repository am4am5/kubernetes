#Install
wget https://github.com/containerd/containerd/releases/download/v1.4.0/cri-containerd-cni-1.4.0-linux-amd64.tar.gz && tar --no-overwrite-dir -C / -xzf cri-containerd-cni-1.4.0-linux-amd64.tar.gz && rm -rf /opt/containerd && mkdir /etc/containerd && containerd config default > /etc/containerd/config.toml

nano /etc/containerd/config.toml
[plugins."io.containerd.grpc.v1.cri".registry]
      [plugins."io.containerd.grpc.v1.cri".registry.mirrors]
        [plugins."io.containerd.grpc.v1.cri".registry.mirrors."docker.io"]
          endpoint = ["https://registry-1.docker.io"]
        [plugins."io.containerd.grpc.v1.cri".registry.mirrors."172.16.9.49:30020"]
          endpoint = ["http://172.16.9.49:30020"]
          
[metrics]
  address = "127.0.0.1:9323"

systemctl enable --now containerd

#Upgrade
wget https://github.com/containerd/containerd/releases/download/v1.4.0/cri-containerd-cni-1.4.0-linux-amd64.tar.gz && tar --no-overwrite-dir -C / -xzf cri-containerd-cni-1.4.0-linux-amd64.tar.gz && rm -rf /opt/containerd && systemctl daemon-reload && systemctl restart containerd && systemctl status containerd
