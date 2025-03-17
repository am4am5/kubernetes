alias u='dnf update'
alias k='kubectl -n dev'
alias kp='kubectl get po -owide -n dev'
alias kn='kubectl get no -owide'
alias ka='kubectl apply -f'
alias kd='kubectl describe po -n dev'
alias kl='kubectl logs -f -n dev'
alias h='helm -n dev'
alias docker='podman'

export KUBE_EDITOR=/usr/bin/nano
