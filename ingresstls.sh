openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=EDO/O=IBA"

kubectl -n ingress create secret tls edo-tls --key tls.key --cert tls.crt

  annotations:
    nginx.ingress.kubernetes.io/backend-protocol: "HTTPS"
