eval "$(direnv hook zsh)"

if [ -f /root/.zshrc_pksd ]; then
    source /root/.zshrc_pksd
fi

source /root/.zsh-git-prompt/zshrc.sh
PROMPT='%B%F{2}%m%f %F{3}%~%f%b$(git_super_status)
👉 '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
