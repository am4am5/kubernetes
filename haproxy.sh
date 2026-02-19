docker run -d --restart always --name haproxy --user 1000 --sysctl net.ipv4.ip_unprivileged_port_start=0 -p 6443:6443 -p 443:443 -v /opt/config:/usr/local/etc/haproxy:ro edoiba/haproxy:3
.3.2
