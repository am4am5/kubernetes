k scale deploy -n kubegres-system kubegres-controller-manager --replicas=0

k patch sts testdb-2 --patch '{"spec": {"template": {"spec": {"priorityClassName": "kubegres"}}}}'
