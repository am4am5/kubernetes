nano .bashrc

alias u='dnf update --nobest'
alias k='kubectl -n dev'
alias kp='kubectl get po -owide -n dev'
alias kn='kubectl get no -owide'
alias ka='kubectl apply -f'
alias kl='kubectl -n dev logs -f'
alias kd='kubectl -n dev describe po'
alias ktn='kubectl top no'
alias ktp1='kubectl top po -A --sort-by cpu'
alias ktp2='kubectl top po -A --sort-by memory'
alias h='helm -n dev'
alias hp='helm pull --untar'
alias docker='podman'
export KUBE_EDITOR=/usr/bin/nano

source .bashrc
