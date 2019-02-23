eval "$(direnv hook bash)"
export PATH="/root/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
GIT_PROMPT_ONLY_IN_REPO=1
source /root/.bash-git-prompt/gitprompt.sh

if [ -f /root/.bashrc_pksd ]; then
    source /root/.bashrc_pksd
fi

export PATH="/root/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
