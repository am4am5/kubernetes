master:
kubeadm upgrade plan
kubeadm upgrade apply v1.17.4
systemctl daemon-reload
systemctl restart kubelet
systemctl status kubelet

workers:
dnf -y update && kubeadm upgrade node && systemctl daemon-reload && systemctl restart kubelet && systemctl status kubelet
