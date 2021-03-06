#Install
wget https://github.com/containerd/containerd/releases/download/v1.5.4/cri-containerd-cni-1.5.4-linux-amd64.tar.gz && tar --no-overwrite-dir -C / -xzf cri-containerd-cni-1.5.4-linux-amd64.tar.gz && rm -rf /opt/containerd cri-containerd-cni-1.5.4-linux-amd64.tar.gz /etc/cni/net.d/10-containerd-net.conflist && mkdir /etc/containerd && containerd config default > /etc/containerd/config.toml

nano /etc/containerd/config.toml
[plugins."io.containerd.grpc.v1.cri".registry]
      [plugins."io.containerd.grpc.v1.cri".registry.mirrors]
        [plugins."io.containerd.grpc.v1.cri".registry.mirrors."docker.io"]
          endpoint = ["https://registry-1.docker.io"]
        [plugins."io.containerd.grpc.v1.cri".registry.mirrors."172.16.9.49:30020"]
          endpoint = ["http://172.16.9.49:30020"]
        [plugins."io.containerd.grpc.v1.cri".registry.mirrors."registry.edo.iba"]
          endpoint = ["https://registry.edo.iba"]
          
# X.509 fix 
        [plugins."io.containerd.grpc.v1.cri".registry.configs]
          [plugins."io.containerd.grpc.v1.cri".registry.configs."registry.edo.iba".tls]
            insecure_skip_verify = true


[metrics]
  address = "127.0.0.1:9323"

[debug]
  level = "warn"

systemctl enable --now containerd && systemctl status containerd

#Upgrade
wget https://github.com/containerd/containerd/releases/download/v1.5.4/cri-containerd-cni-1.5.4-linux-amd64.tar.gz && tar --no-overwrite-dir -C / -xzf cri-containerd-cni-1.5.4-linux-amd64.tar.gz && rm -rf /opt/containerd /etc/cni/net.d/10-containerd-net.conflist cri-containerd-cni-1.5.4-linux-amd64.tar.gz && systemctl daemon-reload && systemctl restart containerd && systemctl status containerd
