wget https://storage.googleapis.com/cri-containerd-release/cri-containerd-1.3.0.linux-amd64.tar.gz

tar --no-overwrite-dir -C / -xzf cri-containerd-1.3.0.linux-amd64.tar.gz

rm -rf /opt/containerd

containerd config default > /etc/containerd/config.toml
nano /etc/containerd/config.toml

[plugins."io.containerd.grpc.v1.cri".registry]
      [plugins."io.containerd.grpc.v1.cri".registry.mirrors]
        [plugins."io.containerd.grpc.v1.cri".registry.mirrors."docker.io"]
          endpoint = ["https://registry-1.docker.io"]
        [plugins."io.containerd.grpc.v1.cri".registry.mirrors."172.16.9.49:30020"]
          endpoint = ["http://172.16.9.49:30020"]

systemctl enable --now containerd