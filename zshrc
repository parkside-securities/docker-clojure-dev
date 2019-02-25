eval "$(direnv hook zsh)"

if [ -f /root/.zshrc_pksd ]; then
    source /root/.zshrc_pksd
fi

source /root/.zsh-git-prompt/zshrc.sh
PROMPT='%B%F{2}%m%f %F{3}%~%f%b$(git_super_status)
👉 '

export PATH="/root/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
