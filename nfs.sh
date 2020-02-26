dnf install nfs-utils

systemctl enable --now nfs-server

echo "/srv/nfs         192.168.0.0/24(rw,sync,no_subtree_check,fsid=0)" > /etc/exports

exportfs -ra
exportfs -v

chmod 777 /srv/nfs
