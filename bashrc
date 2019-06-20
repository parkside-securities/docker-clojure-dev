export PATH="/root/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
source /root/.kube-ps1/kube-ps1.sh
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_START='[$(kube_ps1)]'
GIT_PROMPT_END='\[\033[0;33m\]\w\[\033[0;0m\]\n# '
unset PROMPT_COMMAND
source /root/.bash-git-prompt/gitprompt.sh

_kube_contexts()
{
  local curr_arg;
  curr_arg=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "- $(kubectl config get-contexts --output='name')" -- $curr_arg ) );
}

complete -F _kube_contexts kubectx kctx

if [ -f /root/.bashrc_pksd ]; then
    source /root/.bashrc_pksd
fi

export PATH="/root/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

eval "$(direnv hook bash)"
