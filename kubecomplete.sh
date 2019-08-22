#!/bin/bash
echo -e " source <(kubectl completion bash)\n alias k=kubectl\n complete -F __start_kubectl k
" >> ~/.bashrc
