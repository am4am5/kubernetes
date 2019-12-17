kubectl run -it --rm --restart=Never alpine --image=alpine sh

apk update

#telnet
apk add busybox-extras

apk add curl

#skip ssl
curl -k https://<url>
