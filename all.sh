# all.sh — dev aliases for a fullstack AI engineer
# Source in ~/.bashrc or ~/.zshrc:
#   source /path/to/all.sh

# ─────────────────────────────────────────────
# NAVIGATION & GENERAL
# ─────────────────────────────────────────────
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias bashrc='source ~/.bashrc 2>/dev/null || source ~/.zshrc 2>/dev/null'
alias df='df -h'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lahF'
alias mkdir='mkdir -p'
alias path='echo $PATH | tr ":" "\n"'
alias ports='ss -tulanp'

extract() {
  case "$1" in
    *.tar.bz2)  tar xjf "$1"   ;;
    *.tar.gz)   tar xzf "$1"   ;;
    *.tar.xz)   tar xJf "$1"   ;;
    *.tar)      tar xf  "$1"   ;;
    *.bz2)      bunzip2 "$1"   ;;
    *.gz)       gunzip  "$1"   ;;
    *.zip)      unzip   "$1"   ;;
    *.7z)       7z x    "$1"   ;;
    *.rar)      unrar x "$1"   ;;
    *)          echo "Unknown archive: $1" ;;
  esac
}

# ─────────────────────────────────────────────
# GIT
# ─────────────────────────────────────────────
alias g='git'
alias ga='git add'
alias gau='git add -u'
alias gb='git branch'
alias gca='git commit --amend'
alias gcane='git commit --amend --no-edit'
alias gcl='git clone'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gds='git diff --staged'
alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gl='git log --oneline --graph --decorate'
alias gla='git log --oneline --graph --decorate --all'
alias glp='git log --pretty=format:"%C(yellow)%h%Creset %C(blue)%an%Creset %C(green)%ar%Creset %s"'
alias gpff='git push --force-with-lease'
alias gpl='git pull'
alias gpr='git pull --rebase'
alias grba='git rebase --abort'
alias grbi='git rebase -i'
alias grc='git rebase --continue'
alias gs='git status'

# Apply a stash by index (default: 0) without popping it
gsa() { git stash show -p "stash@{${1:-0}}" | git apply; }

# Reverse-apply a stash by index (default: 0) — undo a previously applied stash
gsaa() { git stash show -p "stash@{${1:-0}}" | git apply -R; }

alias gsl='git stash list'
alias gst='git stash'
alias gsts='git stash show -p'

# ─────────────────────────────────────────────
# KUBERNETES
# ─────────────────────────────────────────────
alias k='kubectl'
alias kaf='kubectl apply -f'
alias kcctx='kubectl config current-context'
alias kctx='kubectl config use-context'
alias kd='kubectl describe'
alias kdd='kubectl describe deployment'
alias kdel='kubectl delete'
alias kdeld='kubectl delete deployment'
alias kdelp='kubectl delete pod'
alias kdf='kubectl delete -f'
alias kdn='kubectl describe node'
alias kdp='kubectl describe pod'
alias kds='kubectl describe service'
alias ke='kubectl exec -it'
alias kedit='kubectl edit'
alias kg='kubectl get'
alias kgcm='kubectl get configmaps'
alias kgctx='kubectl config get-contexts'
alias kgd='kubectl get deployments'
alias kgda='kubectl get deployments --all-namespaces'
alias kging='kubectl get ingress'
alias kgn='kubectl get nodes'
alias kgns='kubectl get namespaces'
alias kgp='kubectl get pods'
alias kgpa='kubectl get pods --all-namespaces'
alias kgpvc='kubectl get pvc'
alias kgpw='kubectl get pods -w'
alias kgs='kubectl get services'
alias kgsa='kubectl get services --all-namespaces'
alias kgsec='kubectl get secrets'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias klp='kubectl logs -f --previous'
alias kns='kubectl config set-context --current --namespace'
alias kpf='kubectl port-forward'
alias kroll='kubectl rollout'
alias krollr='kubectl rollout restart'
alias krolls='kubectl rollout status'
alias krollu='kubectl rollout undo'
alias krun='kubectl run'
alias kscale='kubectl scale'
alias kseal='kubeseal'
alias ktopn='kubectl top nodes'
alias ktopp='kubectl top pods'

# ─────────────────────────────────────────────
# DOCKER
# ─────────────────────────────────────────────
alias cu='docker compose up'
alias cud='docker compose up -d'
alias d='docker'
alias dbuild='docker build -t'
alias dc='docker compose'
alias dcb='docker compose build'
alias dcl='docker compose logs'
alias dclf='docker compose logs -f'
alias dcps='docker compose ps'
alias dcpull='docker compose pull'
alias dcr='docker compose restart'
alias ddv='docker compose down -v'
alias de='docker exec -it'
alias di='docker images'
alias dia='docker images -a'
alias dip='docker inspect'
alias dl='docker logs'
alias dlf='docker logs -f'
alias dnet='docker network ls'
alias dprune='docker system prune'
alias dprunef='docker system prune -af'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dpull='docker pull'
alias dpush='docker push'
alias drm='docker rm'
alias drmf='docker rm -f'
alias drmi='docker rmi'
alias drmia='docker rmi $(docker images -q) 2>/dev/null || true'
alias drun='docker run --rm -it'
alias dstart='docker start'
alias dstats='docker stats --no-stream'
alias dstop='docker stop'
alias dstopa='docker stop $(docker ps -q) 2>/dev/null || true'
alias dvol='docker volume ls'

# ─────────────────────────────────────────────
# TERRAFORM
# ─────────────────────────────────────────────
alias tf='terraform'
alias tfa='terraform apply'
alias tfaa='terraform apply -auto-approve'
alias tfaplan='terraform apply tfplan'
alias tfd='terraform destroy'
alias tfda='terraform destroy -auto-approve'
alias tff='terraform fmt'
alias tfff='terraform fmt -recursive'
alias tfi='terraform init'
alias tfiu='terraform init -upgrade'
alias tflint='tflint --recursive'
alias tfo='terraform output'
alias tfoj='terraform output -json'
alias tfp='terraform plan'
alias tfpo='terraform plan -out=tfplan'
alias tfsl='terraform state list'
alias tfsr='terraform state rm'
alias tfss='terraform state show'
alias tfv='terraform validate'
alias tfwdel='terraform workspace delete'
alias tfwl='terraform workspace list'
alias tfwn='terraform workspace new'
alias tfwsel='terraform workspace select'
alias tfws='terraform workspace show'

# ─────────────────────────────────────────────
# PYTHON / AI / ML
# ─────────────────────────────────────────────
alias act='source .venv/bin/activate 2>/dev/null || source venv/bin/activate'

# ─────────────────────────────────────────────
# AWS
# ─────────────────────────────────────────────
alias asso='aws sso login'
alias awsid='aws sts get-caller-identity'
alias awsprof='aws configure list-profiles'
alias awsreg='aws configure get region'

# ─────────────────────────────────────────────
# SSH / NETWORKING
# ─────────────────────────────────────────────
alias curlj='curl -s -H "Content-Type: application/json"'
alias genkey='ssh-keygen -t ed25519 -C'
alias sshconf='cat ~/.ssh/config'
alias sshkeys='ls -la ~/.ssh/'
