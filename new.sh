systemctl enable --now kubelet

firewall-cmd --add-port=6443 --permanent && firewall-cmd --add-port=10250 --permanent && firewall-cmd --add-port=2379-2380 --permanent && firewall-cmd --reload

kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.92.254 --control-plane-endpoint=nansed

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

kubeadm token create --print-join-command

#1node taint:
kubectl taint node mdastend node-role.kubernetes.io/control-plane:NoSchedule-
