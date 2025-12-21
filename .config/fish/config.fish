setenv EDITOR $HOME/.local/bin/ed
setenv BROWSER /usr/bin/microsoft-edge-beta





# toolchains
source "$HOME/.cargo/env.fish"

if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    set -gx PATH /nix/var/nix/profiles/default/bin $PATH
    set -gx NIX_PATH $HOME/.nix-defexpr/channels
    set -gx NIX_PROFILES "/nix/var/nix/profiles/default $HOME/.nix-profile"
    set -gx NIX_SSL_CERT_FILE /nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt
    set -gx PATH $HOME/.nix-profile/bin $PATH
end

direnv hook fish | source



#set -gx PATH "$HOME/.miniconda/bin" $PATH
#set -gx PATH "$HOME/.juliaup/bin" $PATH
#set -x LD_LIBRARY_PATH /usr/lib $LD_LIBRARY_PATH
#source "/home/haxfn/Repos/emsdk/emsdk_env.fish"

# note: this does eval (opam env) alongside some variable set up 
# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
# test -r '/home/haxfn/.opam/opam-init/init.fish' && source '/home/haxfn/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration

#set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /Users/haxfn/.ghcup/bin $PATH # ghcup-env




function fish_user_key_bindings
    # fish_vi_key_bindings
    bind \ck kill-line
end


if status --is-interactive
    alias wd 'cd (cat $HOME/.cache/workingdir)'
    abbr -a gd "cd (git rev-parse --show-toplevel)"
    abbr -a ed '$EDITOR'

    abbr -a la 'eza -la --group-directories-last'
    abbr -a ls `eza -a1`

    # note: need to move this to be in make files
    abbr -a gcc 'gcc -Wall -Wextra -Wshadow -std=c23 -O2 -o main'
    abbr -a g++ 'g++ -Wall -Wextra -Wshadow -std=c++23 -O2 -o main'

    # set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
    # carapace _carapace | source



    # Fish git prompt
    set __fish_git_prompt_showuntrackedfiles yes
    set __fish_git_prompt_showdirtystate yes
    set __fish_git_prompt_showstashstate ''
    set __fish_git_prompt_showupstream none
    set -g fish_prompt_pwd_dir_length 1
    set __fish_git_prompt_shorten_branch_len 15

    #starship init fish | source

    # theming
    #sh ~/.config/fish/themes/base16-apathy.sh
end



function fish_prompt
    # Left: [ haxfn ] in bold, white brackets
    set_color -d white
    echo -n "[ "
    set_color normal
    set_color -o green
    echo -n (whoami)
    set_color normal
    set_color -d white
    echo -n " ] ₹ "
    set_color normal
end

function fish_right_prompt
    set_color blue
    #echo -n (date +'%H:%M:%S')
    echo (math "floor($CMD_DURATION / 1000 / 60)")"m"
    set_color white
    echo -n " : "
    set_color red
    echo -n (fish_git_prompt)
    echo -n " : "
    set_color white
    echo -n (prompt_pwd)
    set_color white
    echo -n " : "
    set_color blue
    echo -n "( "
    set_color -o green
    echo -n (hostname -s)
    set_color normal
    set_color blue
    echo -n " )"
    set_color normal
end



# Vishal (@haxfn)
