firewall-cmd --permanent --zone=trusted --add-interface=flannel.1
firewall-cmd --permanent --zone=trusted --add-interface=cni0
firewall-cmd --zone=trusted --list-all
