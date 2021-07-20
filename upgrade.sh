master:
dnf -y update --nobest && kubeadm upgrade plan && kubeadm upgrade apply v1.21.3
systemctl daemon-reload && systemctl restart kubelet && systemctl status kubelet

workers:
dnf -y update --nobest && kubeadm upgrade node && systemctl daemon-reload && systemctl restart kubelet && systemctl status kubelet
