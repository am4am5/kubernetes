kubeadm certs check-expiration

kubeadm certs renew all --cert-duration=78840h0m0s

kubectl -n kube-system edit cm kubeadm-config
certificateValidityPeriod: 78840h0m0s

cp /etc/kubernetes/admin.conf ~/.kube/config
