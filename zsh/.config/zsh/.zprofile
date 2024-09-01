if [[ `uname` == "Darwin" ]]; then
    if type brew > /dev/null; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi
