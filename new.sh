systemctl enable --now kubelet

kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=nansed --control-plane-endpoint=nansed

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

kubeadm token create --print-join-command

#1node taint:
kubectl taint node mdastend node-role.kubernetes.io/control-plane:NoSchedule-
