$ kubectl get pods -n aismv --no-headers=true | awk '/pattern1|pattern2/{print $1}'| xargs  kubectl delete -n aismv pod
$ kubectl get services -n aismv --no-headers=true | awk '/aismv-back|aismv-router/aismv-front/{print $1}' | xargs  kubectl delete -n mynamespace service
