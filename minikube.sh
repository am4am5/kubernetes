10.224.32.36

dnf install https://github.com/kubernetes/minikube/releases/download/v1.26.0/minikube-1.26.0-0.x86_64.rpm

minikube config --help

minikube config set driver podman && minikube config set container-runtime containerd && minikube config set network-plugin cni && minikube config set enable-default-cni && minikube config set bootstrapper kubeadm && minikube config set memory max && minikube config set cpus max && minikube config set listen-address '0.0.0.0' && minikube config set insecure-registry '10.0.0.0/24'
minikube config view

minikube start

#systemd
/usr/lib/systemd/system/minikube.service

[Unit]
Description=minikube

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=/root
ExecStart=/usr/bin/minikube start
ExecStop=/usr/bin/minikube stop

[Install]
WantedBy=multi-user.target

systemctl daemon-reload && systemctl enable --now minikube
