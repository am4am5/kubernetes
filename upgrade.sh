master:
kubeadm upgrade plan
kubeadm upgrade apply v1.16.3
systemctl daemon-reload
systemctl restart kubelet
systemctl status kubelet

workers:
kubeadm upgrade node && systemctl daemon-reload && systemctl restart kubelet && systemctl status kubelet
