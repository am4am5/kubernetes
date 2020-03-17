#openssl genrsa -out jenkins.key 2048 && openssl req -new -key jenkins.key -out jenkins.csr -subj "/CN=jenkins/O=aismv" && openssl x509 -req -in jenkins.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out jenkins.crt -days 3650

kubeadm alpha kubeconfig user --client-name=jenkins --apiserver-advertise-address 172.16.9.47 > jenkins.conf
kubeadm alpha kubeconfig user --client-name=jenkins --apiserver-advertise-address 172.20.238.229 > jenkins.conf

kubectl config set-context --current --namespace=aismv

#jenkins role & rolebinding
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  namespace: aismv
  name: jenkins
rules:
- apiGroups: ["", "extensions", "apps"]
  resources: ["*"]
  verbs: ["*"]
  ---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: jenkins
  namespace: aismv
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: jenkins
subjects:
- apiGroup: rbac.authorization.k8s.io
  kind: User
  name: jenkins

  
  
