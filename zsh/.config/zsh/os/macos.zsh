# FZF
fzf_version=""
if type "fzf" > /dev/null; then
    fzf_version=`fzf --version | awk '{ print $1 }'`

    source /opt/homebrew/Cellar/fzf/$fzf_version/shell/key-bindings.zsh
    source /opt/homebrew/Cellar/fzf/$fzf_version/shell/completion.zsh
fi

