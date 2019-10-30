crictl images
crictl images -q | xargs -n 1 crictl rmi
crictl images
