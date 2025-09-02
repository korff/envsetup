if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    # Set up fzf key bindings
    fzf --fish | source
    # Set default editor
    set -Ux EDITOR nvim
end
