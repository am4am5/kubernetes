#openssl genrsa -out jenkins.key 2048 && openssl req -new -key jenkins.key -out jenkins.csr -subj "/CN=jenkins/O=aismv" && openssl x509 -req -in jenkins.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out jenkins.crt -days 3650

kubeadm alpha kubeconfig user --client-name=jenkins --apiserver-advertise-address 172.16.9.47 > jenkins.conf
kubeadm alpha kubeconfig user --client-name=jenkins --apiserver-advertise-address 172.20.238.229 > jenkins.conf
