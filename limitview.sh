k get po/<pod> -o json | jq ".spec.containers[1].resources"
