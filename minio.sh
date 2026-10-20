k exec -it system-s3-minio-69cd6bf646-mfrdt -- bash
cd /tmp/
mc mirror local/ /tmp
tar -czvf wb-minio.tgz edms/
k cp system-s3-minio-69cd6bf646-mfrdt:/tmp/wb-minio.tgz ./wb-minio.tgz
mkdir minio
tar -xvf wb-minio.tgz -C ./minio/ 
