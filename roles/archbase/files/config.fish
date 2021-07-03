# config.fish

# ** MANAGED BY ANSIBLE. CHANGES WILL BE OVERWRITTEN. **

starship init fish | source

alias ls='exa --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias vim='nvim'
alias sudo='sudo '
alias apv='ansible-playbook --ask-vault-pass'
alias cat='bat --theme Dracula'

# flags
alias df='df -h'

# remove fish banner
set fish_greeting