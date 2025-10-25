if status --is-interactive
    abbr -a g git
    abbr -a ga 'git add -p'
    abbr -a gc 'git checkout'
    abbr -a gs 'git status'
    abbr -a gdiff 'git diff'
    abbr -a gd "cd (git rev-parse --show-toplevel)"
    abbr -a ed '$EDITOR'
    abbr -a l eza
    abbr -a la 'eza -la --group-directories-last'
    abbr -a ll 'eza -l'
    abbr -a ls eza
    abbr -a o xdg-open
    abbr -a p 'sudo pacman'
    abbr -a pi 'sudo pacman -S'
    abbr -a pu 'sudo pacman -Syu'
    abbr -a dl trash
    abbr -a gcc 'gcc -Wall -Wextra -Wshadow -std=c23 -O2 -o main'
    abbr -a g++ 'g++ -Wall -Wextra -Wshadow -std=c++23 -O2 -o main'
    # abbr -a y yazi
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
    
    alias wd 'cd (cat $HOME/.cache/workingdir)'
    alias clear 'tput cup $LINES; commandline ""'
    function fish_user_key_bindings
        # fish_vi_key_bindings
        # bind \cl 'clear; commandline -f repaint'
        bind \ck kill-line
        bind \ey y
        bind \el 'clear; eza; commandline -f repaint;'
    end

    # set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
    # carapace _carapace | source

    # lang-toolchains
    #set -gx PATH "$HOME/.miniconda/bin" $PATH
    source "$HOME/.cargo/env.fish"
    #opam env | source
    #set -gx PATH "$HOME/.juliaup/bin" $PATH
    set -gx PATH "$HOME/.local/bin" $PATH
    #set -x LD_LIBRARY_PATH /usr/lib $LD_LIBRARY_PATH

    
    # source "/home/haxfn/Repos/emsdk/emsdk_env.fish"

    setenv EDITOR $HOME/.local/bin/ed
    setenv DOTFILES $HOME/Documents/configs
    setenv BROWSER /usr/bin/microsoft-edge-stable
    
    starship init fish | source

    # Fish git prompt
    set __fish_git_prompt_showuntrackedfiles yes
    set __fish_git_prompt_showdirtystate yes
    set __fish_git_prompt_showstashstate ''
    set __fish_git_prompt_showupstream none
    set -g fish_prompt_pwd_dir_length 1
    set __fish_git_prompt_shorten_branch_len 15

    # theming
    sh ~/.config/fish/themes/base16-github-light.sh
end

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/haxfn/.opam/opam-init/init.fish' && source '/home/haxfn/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration

# note to self: this does eval (opam env) alongside some variable set up 
