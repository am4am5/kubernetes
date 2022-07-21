openssl req -x509 -sha256 -nodes -days 3650 -newkey rsa:2048 -keyout tls.key -out tls.crt -extfile tls.cfg

#nano tls.cfg
[req]
req_extensions = v3_req
distinguished_name = req_distinguished_name
prompt = no

[req_distinguished_name]
C = BY
ST = Minsk
L = Minsk
O = IBA
OU = EDO
CN = edo.iba

[v3_req]
subjectAltName = @alt_names

[alt_names]
DNS.1 = edo.iba
DNS.2 = *.edo.iba


openssl genrsa -out tls.key 2048
openssl rsa -in tls.key -out tls.crt
openssl req -new -key tls.crt -out tls.csr
openssl x509 -req -extensions v3_req -days 3650 -in tls.csr -signkey tls.key -out tls.crt -extfile tls.cfg


kubectl -n dev create secret tls edo-tls --key tls.key --cert tls.crt

k edit deploy ingress-nginx-controller
        - --default-ssl-certificate=dev/edo-tls

annotations:
    nginx.ingress.kubernetes.io/backend-protocol: "HTTPS"
