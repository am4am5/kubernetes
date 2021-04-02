systemctl enable --now kubelet

kubeadm init --pod-network-cidr=10.244.0.0/16

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

kubeadm token create --print-join-command

kubeadm join 172.16.9.46:6443 --token hvq11u.2f5jmhv06ap8b5j2     --discovery-token-ca-cert-hash sha256:c336361df853fa4f7836d6cbd29bb440d26b3059b733570d9e63be9bb019f622
