eval "$(direnv hook bash)"
export PATH="/root/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
source /root/.kube-ps1/kube-ps1.sh
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_START='[$(kube_ps1)]'
GIT_PROMPT_END='\n\[\033[0;33m\]\w\[\033[0;0m\]\n# '
source /root/.bash-git-prompt/gitprompt.sh

if [ -f /root/.bashrc_pksd ]; then
    source /root/.bashrc_pksd
fi

export PATH="/root/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

