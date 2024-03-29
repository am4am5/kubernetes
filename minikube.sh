10.224.32.36

dnf install https://github.com/kubernetes/minikube/releases/download/v1.26.0/minikube-1.26.0-0.x86_64.rpm

minikube config --help

minikube config set driver podman && minikube config set container-runtime containerd && minikube config set bootstrapper kubeadm && minikube config set memory max && minikube config set cpus 8 && minikube config set insecure-registry "10.0.0.0/24"
? minikube config set network-plugin cni minikube config set cni bridge && minikube config set listen-address 0.0.0.0
minikube config view

minikube start --listen-address=0.0.0.0 --force

#systemd
cat <<EOF > /usr/lib/systemd/system/minikube.service
[Unit]
Description=minikube
After=network.target local-fs.target containerd.service
[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=/root
ExecStart=/usr/bin/minikube start --listen-address=0.0.0.0 --force
ExecStop=/usr/bin/minikube stop
User=root
Group=root
[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload && systemctl enable --now minikube

minikube status

#addons
minikube addons list
minikube addons enable ingress
minikube addons enable metrics-server
minikube addons enable csi-hostpath-driver
