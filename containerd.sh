wget https://storage.googleapis.com/cri-containerd-release/cri-containerd-1.3.2.linux-amd64.tar.gz

tar --no-overwrite-dir -C / -xzf cri-containerd-1.3.2.linux-amd64.tar.gz

rm -rf /opt/containerd

mkdir /etc/containerd
containerd config default > /etc/containerd/config.toml
nano /etc/containerd/config.toml

[plugins."io.containerd.grpc.v1.cri".registry]
      [plugins."io.containerd.grpc.v1.cri".registry.mirrors]
        [plugins."io.containerd.grpc.v1.cri".registry.mirrors."docker.io"]
          endpoint = ["https://registry-1.docker.io"]
        [plugins."io.containerd.grpc.v1.cri".registry.mirrors."172.16.9.49:30020"]
          endpoint = ["http://172.16.9.49:30020"]

update:
systemctl daemon-reload
systemctl restart containerd

install:
systemctl enable --now containerd
