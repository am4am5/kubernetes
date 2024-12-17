systemctl enable --now kubelet

kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-cert-extra-sans=localhost,127.0.0.1,10.16.64.17

kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.92.254 --control-plane-endpoint=192.168.92.254 --node-name=nansed --apiserver-cert-extra-sans=localhost,127.0.0.1,192.168.92.254,80.94.169.171


kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml

kubeadm token create --print-join-command

#1node taint:
kubectl taint node mdastend node-role.kubernetes.io/control-plane:NoSchedule-
