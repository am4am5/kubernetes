systemctl enable --now kubelet

kubeadm config images pull

kubeadm init --pod-network-cidr=10.244.0.0/16 --control-plane-endpoint=knext-master.kali.local --apiserver-cert-extra-sans=knext-master.kali.local,10.192.3.20 --upload-certs

#--control-plane
kubeadm join knext-master.kali.local:6443 --token nd2ysj.j2wnzd470hsedxg5 --discovery-token-ca-cert-hash sha256:a9de30efeb6e18160b5c3b3c5a445740a1d2b34b07420b278969329fda95b983 --control-plane --certificate-key f5e7c49ce4767b3b88898c2d6882418df0a665e12cdd970f634e646ac45764cd

#worker
kubeadm join knext-master.kali.local:6443 --token nd2ysj.j2wnzd470hsedxg5 --discovery-token-ca-cert-hash sha256:a9de30efeb6e18160b5c3b3c5a445740a1d2b34b07420b278969329fda95b983


kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml

kubeadm token create --print-join-command

#1node taint:
kubectl taint node mdastend node-role.kubernetes.io/control-plane:NoSchedule-
