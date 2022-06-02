set -x EDITOR nvim

# Rust setup
fish_add_path ~/.cargo/bin
set -x RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src

# fzf
source ~/.config/fish/functions/fzf_key_bindings.fish && fzf_key_bindings
set -x FZF_DEFAULT_COMMAND fd .
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_ALT_C_COMMAND fd -t d . $HOME

# Others
set -x PYTHONDONTWRITEBYTECODE 1
fish_add_path /opt/homebrew/opt/curl/bin
fish_add_path /opt/homebrew/opt/zip/bin
fish_add_path /opt/homebrew/opt/sqlite/bin
fish_add_path /opt/homebrew/opt/openssl@1.1/bin

if test (uname) = "Darwin"
    if test (arch) = "arm64"
        eval (/opt/homebrew/bin/brew shellenv)
        fish_add_path /opt/homebrew/bin
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
abbr -a vim nvim
