set -x EDITOR nvim

# Nix setup
#set PATH ~/.nix-profile/bin $PATH
#set -x NIX_PATH ~/.nix-defexpr/channels $NIX_PATH

# Rust setup
set PATH ~/.cargo/bin $PATH
set -x RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src

# fzf
source ~/.config/fish/functions/fzf_key_bindings.fish && fzf_key_bindings
set -x FZF_DEFAULT_COMMAND fd .
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_ALT_C_COMMAND fd -t d . $HOME

# Others
set -x PYTHONDONTWRITEBYTECODE 1
set PATH ~/tools/bin $PATH
set PATH ~/tools/ansible_bin $PATH
set PATH ~/.nix-profile/bin $PATH
fish_add_path /opt/homebrew/opt/curl/bin

if test (uname) = "Darwin"
    set -x NIX_SSL_CERT_FILE /etc/ssl/cert.pem

    if test (arch) = "arm64"
        eval (/opt/homebrew/bin/brew shellenv)
    else
        eval (/usr/local/bin/brew shellenv)
    end
end

# Functions
function ara
    if count $argv > /dev/null
        7z a -t7Z $argv[1].7z $argv[1]
    else
        echo "Error: Supply file to archive"
    end
end

function fish_greeting
    fortune
end

# Aliases
abbr -a autochrome ~/.local/autochrome/chrome --remote-debugging-port=9222
abbr -a cat bat --paging=never
