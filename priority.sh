# spec.template.spec.priorityClassName: kubegres

k patch sts testdb-2 --patch '{"spec": {"template": {"spec": {"priorityClassName": "kubegres"}}}}'
