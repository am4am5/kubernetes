wget https://storage.googleapis.com/cri-containerd-release/cri-containerd-1.3.0.linux-amd64.tar.gz

tar --no-overwrite-dir -C / -xzf cri-containerd-1.3.0.linux-amd64.tar.gz

rm -rf /opt/containerd

systemctl enable --now containerd
