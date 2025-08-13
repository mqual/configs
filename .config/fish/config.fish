if status --is-interactive
    abbr -a g git
    abbr -a ga 'git add -p'
    abbr -a gc 'git checkout'
    abbr -a gs 'git status'
    abbr -a gd 'git diff'
    abbr -a hx '$EDITOR'
    abbr -a l eza
    abbr -a la 'eza -la --group-directories-last'
    abbr -a ll 'eza -l'
    abbr -a ls eza
    abbr -a o xdg-open
    abbr -a p 'sudo pacman'
    abbr -a pi 'sudo pacman -S'
    abbr -a pu 'sudo pacman -Syu'
    abbr -a rm trash
    abbr -a wd 'cd (cat $HOME/workingdir)'
    # abbr -a y yazi
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
    function fish_user_key_bindings
        # fish_vi_key_bindings
        bind \cz 'fg 2>/dev/null; commandline -f repaint'
        bind \ck kill-line
        bind \ey y
        # bind \cc 'commandline ""'
        bind \cl 'commandline "eza -al"; commandline -f execute;' #' commandline -f repaint'
        # bind \cl 'eza -al' # 'commandline ""'
        alias clear 'commandline ""'
    end

    # lang-toolchains
    #set -gx PATH "$HOME/.miniconda/bin" $PATH
    source "$HOME/.cargo/env.fish"
    #opam env | source
    #set -gx PATH "$HOME/.juliaup/bin" $PATH
    set -gx PATH "$HOME/.local/bin" $PATH

    setenv EDITOR $HOME/.local/bin/hx
    setenv DOTFILES $HOME/Documents/configs
    setenv BROWSER /usr/bin/firefox # vivaldi-stable

    # Fish git prompt
    set __fish_git_prompt_showuntrackedfiles yes
    set __fish_git_prompt_showdirtystate yes
    set __fish_git_prompt_showstashstate ''
    set __fish_git_prompt_showupstream none
    set -g fish_prompt_pwd_dir_length 1

    # theming
    # source theme.fish
end
