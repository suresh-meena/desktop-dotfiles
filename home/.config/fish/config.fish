source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
end
export PATH="$HOME/.local/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/suresh/miniforge3/bin/conda
    eval /home/suresh/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/suresh/miniforge3/etc/fish/conf.d/conda.fish"
        . "/home/suresh/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/suresh/miniforge3/bin" $PATH
    end
end
# <<< conda initialize <<<



# Added by Antigravity CLI installer
set -gx PATH "/home/suresh/.local/bin" $PATH
