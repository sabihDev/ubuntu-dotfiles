# Add this at the end of your ~/.zshrc file
neofetch
# If you come from bash you might have to change your $PATH.
# It's good practice to manage your PATH carefully.
# Adding $HOME/bin and $HOME/.local/bin at the beginning is common for user-installed binaries.
# Your brew path is handled at the end, so no need to explicitly add it here.
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# It's recommended to update Oh My Zsh automatically to keep it secure and up-to-date.
# This sets it to update automatically without asking.
zstyle ':omz:update' mode auto

# Enable command auto-correction. This is very helpful for typos.
ENABLE_CORRECTION="true"

alias ghostty-crt='sed -i "s|shader-path = .*|shader-path = ~/.config/ghostty/shaders/crt.wgsl|" ~/.config/ghostty/config && pkill -USR1 ghostty'
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# Recommended essential plugins:
# git: Essential for Git-related aliases and functions.
# zsh-autosuggestions: Suggests commands as you type based on history.
# zsh-syntax-highlighting: Highlights commands as you type, indicating validity.
# z: Jump to directories quickly based on frecency (zoxide is a good alternative too).
# sudo: Adds 'sudo' to the previous command by pressing Esc-Esc.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  # z # Uncomment if you want z plugin (otherwise consider zoxide)
  # sudo
)

# Source Oh My Zsh. This must be done before custom configurations or plugins.
source "$ZSH/oh-my-zsh.sh"

# --- User Configuration ---

# Set your preferred editor for various command-line tools.
# 'nvim' (Neovim) is the modern choice.
export EDITOR="nvim"
export VISUAL="nvim"

# Aliases: Custom shortcuts for frequently used commands.
# It's often cleaner to put many aliases in a separate file in $ZSH_CUSTOM
# (e.g., ~/.oh-my-zsh/custom/aliases.zsh) but for a few, here is fine.

# Custom aliases
alias la="eza --long --color=always --icons=always --no-user" # Use eza for a modern ls replacement


# Basic directory navigation aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# LS aliases for better output
alias ls='ls --color=auto' # Enable colors for 'ls'
alias ll='ls -alF'         # Long listing, all files, show file type, color
alias la='ls -A'           # List all files including hidden, but not . and ..
alias l='ls -CF'           # Compact listing, show file type, color

# Git aliases (some are provided by the git plugin, but custom ones are useful)
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --decorate --all --graph'

# Neovim aliases
alias vim="nvim" # Ensures 'vim' command opens Neovim
alias vi="nvim"  # Ensures 'vi' command opens Neovim

# Ranger alias
alias r="ranger" # Shortcut for Ranger

# Clear the terminal screen
alias c="clear"

# Use 'eza' for a modern replacement of 'ls'
alias ls="eza --long --color=always --icons=always --no-user"
# Use 'bat' for a modern replacement of 'cat'
alias b="bat"
# Use 'fd' for a modern replacement of 'find'
alias find="fd --color=always --type f" # Use fd for file searching

# Use 'rg' (ripgrep) for a modern replacement of 'grep'
alias grep="rg --color=always" # Use ripgrep for searching text in files
# Use 'tree' for a directory tree view
alias tree="tree -C" # Colorized tree view of directories
# Use 'htop' for an interactive process viewer
alias htop="htop" # Interactive process viewer

alias df="df -h" # Human-readable disk space usage

# map to fzf for fuzzy finding
alias f="fzf" # Use fzf for fuzzy finding files and directories

# sys Aliases
alias sysinfo="neofetch" # Show system information using neofetch
alias sysupdate="sudo apt update && sudo apt upgrade -y" # Update system packages (Debian/Ubuntu)
alias sysclean="sudo apt autoremove -y && sudo apt autoclean" # Clean up unused packages (Debian/Ubuntu)

# System updates (example - adjust for your distro)
# alias update="sudo apt update && sudo apt upgrade -y" # For Debian/Ubuntu
# alias update="sudo pacman -Syu" # For Arch Linux

# --- External Tool Initializations ---
# These should generally come after Oh My Zsh is sourced and your custom configs.

# This should be the last thing in your .zshrc to ensure all other PATHs are set.
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(fzf --zsh)"
# Optional: Initialize Zoxide for faster directory jumping if you prefer it over OMZ's 'z' plugin.
# If you install zoxide, uncomment the line below and remove 'z' from plugins.
# eval "$(zoxide init zsh)"

# Optional: Initialize direnv for per-directory environment variables.
# If you install direnv, uncomment the line below.
# eval "$(direnv hook zsh)"
# --- Ranger Function for CD on Exit ---
# This function allows Ranger to change your shell's current directory
# to the last directory you were in inside Ranger.
function ranger-cd {
    # This command uses Ranger's --choosedir flag, which writes the
    # last visited directory to a temporary file.
    temp_file=$(mktemp -t "ranger_cd_XXXXX")
    ranger --choosedir="$temp_file" "$@"
    target_dir=$(<"$temp_file") # Read the directory from the temp file
    rm -f "$temp_file"          # Delete the temporary file

    if [ -d "$target_dir" ]; then # Check if the directory exists
        cd "$target_dir" || return 1 # Change directory, return if it fails
    fi
}

# Alias 'r' to the new function
alias r="ranger-cd"
alias n="nvim"

alias g="gcc"
alias rc="./a.out"

alias py="python3"

eval "$(starship init zsh)"
