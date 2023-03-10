# spec.template.spec.priorityClassName: kubegres

k patch sts patch-demo --patch '{"spec": {"template": {"spec": {"priorityClassName": "kubegres"}}}}'
